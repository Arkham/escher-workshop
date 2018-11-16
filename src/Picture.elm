module Picture exposing
    ( Hue(..)
    , Lens
    , Picture
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
    , times
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


type Hue
    = Blackish
    | Greyish
    | Whiteish


type alias Lens =
    ( Box, Hue )


type alias Picture =
    Lens -> Rendering


rehue : Picture -> Picture
rehue p =
    \( box, hue ) ->
        let
            newHue =
                case hue of
                    Blackish ->
                        Greyish

                    Greyish ->
                        Whiteish

                    Whiteish ->
                        Blackish
        in
        p ( box, newHue )


blank : Picture
blank _ =
    []



-- Exercise 1


turn : Picture -> Picture
turn p =
    \( box, hue ) ->
        p ( Box.turn box, hue )



-- Exercise 2


flip : Picture -> Picture
flip p =
    \( box, hue ) ->
        p ( Box.flip box, hue )



-- Exercise 3


toss : Picture -> Picture
toss p =
    \( box, hue ) ->
        p ( Box.toss box, hue )



-- Exercise 4


aboveRatio : Int -> Int -> Picture -> Picture -> Picture
aboveRatio m n p1 p2 =
    \( box, hue ) ->
        let
            factor =
                toFloat m / toFloat (m + n)

            ( boxAbove, boxBelow ) =
                Box.splitHorizontally factor box
        in
        p1 ( boxAbove, hue ) ++ p2 ( boxBelow, hue )


above : Picture -> Picture -> Picture
above p1 p2 =
    aboveRatio 1 1 p1 p2



-- Exercise 5


besideRatio : Int -> Int -> Picture -> Picture -> Picture
besideRatio m n p1 p2 =
    \( box, hue ) ->
        let
            factor =
                toFloat m / toFloat (m + n)

            ( boxAbove, boxBelow ) =
                Box.splitVertically factor box
        in
        p1 ( boxAbove, hue ) ++ p2 ( boxBelow, hue )


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


ttile : (Picture -> Picture) -> (Picture -> Picture) -> Picture -> Picture
ttile hueN hueE fish =
    let
        fishN =
            fish |> toss |> flip

        fishE =
            fish |> toss |> turn |> flip
    in
    overList
        [ fish
        , fishN |> hueN
        , fishE |> hueE
        ]


ttile1 =
    ttile rehue (rehue >> rehue)


ttile2 =
    ttile (rehue >> rehue) rehue



-- Exercise 10


utile : (Picture -> Picture) -> (Picture -> Picture) -> (Picture -> Picture) -> (Picture -> Picture) -> Picture -> Picture
utile hueN hueW hueS hueE fish =
    let
        fishN =
            fish |> toss |> flip

        fishW =
            fishN |> turn

        fishS =
            fishW |> turn

        fishE =
            fishS |> turn
    in
    overList
        [ fishN |> hueN
        , fishW |> hueW
        , fishS |> hueS
        , fishE |> hueE
        ]


utile1 =
    utile (rehue >> rehue) identity (rehue >> rehue) identity


utile2 =
    utile identity (rehue >> rehue) rehue (rehue >> rehue)


utile3 =
    utile (rehue >> rehue) identity rehue identity



-- Exercise 11


side : (Picture -> Picture) -> (Picture -> Picture) -> (Picture -> Picture) -> Int -> Picture -> Picture
side tt hueSW hueSE n fish =
    if n <= 0 then
        blank

    else
        let
            t =
                tt fish

            rec f =
                side tt hueSW hueSE (n - 1) f
        in
        quartet
            (rec fish)
            (rec fish)
            (t |> turn |> hueSW)
            (t |> hueSE)


side1 =
    side ttile1 identity rehue


side2 =
    side ttile2 (rehue >> rehue) rehue



-- Exercise 12


corner : (Picture -> Picture) -> (Int -> Picture -> Picture) -> (Int -> Picture -> Picture) -> Int -> Picture -> Picture
corner ut sideNE sideSW n fish =
    if n <= 0 then
        blank

    else
        quartet
            (corner ut sideNE sideSW (n - 1) fish)
            (sideNE (n - 1) fish)
            (turn (sideSW (n - 1) fish))
            (ut fish)


corner1 =
    corner utile3 side1 side2


corner2 =
    corner utile2 side2 side1



-- Exercise 13


squareLimit : Int -> Picture -> Picture
squareLimit n fish =
    if n <= 0 then
        blank

    else
        let
            cornerNW =
                corner1 n fish

            cornerSW =
                corner2 n fish |> turn

            cornerSE =
                cornerNW |> times 2 turn

            cornerNE =
                cornerSW |> times 2 turn

            sideN =
                side1 n fish

            sideW =
                side2 n fish |> turn

            sideS =
                sideN |> times 2 turn

            sideE =
                sideW |> times 2 turn

            center =
                utile1 fish
        in
        nonet
            cornerNW
            sideN
            cornerNE
            sideW
            center
            sideE
            cornerSW
            sideS
            cornerSE


times : Int -> (a -> a) -> (a -> a)
times num f =
    if num <= 0 then
        identity

    else
        f >> times (num - 1) f
