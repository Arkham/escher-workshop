module Fishy exposing (fishShapes)

import Shape exposing (CurveShape, Shape)
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


hendersonFishCurves : List CurveShape
hendersonFishCurves =
    [ createCurve (createVector 0.116 0.702)
        -- C1
        (createVector 0.26 0.295)
        --
        (createVector 0.33 0.258)
        --
        (createVector 0.815 0.078)

    --
    , createCurve (createVector 0.564 0.032)
        -- C2
        (createVector 0.73 0.056)
        --
        (createVector 0.834 0.042)
        --
        (createVector 1.0 0.0)

    --
    , createCurve (createVector 0.25 0.25)
        -- C3
        (createVector 0.372 0.194)
        --
        (createVector 0.452 0.132)
        --
        (createVector 0.564 0.032)

    --
    , createCurve (createVector 0.0 0.0)
        -- C4
        (createVector 0.11 0.11)
        --
        (createVector 0.175 0.175)
        --
        (createVector 0.25 0.25)

    --
    , createCurve (createVector -0.25 0.25)
        -- C5
        (createVector -0.15 0.15)
        --
        (createVector -0.09 0.09)
        --
        (createVector 0.0 0.0)

    --
    , createCurve (createVector -0.25 0.25)
        -- C6
        (createVector -0.194 0.372)
        --
        (createVector -0.132 0.452)
        --
        (createVector -0.032 0.564)

    --
    , createCurve (createVector -0.032 0.564)
        -- C7
        (createVector 0.055 0.355)
        --
        (createVector 0.08 0.33)
        --
        (createVector 0.25 0.25)

    --
    , createCurve (createVector -0.032 0.564)
        -- C8
        (createVector -0.056 0.73)
        --
        (createVector -0.042 0.834)
        --
        (createVector 0.0 1.0)

    --
    , createCurve (createVector 0.0 1.0)
        -- C9
        (createVector 0.104 0.938)
        --
        (createVector 0.163 0.893)
        --
        (createVector 0.234 0.798)

    --
    , createCurve (createVector 0.234 0.798)
        -- C10
        (createVector 0.368 0.65)
        (createVector 0.232 0.54)
        (createVector 0.377 0.377)
    , createCurve (createVector 0.377 0.377)
        -- C11
        (createVector 0.4 0.35)
        (createVector 0.45 0.3)
        (createVector 0.5 0.25)
    , createCurve (createVector 0.5 0.25)
        -- C12
        (createVector 0.589 0.217)
        (createVector 0.66 0.208)
        (createVector 0.766 0.202)
    , createCurve (createVector 0.766 0.202)
        -- C13
        (createVector 0.837 0.107)
        --
        (createVector 0.896 0.062)
        --
        (createVector 1.0 0.0)

    --
    , createCurve (createVector 0.234 0.798)
        -- C14
        (createVector 0.34 0.792)
        --
        (createVector 0.411 0.783)
        --
        (createVector 0.5 0.75)

    --
    , createCurve (createVector 0.5 0.75)
        -- C15
        (createVector 0.5 0.625)
        --
        (createVector 0.5 0.575)
        --
        (createVector 0.5 0.5)

    --
    , createCurve (createVector 0.5 0.5)
        -- C16 -
        (createVector 0.46 0.46)
        --
        (createVector 0.41 0.41)
        --
        (createVector 0.377 0.377)

    --
    , createCurve (createVector 0.315 0.71)
        -- C17 -
        (createVector 0.378 0.732)
        --
        (createVector 0.426 0.726)
        --
        (createVector 0.487 0.692)

    --
    , createCurve (createVector 0.34 0.605)
        -- C18 -
        (createVector 0.4 0.642)
        --
        (createVector 0.435 0.647)
        --
        (createVector 0.489 0.626)

    --
    , createCurve (createVector 0.348 0.502)
        -- C19 -
        (createVector 0.4 0.564)
        --
        (createVector 0.422 0.568)
        --
        (createVector 0.489 0.563)

    --
    , createCurve (createVector 0.451 0.418)
        -- C20 -
        (createVector 0.465 0.4)
        --
        (createVector 0.48 0.385)
        --
        (createVector 0.49 0.381)

    --
    , createCurve (createVector 0.421 0.388)
        -- C21 -
        (createVector 0.44 0.35)
        --
        (createVector 0.455 0.335)
        --
        (createVector 0.492 0.325)

    --
    , createCurve (createVector -0.17 0.237)
        -- C22 -
        (createVector -0.125 0.355)
        --
        (createVector -0.065 0.405)
        --
        (createVector 0.002 0.436)

    --
    , createCurve (createVector -0.121 0.188)
        -- C23 -
        (createVector -0.06 0.3)
        --
        (createVector -0.03 0.33)
        --
        (createVector 0.04 0.375)

    --
    , createCurve (createVector -0.058 0.125)
        -- C24 -
        (createVector -0.01 0.24)
        --
        (createVector 0.03 0.28)
        --
        (createVector 0.1 0.321)

    --
    , createCurve (createVector -0.022 0.063)
        -- C25 -
        (createVector 0.06 0.2)
        --
        (createVector 0.1 0.24)
        --
        (createVector 0.16 0.282)

    --
    , createCurve (createVector 0.053 0.658)
        -- C26 -
        (createVector 0.075 0.677)
        --
        (createVector 0.085 0.687)
        --
        (createVector 0.098 0.7)

    --
    , createCurve (createVector 0.053 0.658)
        -- C27
        (createVector 0.042 0.71)
        --
        (createVector 0.042 0.76)
        --
        (createVector 0.053 0.819)

    --
    , createCurve (createVector 0.053 0.819)
        -- C28 -
        (createVector 0.085 0.812)
        --
        (createVector 0.092 0.752)
        --
        (createVector 0.098 0.7)

    --
    , createCurve (createVector 0.13 0.718)
        -- C29 -
        (createVector 0.15 0.73)
        --
        (createVector 0.175 0.745)
        --
        (createVector 0.187 0.752)

    --
    , createCurve (createVector 0.13 0.718)
        -- C30 -
        (createVector 0.11 0.795)
        --
        (createVector 0.11 0.81)
        --
        (createVector 0.112 0.845)

    --
    , createCurve (createVector 0.112 0.845)
        -- C31 -
        (createVector 0.15 0.805)
        --
        (createVector 0.172 0.78)
        --
        (createVector 0.187 0.752)
    ]


fishShapes : List Shape
fishShapes =
    hendersonFishCurves |> List.map Shape.Curve
