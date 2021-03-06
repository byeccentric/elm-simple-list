module Data exposing (Spend, getCategory, getCategoryMaximum, sellCats, spendList)

import Array exposing (Array)


sellCats : Array String
sellCats =
    Array.fromList
        [ "Матрас"
        , "Ремонт авто"
        , "Отложения"
        , "Проезд"
        , "Пагубные привычки"
        , "Одежда"
        , "Квартира"
        , "Прочее"
        , "Вернут"
        ]


maximums : Array Int
maximums =
    Array.fromList
        [ 15000
        , 20000
        , 12500
        , 10000
        , 5000
        , 5000
        , 45000
        , 5000
        , 0
        ]


type alias Spend =
    { date : String, cat : Int, sum : Float, sum_plus : Float, name : String }


spendList : List Spend
spendList =
    [ { date = "01.06.2021"
      , cat = 3
      , sum = 512
      , sum_plus = 550
      , name = "taxi"
      }
    , { date = "01.06.2021"
      , cat = 2
      , sum = 3000
      , sum_plus = 3000
      , name = "предоплата за Орел"
      }
    , { date = "01.06.2021"
      , cat = 7
      , sum = 149
      , sum_plus = 150
      , name = "vk combo"
      }
    , { date = "01.06.2021"
      , cat = 7
      , sum = 200
      , sum_plus = 200
      , name = "покупка домена"
      }
    , { date = "02.06.2021"
      , cat = 4
      , sum = 276.99
      , sum_plus = 300
      , name = "сигареты стики"
      }
    , { date = "02.06.2021"
      , cat = 7
      , sum = 281.16
      , sum_plus = 300
      , name = "продукты"
      }
    , { date = "03.06.2021"
      , cat = 3
      , sum = 519
      , sum_plus = 550
      , name = "taxi"
      }
    , { date = "03.06.2021"
      , cat = 4
      , sum = 1449.99
      , sum_plus = 1500
      , name = "стики"
      }
    , { date = "04.06.2021"
      , cat = 3
      , sum = 520
      , sum_plus = 550
      , name = "taxi"
      }
    , { date = "04.06.2021"
      , cat = 3
      , sum = 528
      , sum_plus = 550
      , name = "taxi"
      }
    , { date = "05.06.2021"
      , cat = 7
      , sum = 230
      , sum_plus = 250
      , name = "перекус в икеи"
      }
    , { date = "05.06.2021"
      , cat = 0
      , sum = 17652
      , sum_plus = 17700
      , name = "матрас и одеяло"
      }
    , { date = "06.06.2021"
      , cat = 4
      , sum = 132
      , sum_plus = 150
      , name = "сигареты"
      }
    , { date = "06.06.2021"
      , cat = 7
      , sum = 228.97
      , sum_plus = 250
      , name = "продукты"
      }
    , { date = "06.06.2021"
      , cat = 7
      , sum = 240
      , sum_plus = 250
      , name = "продукты"
      }
    , { date = "06.06.2021"
      , cat = 7
      , sum = 360.28
      , sum_plus = 400
      , name = "подписка кс"
      }
    , { date = "06.06.2021"
      , cat = 7
      , sum = 221.23
      , sum_plus = 221.23
      , name = "продукты"
      }
    , { date = "07.06.2021"
      , cat = 3
      , sum = 499
      , sum_plus = 500
      , name = "такси"
      }
    , { date = "07.06.2021"
      , cat = 8
      , sum = 705.79
      , sum_plus = 750
      , name = "продукты Маша"
      }
    , { date = "07.06.2021"
      , cat = 3
      , sum = 500
      , sum_plus = 500
      , name = "на тройку"
      }
    , { date = "08.06.2021"
      , cat = 3
      , sum = 560
      , sum_plus = 600
      , name = "такси"
      }
    , { date = "08.06.2021"
      , cat = 7
      , sum = 150
      , sum_plus = 150
      , name = "кофе"
      }
    , { date = "08.06.2021"
      , cat = 7
      , sum = 988
      , sum_plus = 1000
      , name = "delivery KFC"
      }
    , { date = "08.06.2021"
      , cat = 8
      , sum = 380.94
      , sum_plus = 400
      , name = "продукты"
      }
    , { date = "10.06.2021"
      , cat = 5
      , sum = 3000
      , sum_plus = 3000
      , name = "маме на джинсы"
      }
    , { date = "10.06.2021"
      , cat = 8
      , sum = 282.6
      , sum_plus = 300
      , name = "продукты"
      }
    , { date = "11.06.2021"
      , cat = 3
      , sum = 554
      , sum_plus = 600
      , name = "такси"
      }
    , { date = "12.06.2021"
      , cat = 8
      , sum = 1657.97
      , sum_plus = 1700
      , name = "продукты"
      }
    , { date = "13.06.2021"
      , cat = 7
      , sum = 985
      , sum_plus = 1000
      , name = "фрукты"
      }
    , { date = "13.06.2021"
      , cat = 7
      , sum = 18.76
      , sum_plus = 50
      , name = "фрукты"
      }
    , { date = "13.06.2021"
      , cat = 4
      , sum = 384.56
      , sum_plus = 400
      , name = "сигареты"
      }
    , { date = "13.06.2021"
      , cat = 4
      , sum = 452
      , sum_plus = 500
      , name = "сигареты"
      }
    , { date = "13.06.2021"
      , cat = 8
      , sum = 23175
      , sum_plus = 23200
      , name = "доставка на 20 дней"
      }
    , { date = "13.06.2021"
      , cat = 8
      , sum = -20000
      , sum_plus = -20000
      , name = "возврат от Маши части"
      }
    , { date = "14.06.2021"
      , cat = 6
      , sum = 450
      , sum_plus = 450
      , name = "интернет"
      }
    , { date = "14.06.2021"
      , cat = 8
      , sum = 3000
      , sum_plus = 3000
      , name = "стики"
      }
    , { date = "14.06.2021"
      , cat = 8
      , sum = 834.25
      , sum_plus = 850
      , name = "продукты"
      }
    , { date = "14.06.2021"
      , cat = 3
      , sum = 1
      , sum_plus = 50
      , name = "проезд"
      }
    , { date = "15.06.2021"
      , cat = 3
      , sum = 787
      , sum_plus = 800
      , name = "такси"
      }
    , { date = "15.06.2021"
      , cat = 7
      , sum = -112.94
      , sum_plus = -112.94
      , name = "возврат от еды"
      }
    , { date = "15.06.2021"
      , cat = 8
      , sum = -10200
      , sum_plus = -10200
      , name = "возврат от Маши"
      }
    , { date = "15.06.2021"
      , cat = 7
      , sum = 250
      , sum_plus = 250
      , name = "сброс на др"
      }
    , { date = "15.06.2021"
      , cat = 3
      , sum = 166
      , sum_plus = 200
      , name = "такси"
      }
    , { date = "16.06.2021"
      , cat = 3
      , sum = 138
      , sum_plus = 150
      , name = "такси"
      }
    , { date = "16.06.2021"
      , cat = 7
      , sum = 185
      , sum_plus = 185
      , name = "сброс на др"
      }
    , { date = "17.06.2021"
      , cat = 3
      , sum = 139
      , sum_plus = 150
      , name = "такси"
      }
    , { date = "17.06.2021"
      , cat = 4
      , sum = 122
      , sum_plus = 150
      , name = "сигареты"
      }
    , { date = "17.06.2021"
      , cat = 7
      , sum = 185
      , sum_plus = 185
      , name = "сброс на др"
      }
    , { date = "17.06.2021"
      , cat = 8
      , sum = 523
      , sum_plus = 550
      , name = "Маша в аптеке"
      }
    , { date = "17.06.2021"
      , cat = 8
      , sum = 494.2
      , sum_plus = 500
      , name = "Маша в fixprice"
      }
    , { date = "17.06.2021"
      , cat = 8
      , sum = 131.97
      , sum_plus = 150
      , name = "Маша в пятерочке"
      }
    , { date = "17.06.2021"
      , cat = 8
      , sum = 200
      , sum_plus = 200
      , name = "Маша в метро"
      }
    , { date = "17.06.2021"
      , cat = 8
      , sum = -1500
      , sum_plus = -1500
      , name = "Маша вернула"
      }
    , { date = "18.06.2021"
      , cat = 3
      , sum = 129
      , sum_plus = 150
      , name = "такси"
      }
    , { date = "18.06.2021"
      , cat = 6
      , sum = 220
      , sum_plus = 220
      , name = "на телефон"
      }
    ]


getCategory : Int -> String
getCategory cat =
    Maybe.withDefault "UNKNOWN" <| Array.get cat sellCats


getCategoryMaximum : Int -> Int
getCategoryMaximum cat =
    Maybe.withDefault 0 <| Array.get cat maximums
