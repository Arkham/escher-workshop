module Fishier exposing (fishShapes)

import Shape exposing (BezierShape, CurveShape, PathStyle(..), Shape(..))
import Vector exposing (Vector)


createVector : Float -> Float -> Vector
createVector x y =
    { x = x, y = y }


createCurve : Vector -> Vector -> Vector -> Vector -> CurveShape
createCurve v1 v2 v3 v4 =
    { point1 = v1
    , point2 = v2
    , point3 = v3
    , point4 = v4
    }


createBezier : Vector -> Vector -> Vector -> BezierShape
createBezier v1 v2 v3 =
    { controlPoint1 = v1
    , controlPoint2 = v2
    , endPoint = v3
    }


primaryBeziers : List BezierShape
primaryBeziers =
    [ createBezier
        (createVector 0.11 0.11)
        (createVector 0.175 0.175)
        (createVector 0.25 0.25)
    , createBezier
        (createVector 0.372 0.194)
        (createVector 0.452 0.132)
        (createVector 0.564 0.032)
    , createBezier
        (createVector 0.73 0.056)
        (createVector 0.834 0.042)
        (createVector 1.0 0.0)
    , createBezier
        (createVector 0.896 0.062)
        (createVector 0.837 0.107)
        (createVector 0.766 0.202)
    , createBezier
        (createVector 0.66 0.208)
        (createVector 0.589 0.217)
        (createVector 0.5 0.25)
    , createBezier
        (createVector 0.5 0.41)
        (createVector 0.5 0.46)
        (createVector 0.5 0.5)
    , createBezier
        (createVector 0.5 0.575)
        (createVector 0.5 0.625)
        (createVector 0.5 0.75)
    , createBezier
        (createVector 0.411 0.783)
        (createVector 0.34 0.792)
        (createVector 0.234 0.798)
    , createBezier
        (createVector 0.163 0.893)
        (createVector 0.104 0.938)
        (createVector 0.0 1.0)
    , createBezier
        (createVector -0.042 0.834)
        (createVector -0.056 0.73)
        (createVector -0.032 0.564)
    , createBezier
        (createVector -0.132 0.452)
        (createVector -0.194 0.372)
        (createVector -0.25 0.25)
    , createBezier
        (createVector -0.15 0.15)
        (createVector -0.05 0.05)
        (createVector 0.0 0.0)
    ]


primaryPath : Shape
primaryPath =
    Path Normal ( createVector 0.0 0.0, primaryBeziers )


fishyLeftEyeBeziers : List BezierShape
fishyLeftEyeBeziers =
    [ createBezier
        (createVector 0.04 0.772)
        (createVector 0.068 0.696)
        (createVector 0.074 0.685)
    , createBezier
        (createVector 0.045 0.66)
        (createVector 0.01 0.617)
        (createVector -0.008 0.592)
    , createBezier
        (createVector -0.017 0.685)
        (createVector -0.012 0.77)
        (createVector 0.004 0.8)
    ]


leftEyePath : Shape
leftEyePath =
    Path Inverted ( createVector 0.004 0.8, fishyLeftEyeBeziers )


fishyInnerLeftEyeBeziers : List BezierShape
fishyInnerLeftEyeBeziers =
    [ createBezier
        (createVector 0.038 0.708)
        (createVector 0.053 0.684)
        (createVector 0.057 0.674)
    , createBezier
        (createVector 0.035 0.652)
        (createVector 0.01 0.622)
        (createVector 0.008 0.618)
    , createBezier
        (createVector 0.005 0.685)
        (createVector 0.01 0.7)
        (createVector 0.018 0.72)
    ]


innerLeftEyePath : Shape
innerLeftEyePath =
    Path Normal ( createVector 0.018 0.72, fishyInnerLeftEyeBeziers )


fishyRightEyeBeziers : List BezierShape
fishyRightEyeBeziers =
    [ createBezier
        (createVector 0.16 0.84)
        (createVector 0.2 0.79)
        (createVector 0.205 0.782)
    , createBezier
        (createVector 0.165 0.76)
        (createVector 0.14 0.74)
        (createVector 0.115 0.715)
    , createBezier
        (createVector 0.095 0.775)
        (createVector 0.09 0.83)
        (createVector 0.095 0.87)
    ]


rightEyePath : Shape
rightEyePath =
    Path Inverted ( createVector 0.095 0.87, fishyRightEyeBeziers )


fishyInnerRightEyeBeziers : List BezierShape
fishyInnerRightEyeBeziers =
    [ createBezier
        (createVector 0.15 0.805)
        (createVector 0.174 0.783)
        (createVector 0.185 0.774)
    , createBezier
        (createVector 0.154 0.756)
        (createVector 0.139 0.74)
        (createVector 0.132 0.736)
    , createBezier
        (createVector 0.126 0.76)
        (createVector 0.122 0.795)
        (createVector 0.128 0.81)
    ]


innerRightEyePath : Shape
innerRightEyePath =
    Path Normal ( createVector 0.128 0.81, fishyInnerRightEyeBeziers )


fishySpineCurves : List CurveShape
fishySpineCurves =
    [ -- main spine
      createCurve
        (createVector 0.84 0.07)
        (createVector 0.35 0.12)
        (createVector 0.14 0.5)
        (createVector 0.025 0.9)

    -- left fin stem
    , createCurve
        (createVector -0.015 0.52)
        (createVector 0.04 0.4)
        (createVector 0.12 0.3)
        (createVector 0.21 0.26)

    -- right fin stem
    , createCurve
        (createVector 0.475 0.27)
        (createVector 0.32 0.35)
        (createVector 0.34 0.6)
        (createVector 0.24 0.77)

    -- right fin bottom delimiter
    , createCurve
        (createVector 0.377 0.377)
        (createVector 0.41 0.41)
        (createVector 0.46 0.46)
        (createVector 0.495 0.495)

    -- tail fin stem
    , createCurve
        (createVector 0.43 0.165)
        (createVector 0.48 0.175)
        (createVector 0.49 0.22)
        (createVector 0.49 0.23)

    -- tail fin bottom line
    , createCurve
        (createVector 0.452 0.178)
        (createVector 0.51 0.13)
        (createVector 0.54 0.11)
        (createVector 0.6 0.08)

    -- tail fin top line
    , createCurve
        (createVector 0.482 0.215)
        (createVector 0.52 0.2)
        (createVector 0.6 0.16)
        (createVector 0.74 0.15)

    -- left fin top line
    , createCurve
        (createVector -0.17 0.237)
        (createVector -0.125 0.355)
        (createVector -0.065 0.405)
        (createVector 0.01 0.48)

    -- left fin middle line
    , createCurve
        (createVector -0.11 0.175)
        (createVector -0.06 0.25)
        (createVector -0.03 0.3)
        (createVector 0.08 0.365)

    -- left fin bottom line
    , createCurve
        (createVector -0.045 0.115)
        (createVector 0.01 0.18)
        (createVector 0.06 0.23)
        (createVector 0.17 0.28)

    -- right fin top line
    , createCurve
        (createVector 0.27 0.7)
        (createVector 0.34 0.72)
        (createVector 0.426 0.71)
        (createVector 0.474 0.692)

    -- right fin middle line
    , createCurve
        (createVector 0.31 0.57)
        (createVector 0.4 0.622)
        (createVector 0.435 0.618)
        (createVector 0.474 0.615)

    -- right fin bottom line
    , createCurve
        (createVector 0.35 0.435)
        (createVector 0.4 0.505)
        (createVector 0.422 0.52)
        (createVector 0.474 0.538)
    ]


fishyLines : List Shape
fishyLines =
    fishySpineCurves |> List.map Curve


fishShapes : List Shape
fishShapes =
    [ primaryPath
    , leftEyePath
    , rightEyePath
    , innerLeftEyePath
    , innerRightEyePath
    ]
        ++ fishyLines
