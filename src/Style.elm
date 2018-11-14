module Style exposing (FillStyle, StrokeStyle, Style, StyleColor(..), colorToString)


type StyleColor
    = Black
    | Grey
    | White


type alias StrokeStyle =
    { strokeWidth : Float
    , strokeColor : StyleColor
    }


type alias FillStyle =
    { fillColor : StyleColor }


type alias Style =
    { stroke : Maybe StrokeStyle
    , fill : Maybe FillStyle
    }


colorToString : StyleColor -> String
colorToString styleColor =
    case styleColor of
        Black ->
            "black"

        Grey ->
            "grey"

        White ->
            "white"
