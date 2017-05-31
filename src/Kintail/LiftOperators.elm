module Kintail.LiftOperators exposing (..)


(||>) : ( a, b ) -> (a -> b -> c) -> c
(||>) ( v1, v2 ) f =
    f v1 v2
infixl 0 ||>


(<||) : (a -> b -> c) -> ( a, b ) -> c
(<||) =
    flip (||>)
infixr 0 <||


(|?>) : ( a, Maybe b ) -> (a -> b -> c) -> Maybe c
(|?>) ( v1, m2 ) f =
    case m2 of
        Just v2 ->
            Just (f v1 v2)

        Nothing ->
            Nothing
infixl 0 |?>


(<|?) : (a -> b -> c) -> ( a, Maybe b ) -> Maybe c
(<|?) =
    flip (|?>)
infixr 0 <|?


(?|>) : ( Maybe a, b ) -> (a -> b -> c) -> Maybe c
(?|>) ( m1, v2 ) f =
    case m1 of
        Just v1 ->
            Just (f v1 v2)

        Nothing ->
            Nothing
infixl 0 ?|>


(<?|) : (a -> b -> c) -> ( Maybe a, b ) -> Maybe c
(<?|) =
    flip (?|>)
infixr 0 <?|


(??>) : ( Maybe a, Maybe b ) -> (a -> b -> c) -> Maybe c
(??>) args f =
    case args of
        ( Just v1, Just v2 ) ->
            Just (f v1 v2)

        _ ->
            Nothing
infixl 0 ??>


(<??) : (a -> b -> c) -> ( Maybe a, Maybe b ) -> Maybe c
(<??) =
    flip (??>)
infixr 0 <??


(||=?>) : ( a, b ) -> (a -> b -> Maybe c) -> Maybe c
(||=?>) ( v1, v2 ) f =
    f v1 v2
infixl 0 ||=?>


(<||=?) : (a -> b -> Maybe c) -> ( a, b ) -> Maybe c
(<||=?) =
    flip (||=?>)
infixr 0 <||=?


(|?=?>) : ( a, Maybe b ) -> (a -> b -> Maybe c) -> Maybe c
(|?=?>) ( v1, m2 ) f =
    case m2 of
        Just v2 ->
            f v1 v2

        Nothing ->
            Nothing
infixl 0 |?=?>


(<|?=?) : (a -> b -> Maybe c) -> ( a, Maybe b ) -> Maybe c
(<|?=?) =
    flip (|?=?>)
infixr 0 <|?=?


(?|=?>) : ( Maybe a, b ) -> (a -> b -> Maybe c) -> Maybe c
(?|=?>) ( m1, v2 ) f =
    case m1 of
        Just v1 ->
            f v1 v2

        Nothing ->
            Nothing
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
