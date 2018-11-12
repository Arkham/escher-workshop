module Picture exposing
    ( Picture
    , Rendering
    , above
    , aboveRatio
    , beside
    , besideRatio
    , blank
    , corner
    , flip
    , nonet
    , over
    , quartet
    , side
    , squareLimit
    , toss
    , ttile
    , turn
    , utile
    )

import Box exposing (Box)
import Shape exposing (..)
import Style exposing (..)


type alias Rendering =
    List ( Shape, Style )


type alias Picture =
    Box -> Rendering


blank : Picture
blank _ =
    []



-- Exercise 1


turn : Picture -> Picture
turn p =
    Box.turn >> p



-- Exercise 2


flip : Picture -> Picture
flip p =
    Box.flip >> p



-- Exercise 3


toss : Picture -> Picture
toss p =
    Box.toss >> p



-- Exercise 4


aboveRatio : Int -> Int -> Picture -> Picture -> Picture
aboveRatio m n p1 p2 =
    \box ->
        let
            factor =
                toFloat m / toFloat (m + n)

            ( boxAbove, boxBelow ) =
                Box.split factor box
        in
        p1 boxAbove ++ p2 boxBelow


above : Picture -> Picture -> Picture
above p1 p2 =
    aboveRatio 1 1 p1 p2



-- Exercise 5


besideRatio : Int -> Int -> Picture -> Picture -> Picture
besideRatio m n p1 p2 =
    blank


beside : Picture -> Picture -> Picture
beside p1 p2 =
    blank



-- Exercise 6


quartet : Picture -> Picture -> Picture -> Picture -> Picture
quartet nw ne sw se =
    blank



-- Exercise 7


nonet : Picture -> Picture -> Picture -> Picture -> Picture -> Picture -> Picture -> Picture -> Picture -> Picture
nonet nw nm ne mw mm me sw sm se =
    blank



-- Exercise 8


over : Picture -> Picture -> Picture
over p1 p2 =
    blank



-- Exercise 9


ttile : Picture -> Picture
ttile fish =
    blank



-- Exercise 10


utile : Picture -> Picture
utile fish =
    blank



-- Exercise 11


side : Int -> Picture -> Picture
side n fish =
    blank



-- Exercise 12


corner : Int -> Picture -> Picture
corner n fish =
    blank



-- Exercise 13


squareLimit : Int -> Picture -> Picture
squareLimit n fish =
    blank
