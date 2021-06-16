module Spend exposing (spends)

import Array exposing (Array)
import Data exposing (Spend, getCategory, getCategoryMaximum, sellCats, spendList)
import Html exposing (Html, br, div, h1, table, tbody, td, text, th, thead, tr)
import Html.Attributes exposing (attribute, style)
import Round as R


renderSpend : Spend -> Html msg
renderSpend spend =
    tr []
        [ td [] [ text spend.date ]
        , td [] [ text (getCategory spend.cat) ]
        , td [] [ text (String.fromFloat spend.sum ++ " (" ++ String.fromFloat spend.sum_plus ++ ")") ]
        , td [] [ text spend.name ]
        ]


renderSpends : List Spend -> Html msg
renderSpends data =
    let
        list =
            List.map renderSpend data
    in
    tbody [] list


baseSum : Float
baseSum =
    List.map .sum spendList |> List.sum


fullSum : Float
fullSum =
    List.map .sum_plus spendList |> List.sum


sumByCategory : List Float
sumByCategory =
    List.repeat (Array.length sellCats) 0


renderCategory : ( Int, Float ) -> ( Float, Int, Float )
renderCategory data =
    List.filter (\n -> n.cat == Tuple.first data) spendList
        |> List.map .sum_plus
        |> List.sum
        |> R.round 2
        |> String.toFloat
        |> Maybe.withDefault 0
        |> (\res -> ( res, getCategoryMaximum (Tuple.first data), toFloat (getCategoryMaximum (Tuple.first data)) - res ))


renderCategories : List Float -> Html msg
renderCategories data =
    let
        values =
            List.indexedMap Tuple.pair data
                |> List.map renderCategory

        renderValues =
            List.map
                (\( spent, maximum, difference ) ->
                    td
                        [ style "background-color"
                            (if difference < 0 then
                                "red"

                             else
                                ""
                            )
                        ]
                        [ text (String.fromFloat spent ++ " из " ++ String.fromInt maximum) ]
                )
                values

        renderLefts =
            List.map
                (\( _, _, difference ) ->
                    td
                        [ style "background-color"
                            (if difference < 0 then
                                "red"

                             else
                                ""
                            )
                        ]
                        [ text (String.fromFloat difference) ]
                )
                values
    in
    tbody []
        [ tr [] renderValues
        , tr [] renderLefts
        ]


spends : Html msg
spends =
    div []
        [ h1 [] [ text "На текущий месяц категории" ]
        , table
            [ attribute "border" "1"
            , attribute "width" "100%"
            ]
            [ thead []
                [ tr []
                    [ th [] [ text "Матрас" ]
                    , th [] [ text "Ремонт машины" ]
                    , th [] [ text "Отложения" ]
                    , th [] [ text "Проезд" ]
                    , th [] [ text "Сигареты" ]
                    , th [] [ text "Одежда" ]
                    , th [] [ text "Квартира" ]
                    , th [] [ text "Прочее" ]
                    , th [] [ text "Вернут" ]
                    ]
                ]
            , renderCategories sumByCategory
            ]
        , br [] []
        , br [] []
        , h1 [] [ text "Список трат за месяц" ]
        , table
            [ attribute "border" "1"
            , attribute "width" "30%"
            ]
            [ thead []
                [ tr []
                    [ th [] [ text "Дата" ]
                    , th [] [ text "Категория" ]
                    , th [] [ text "Сумма (полная)" ]
                    , th [] [ text "Комментарий" ]
                    ]
                ]
            , renderSpends spendList
            , tr []
                [ td [] []
                , th [] [ text "Всего: " ]
                , th [] [ text (R.round 2 baseSum ++ " (" ++ R.round 2 fullSum ++ ")") ]
                , th [] [ text ("В копилку: " ++ R.round 2 (fullSum - baseSum)) ]
                ]
            ]
        ]
