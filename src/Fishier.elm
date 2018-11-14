module Fishier exposing (fishShapes)

import Shape exposing (BezierShape, CurveShape, Shape(..))
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


fishyBeziers : List BezierShape
fishyBeziers =
    [ createBezier (createVector 0.11 0.11)
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


fishShapes : List Shape
fishShapes =
    [ Path ( createVector 0 0, fishyBeziers ) ]
