module Vector exposing (Vector, add, length, neg, scale, sub, toString, toStringWith)


type alias Vector =
    { x : Float, y : Float }


add : Vector -> Vector -> Vector
add v1 v2 =
    { x = v1.x + v2.x, y = v1.y + v2.y }


neg : Vector -> Vector
neg { x, y } =
    { x = -x, y = -y }


sub : Vector -> Vector -> Vector
sub v1 v2 =
    add v1 (neg v2)


scale : Float -> Vector -> Vector
scale f { x, y } =
    { x = f * x, y = f * y }


length : Vector -> Float
length { x, y } =
    sqrt (x * x + y * y)


toString : Vector -> String
toString vector =
    toStringWith vector ","


toStringWith : Vector -> String -> String
toStringWith { x, y } separator =
    String.fromFloat x ++ separator ++ String.fromFloat y
