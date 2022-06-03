module Main where

import Graphics.Gloss

type Model = [Picture -> Picture]


testRect :: Float -> Float -> Picture
testRect x y = rectangleWire x y

pic1 :: Picture
pic1 = testRect 100 100 

pic2 :: Picture
pic2 = testRect 200 200

pictures :: Model 
pictures = [pic1, pic2]



pitaghoras :: Picture
pitaghoras = rectangleWire 100 100

main = display (InWindow "Fractal Tree" (800, 800) (10, 10)) black (Color white (pitaghoras))