module Main exposing (main)

import Figure exposing (george)
import Fishy exposing (fishShapes)
import Fitting exposing (createPicture)
import Letter exposing (..)
import Picture exposing (..)
import Rendering exposing (toSvg)
import Svg exposing (Svg)


main : Svg msg
main =
    let
        box =
            { a = { x = 75.0, y = 75.0 }
            , b = { x = 250.0, y = 0.0 }
            , c = { x = 0.0, y = 250.0 }
            }

        fish =
            createPicture fishShapes
    in
    box
        |> squareLimit 7 fish
        |> toSvg ( 400, 400 )


times : Int -> (a -> a) -> (a -> a)
times num f =
    if num <= 0 then
        identity

    else
        f >> times (num - 1) f


customBesideRatio : Int -> Int -> Picture -> Picture -> Picture
customBesideRatio m n p1 p2 =
    turn (aboveRatio m n (times 3 turn p1) (times 3 turn p2))


georgeCheckers : Picture
georgeCheckers =
    let
        f =
            createPicture george

        tile =
            quartet f (flip <| times 2 turn f) (times 2 turn f) (flip f)

        checkers =
            quartet tile blank blank tile
    in
    quartet checkers checkers checkers checkers


henderson : Int -> Picture
henderson depth =
    let
        h =
            createPicture hLetter

        e =
            createPicture eLetter

        n =
            createPicture nLetter

        d =
            createPicture dLetter

        r =
            createPicture rLetter

        s =
            createPicture sLetter

        o =
            createPicture oLetter

        center =
            if depth <= 1 then
                e

            else
                henderson (depth - 1)
    in
    nonet h e n d center r s o n
