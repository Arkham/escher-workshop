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


getStrokeColorFromStyle : Maybe StrokeStyle -> String
getStrokeColorFromStyle style =
    case style of
        Just { strokeColor } ->
            colorToString strokeColor

        Nothing ->
            "black"


getFillColorFromStyle : Maybe FillStyle -> String
getFillColorFromStyle style =
    case style of
        Just { fillColor } ->
            colorToString fillColor

        Nothing ->
            "none"


toPolygonElement : Style -> List Vector -> Svg msg
toPolygonElement style pts =
    let
        s =
            pts |> List.map Vector.toString |> String.join " "

        width =
            getStrokeWidthFromStyle style.stroke

        strokeColor =
            getStrokeColorFromStyle style.stroke

        fillColor =
            getFillColorFromStyle style.fill
    in
    Svg.polygon
        [ stroke strokeColor
        , strokeWidth <| String.fromFloat width
        , fill fillColor
        , points s
        ]
        []


toPolylineElement : Style -> List Vector -> Svg msg
toPolylineElement style pts =
    let
        s =
            pts |> List.map Vector.toString |> String.join " "

        width =
            getStrokeWidthFromStyle style.stroke

        strokeColor =
            getStrokeColorFromStyle style.stroke
    in
    Svg.polyline
        [ stroke strokeColor
        , strokeWidth <| String.fromFloat width
        , fill "none"
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

        width =
            getStrokeWidthFromStyle style.stroke

        strokeColor =
            getStrokeColorFromStyle style.stroke
    in
    Svg.path
        [ stroke strokeColor
        , strokeWidth <| String.fromFloat width
        , fill "none"
        , d dval
        ]
        []


toPathElement : PathStyle -> Style -> Vector -> List BezierShape -> Svg msg
toPathElement pathStyle style start beziers =
    let
        toStr vector =
            Vector.toStringWith vector " "

        allBeziers =
            List.map
                (\{ controlPoint1, controlPoint2, endPoint } ->
                    " C "
                        ++ toStr controlPoint1
                        ++ ", "
                        ++ toStr controlPoint2
                        ++ ", "
                        ++ toStr endPoint
                )
                beziers
                |> String.concat

        dval =
            "M" ++ toStr start ++ allBeziers

        width =
            getStrokeWidthFromStyle style.stroke

        strokeColor =
            getStrokeColorFromStyle style.stroke

        fillColor =
            case pathStyle of
                Normal ->
                    getFillColorFromStyle style.fill

                Inverted ->
                    strokeColor
    in
    Svg.path
        [ stroke strokeColor
        , strokeWidth <| String.fromFloat width
        , fill fillColor
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

        Path bezierStyle ( start, beziers ) ->
            toPathElement bezierStyle style start beziers

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
