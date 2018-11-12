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
    in
    box
        |> (createPicture fLetter
                |> flip
                |> aboveRatio 3 1 (createPicture fLetter)
           )
        |> toSvg ( 400, 400 )


times : Int -> (a -> a) -> (a -> a)
times num f =
    if num <= 0 then
        identity

    else
        f >> times (num - 1) f
