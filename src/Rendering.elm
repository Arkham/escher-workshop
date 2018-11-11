module Rendering exposing (toSvg)

import Mirror exposing (..)
import Picture exposing (..)
import Shape exposing (..)
import Style exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Vector exposing (Vector)


getStrokeWidthFromStyle : Maybe StrokeStyle -> Float
getStrokeWidthFromStyle style =
    case style of
        Just { strokeWidth } ->
            sqrt strokeWidth

        Nothing ->
            2.0


toPolygonElement : Style -> List Vector -> Svg msg
toPolygonElement style pts =
    let
        s =
            pts |> List.map Vector.toString |> String.join " "

        sw =
            getStrokeWidthFromStyle style.stroke
    in
    Svg.polygon
        [ stroke "Black"
        , strokeWidth <| String.fromFloat sw
        , fill "None"
        , points s
        ]
        []


toPolylineElement : Style -> List Vector -> Svg msg
toPolylineElement style pts =
    let
        s =
            pts |> List.map Vector.toString |> String.join " "

        sw =
            getStrokeWidthFromStyle style.stroke
    in
    Svg.polyline
        [ stroke "Black"
        , strokeWidth <| String.fromFloat sw
        , fill "None"
        , points s
        ]
        []


toCurveElement : Style -> Vector -> Vector -> Vector -> Vector -> Svg msg
toCurveElement style pt1 pt2 pt3 pt4 =
    let
        toStr vector =
            Vector.toStringWith vector " "

        pt1s =
            toStr pt1

        pt2s =
            toStr pt2

        pt3s =
            toStr pt3

        pt4s =
            toStr pt4

        dval =
            "M" ++ pt1s ++ " C " ++ pt2s ++ ", " ++ pt3s ++ ", " ++ pt4s

        sw =
            getStrokeWidthFromStyle style.stroke
    in
    Svg.path
        [ stroke "Black"
        , strokeWidth <| String.fromFloat sw
        , fill "None"
        , d dval
        ]
        []


toSvgElement : Style -> Shape -> Svg msg
toSvgElement style shape =
    case shape of
        Polygon { points } ->
            toPolygonElement style points

        Polyline { pts } ->
            toPolylineElement style pts

        Curve { point1, point2, point3, point4 } ->
            toCurveElement style point1 point2 point3 point4

        x ->
            text "nothing"


toSvg : ( Int, Int ) -> Rendering -> Svg msg
toSvg bounds rendering =
    let
        ( w, h ) =
            bounds

        viewBoxValue =
            [ "0", "0", String.fromInt w, String.fromInt h ] |> String.join " "

        mirror =
            mirrorVector <| toFloat h

        toElement ( shape, style ) =
            toSvgElement style (mirrorShape mirror shape)
    in
    svg
        [ version "1.1", x "0", y "0", width (String.fromInt w), height (String.fromInt h) ]
        (rendering |> List.map toElement)
