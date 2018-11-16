module Mirror exposing (mirrorShape, mirrorVector)

import Shape exposing (..)
import Vector exposing (Vector)


mirrorVector : Float -> Vector -> Vector
mirrorVector height { x, y } =
    { x = x, y = height - y }


mirrorShape : (Vector -> Vector) -> Shape -> Shape
mirrorShape mirror shape =
    case shape of
        Line { lineStart, lineEnd } ->
            Line
                { lineStart = mirror lineStart
                , lineEnd = mirror lineEnd
                }

        Polygon { points } ->
            Polygon { points = points |> List.map mirror }

        Polyline { pts } ->
            Polyline { pts = pts |> List.map mirror }

        Curve { point1, point2, point3, point4 } ->
            Curve
                { point1 = mirror point1
                , point2 = mirror point2
                , point3 = mirror point3
                , point4 = mirror point4
                }

        Path pathStyle ( start, beziers ) ->
            let
                mirrorBezier { controlPoint1, controlPoint2, endPoint } =
                    { controlPoint1 = mirror controlPoint1
                    , controlPoint2 = mirror controlPoint2
                    , endPoint = mirror endPoint
                    }
            in
            Path pathStyle ( mirror start, List.map mirrorBezier beziers )
