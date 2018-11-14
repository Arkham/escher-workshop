module Fitting exposing (createPicture)

import Box exposing (Box)
import Picture exposing (Hue(..), Lens, Picture)
import Shape exposing (..)
import Style exposing (..)
import Vector exposing (Vector, add, length, scale)


mapper : Box -> Vector -> Vector
mapper { a, b, c } { x, y } =
    add a (add (scale x b) (scale y c))


getStrokeWidth : Box -> Float
getStrokeWidth { b, c } =
    let
        s =
            max (length b) (length c)
    in
    s / 80.0


getStyle : Box -> Hue -> Style
getStyle box hue =
    let
        sw =
            getStrokeWidth box

        strokeColor =
            case hue of
                Blackish ->
                    White

                Greyish ->
                    White

                Whiteish ->
                    Black

        fillColor =
            case hue of
                Blackish ->
                    Black

                Greyish ->
                    Grey

                Whiteish ->
                    White
    in
    { stroke =
        Just
            { strokeWidth = sw
            , strokeColor = strokeColor
            }
    , fill =
        Just
            { fillColor = fillColor }
    }


mapShape : (Vector -> Vector) -> Shape -> Shape
mapShape m shape =
    case shape of
        Polygon { points } ->
            Polygon { points = List.map m points }

        Polyline { pts } ->
            Polyline { pts = List.map m pts }

        Curve { point1, point2, point3, point4 } ->
            Curve
                { point1 = m point1
                , point2 = m point2
                , point3 = m point3
                , point4 = m point4
                }

        x ->
            x


createPicture : List Shape -> Picture
createPicture shapes ( box, hue ) =
    let
        m =
            mapper box

        style =
            getStyle box hue
    in
    shapes
        |> List.map (mapShape m)
        |> List.map (\s -> ( s, style ))
