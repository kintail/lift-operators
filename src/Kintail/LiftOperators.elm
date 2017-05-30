module Kintail.LiftOperators exposing (..)


(||>) : ( a, b ) -> (a -> b -> c) -> c
(||>) ( x, y ) f =
    f x y
infixl 0 ||>


(<||) : (a -> b -> c) -> ( a, b ) -> c
(<||) =
    flip (||>)
infixr 0 <||


(|?>) : ( a, Maybe b ) -> (a -> b -> c) -> Maybe c
(|?>) ( x, maybeY ) f =
    Maybe.map (\y -> f x y) maybeY
infixl 0 |?>


(<|?) : (a -> b -> c) -> ( a, Maybe b ) -> Maybe c
(<|?) =
    flip (|?>)
infixr 0 <|?


(?|>) : ( Maybe a, b ) -> (a -> b -> c) -> Maybe c
(?|>) ( maybeX, y ) f =
    Maybe.map (\x -> f x y) maybeX
infixl 0 ?|>


(<?|) : (a -> b -> c) -> ( Maybe a, b ) -> Maybe c
(<?|) =
    flip (?|>)
infixr 0 <?|


(??>) : ( Maybe a, Maybe b ) -> (a -> b -> c) -> Maybe c
(??>) ( maybeX, maybeY ) f =
    Maybe.map2 f maybeX maybeY
infixl 0 ??>


(<??) : (a -> b -> c) -> ( Maybe a, Maybe b ) -> Maybe c
(<??) =
    flip (??>)
infixr 0 <??


(||=?>) : ( a, b ) -> (a -> b -> Maybe c) -> Maybe c
(||=?>) ( x, y ) f =
    f x y
infixl 0 ||=?>


(<||=?) : (a -> b -> Maybe c) -> ( a, b ) -> Maybe c
(<||=?) =
    flip (||=?>)
infixr 0 <||=?


(|?=?>) : ( a, Maybe b ) -> (a -> b -> Maybe c) -> Maybe c
(|?=?>) ( x, maybeY ) f =
    Maybe.andThen (\y -> f x y) maybeY
infixl 0 |?=?>


(<|?=?) : (a -> b -> Maybe c) -> ( a, Maybe b ) -> Maybe c
(<|?=?) =
    flip (|?=?>)
infixr 0 <|?=?


(?|=?>) : ( Maybe a, b ) -> (a -> b -> Maybe c) -> Maybe c
(?|=?>) ( maybeX, y ) f =
    Maybe.andThen (\x -> f x y) maybeX
infixl 0 ?|=?>


(<?|=?) : (a -> b -> Maybe c) -> ( Maybe a, b ) -> Maybe c
(<?|=?) =
    flip (?|=?>)
infixr 0 <?|=?


(??=?>) : ( Maybe a, Maybe b ) -> (a -> b -> Maybe c) -> Maybe c
(??=?>) args f =
    case args of
        ( Just x, Just y ) ->
            f x y

        _ ->
            Nothing
infixl 0 ??=?>


(<??=?) : (a -> b -> Maybe c) -> ( Maybe a, Maybe b ) -> Maybe c
(<??=?) =
    flip (??=?>)
infixr 0 <??=?
