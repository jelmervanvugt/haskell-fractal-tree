{-
    Author: Jelmer van Vugt
    Date: 07/06/2022
    PO Paradigma - APP, Hogeschool van Arnhem en Nijmegen
-}

module Main where

import Graphics.Gloss

type Model = [Picture -> Picture]

algoScale :: Float
algoScale = 1 / sqrt 2

fractalAlgorithm :: Model 
fractalAlgorithm = [ Translate 50 100 . Scale algoScale algoScale . Rotate 45, Translate (-50) 100 . Scale algoScale algoScale . Rotate (-45) ]  
{-
    algoScale
    - variable that calculates how much the rect needs to downsize each iteration

    fractalAlgorithm
    - algorithm that'll result in a Pythagoras' fractal tree
-}

applyAlgorithm :: Int -> Model -> Picture -> [Picture] 
applyAlgorithm max model pict = take max (iterate (mconcat model) pict)
{-
    algorithm
    - algorithm that'll result in a pythagoras' fractal tree
    
    applyAlgorithm
    - applies the algorithm recursively to an instance of pict for every entry in model
    - arg1 : max n of iterations on algorithm
    - arg2 : model in its entirety
    - arg3 : gloss 2d object to use for algorithm visual    
-}


fractal :: Int -> Model -> Picture -> Picture
fractal max model pict = pictures $ applyAlgorithm max model pict
{-
    pictures 
    - [Picture] -> Picture
    - appends array of pictures into one, enabling us to use the display function
-}

pythagor :: Float -> Picture
pythagor time 
  | (ceiling time) `mod` 2 == 0 = Color white tree
  | otherwise = Color blue tree
  where tree = fractal 10 fractalAlgorithm $ rectangleWire 100 100
{-
    calls the fractal function with max 10 iterations on the algorithm.
    uses a rectangle of 100x100 px as the 2D object for the visual.   
    
    pythagor changes fractal tree color based on time variable passed by animate in main function
-}

main = animate (InWindow "Fractal Tree" (800, 800) (10, 10)) black $ pythagor 
{-
    animate
    - arg1 : window type
    - arg2 : window background color
    - arg3 : picture to display in window

    InWindow
    - arg1 : name of window
    - arg2 : size of window
    - arg3 : position of window on screen
-}