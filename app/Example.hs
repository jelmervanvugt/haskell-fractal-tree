module Example where

import Graphics.Gloss

type Model = [Picture -> Picture]
 
fractal :: Int -> Model -> Picture -> Picture
fractal n model pict = pictures $ take n $ iterate (mconcat model) pict

pithagor _ = fractal 10 model $ rectangleWire 100 100
  where model = [ Translate 50 100 . Scale s s . Rotate 45
                , Translate (-50) 100 . Scale s s . Rotate (-45)]
        s = 1/sqrt 2
 
main = animate (InWindow "Tree" (800, 800) (0, 0)) white $ pithagor . (* 60)