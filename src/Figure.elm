module Figure exposing (george)

import Shape exposing (..)


george : List Shape
george =
    let
        pts1 =
            [ { x = 0.0, y = 0.55 }
            , { x = 0.15, y = 0.45 }
            , { x = 0.3, y = 0.55 }
            , { x = 0.4, y = 0.5 }
            , { x = 0.2, y = 0.0 }
            ]

        pts2 =
            [ { x = 0.0, y = 0.8 }
            , { x = 0.15, y = 0.6 }
            , { x = 0.3, y = 0.65 }
            , { x = 0.4, y = 0.65 }
            , { x = 0.35, y = 0.8 }
            , { x = 0.4, y = 1.0 }
            ]

        pts3 =
            [ { x = 0.6, y = 1.0 }
            , { x = 0.65, y = 0.8 }
            , { x = 0.6, y = 0.65 }
            , { x = 0.8, y = 0.65 }
            , { x = 1.0, y = 0.45 }
            ]

        pts4 =
            [ { x = 1.0, y = 0.2 }
            , { x = 0.6, y = 0.5 }
            , { x = 0.8, y = 0.0 }
            ]

        pts5 =
            [ { x = 0.4, y = 0.0 }
            , { x = 0.5, y = 0.3 }
            , { x = 0.6, y = 0.0 }
            ]
    in
    [ Polyline { pts = pts1 }
    , Polyline { pts = pts2 }
    , Polyline { pts = pts3 }
    , Polyline { pts = pts4 }
    , Polyline { pts = pts5 }
    ]
