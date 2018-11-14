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
    , overList
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
                Box.splitHorizontally factor box
        in
        p1 boxAbove ++ p2 boxBelow


above : Picture -> Picture -> Picture
above p1 p2 =
    aboveRatio 1 1 p1 p2



-- Exercise 5


besideRatio : Int -> Int -> Picture -> Picture -> Picture
besideRatio m n p1 p2 =
    \box ->
        let
            factor =
                toFloat m / toFloat (m + n)

            ( boxAbove, boxBelow ) =
                Box.splitVertically factor box
        in
        p1 boxAbove ++ p2 boxBelow


beside : Picture -> Picture -> Picture
beside p1 p2 =
    besideRatio 1 1 p1 p2



-- Exercise 6


quartet : Picture -> Picture -> Picture -> Picture -> Picture
quartet nw ne sw se =
    above
        (beside nw ne)
        (beside sw se)



-- Exercise 7


nonet : Picture -> Picture -> Picture -> Picture -> Picture -> Picture -> Picture -> Picture -> Picture -> Picture
nonet nw nm ne mw mm me sw sm se =
    aboveRatio
        1
        2
        (besideRatio 1 2 nw (beside nm ne))
        (above
            (besideRatio 1 2 mw (beside mm me))
            (besideRatio 1 2 sw (beside sm se))
        )



-- Exercise 8


over : Picture -> Picture -> Picture
over p1 p2 =
    overList [ p1, p2 ]


overList : List Picture -> Picture
overList list =
    \box ->
        List.concatMap (\elem -> elem box) list



-- Exercise 9


ttile : Picture -> Picture
ttile fish =
    overList
        [ fish
        , flip (toss fish)
        , flip (turn (toss fish))
        ]



-- Exercise 10


utile : Picture -> Picture
utile fish =
    overList
        [ toss fish |> flip |> turn
        , toss fish |> flip
        , toss fish |> turn |> flip
        , toss fish |> flip |> turn |> turn
        ]



-- Exercise 11


side : Int -> Picture -> Picture
side n fish =
    if n <= 0 then
        blank

    else
        quartet
            (side (n - 1) fish)
            (side (n - 1) fish)
            (turn (ttile fish))
            (ttile fish)



-- Exercise 12


corner : Int -> Picture -> Picture
corner n fish =
    if n <= 0 then
        blank

    else
        quartet
            (corner (n - 1) fish)
            (side (n - 1) fish)
            (turn (side (n - 1) fish))
            (utile fish)



-- Exercise 13


squareLimit : Int -> Picture -> Picture
squareLimit n fish =
    if n <= 0 then
        blank

    else
        nonet
            (corner (n - 1) fish)
            (side (n - 1) fish)
            (corner (n - 1) fish |> turn |> turn |> turn)
            (side (n - 1) fish |> turn)
            (utile fish)
            (side (n - 1) fish |> turn |> turn |> turn)
            (corner (n - 1) fish |> turn)
            (side (n - 1) fish |> turn |> turn)
            (corner (n - 1) fish |> turn |> turn)
