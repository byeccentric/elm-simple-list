module Main exposing (main)

import Html exposing (Html, br, div, h1, table, tbody, td, text, th, thead, tr)
import Html.Attributes exposing (attribute)
import Spend exposing (spends)


main =
    div []
        [ h1 []
            [ text "Общее положение" ]
        , table
            [ attribute "border" "1"
            , attribute "width" "100%"
            ]
            [ thead []
                [ tr []
                    [ th [] [ text "Месяц" ]
                    , th [] [ text "Вклад" ]
                    , th [] [ text "ИИС" ]
                    , th [] [ text "Инвест счет" ]
                    , th [] [ text "Инвест копилка" ]
                    , th [] [ text "На девайсы" ]
                    , th [] [ text "На одежду" ]
                    , th [] [ text "На путешествия" ]
                    ]
                ]
            , tbody []
                [ tr []
                    [ td [] [ text "Июнь" ]
                    , td [] [ text "606 499.8" ]
                    , td [] [ text "21 875.61" ]
                    , td [] [ text "41 513.92" ]
                    , td [] [ text "18 819.36" ]
                    , td [] [ text "0" ]
                    , td [] [ text "0" ]
                    , td [] [ text "0" ]
                    ]
                ]
            ]
        , br [] []
        , br [] []
        , spends
        ]
