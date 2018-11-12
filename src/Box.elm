module Box exposing (Box, flip, split, toss, turn)

import Vector exposing (Vector)


type alias Box =
    { a : Vector
    , b : Vector
    , c : Vector
    }


turn : Box -> Box
turn { a, b, c } =
    { a = Vector.add a b
    , b = c
    , c = Vector.neg b
    }


flip : Box -> Box
flip { a, b, c } =
    { a = Vector.add a b
    , b = Vector.neg b
    , c = c
    }


toss : Box -> Box
toss { a, b, c } =
    { a = Vector.add a (Vector.scale 0.5 (Vector.add b c))
    , b = Vector.scale 0.5 (Vector.add b c)
    , c = Vector.scale 0.5 (Vector.sub c b)
    }


split : Float -> Box -> ( Box, Box )
split factor { a, b, c } =
    let
        aboveRatio =
            factor

        belowRatio =
            1 - aboveRatio

        above =
            { a = Vector.add a (Vector.scale belowRatio c)
            , b = b
            , c = Vector.scale aboveRatio c
            }

        below =
            { a = a
            , b = b
            , c = Vector.scale belowRatio c
            }
    in
    ( above, below )
