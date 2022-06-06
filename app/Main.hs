module Main where

import Graphics.Gloss

type Model = [Picture -> Picture]

algoScale :: Float
algoScale = 1/sqrt 2

algorithm :: Model 
algorithm = [ Translate 50 100 . Scale algoScale algoScale . Rotate 45, Translate (-50) 100 . Scale algoScale algoScale . Rotate (-45) ]  

fractal :: Int -> Model -> Picture -> Picture
fractal n model pict = pictures (take n ( iterate (mconcat model) pict))
{-
    fractal
    - arg1 : max n of iterations on algorithm
    - arg2 : model in its entirety
    - arg3 : gloss 2d object to use for algorithm visual

    pictures 
    - [Picture] -> Picture
-}

pithagor = fractal 10 algorithm $ rectangleWire 100 100
{-
    Calls the fractal function with max 10 iterations on the algorithm.
    Uses a rectangle of 100x100 px as the 2D object for the visual.   
-}

main = display (InWindow "Fractal Tree" (800, 800) (10, 10)) black $ Color white pithagor
{-

    display
    - arg1 : window type
    - arg2 : window background color
    - arg3 : picture to display in window

    InWindow
    - arg1 : name of window
    - arg2 : size of window
    - arg3 : position of window on screen

-}