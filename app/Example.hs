module Example where

import Graphics.Gloss

type Model = [Picture -> Picture]
 
fractal :: Int -> Model -> Picture -> Picture
fractal n model pict = pictures $ take n $ iterate (mconcat model) pict

{-
        iterate (mconcat model)
        - itereert over elk item in model 
        - begint met pict als start item

        take n
        - pakt x aantal van de array die iterate produceert
        - hierdoor zorg je dat de fractal tree niet oneindig doorgaat

        pictures
        - Model [Picture -> Picture] dat de voorgaande functies produceren
-}
 

pithagor _ = fractal 10 model $ rectangleWire 100 100
  where model = [ Translate 50 100 . Scale s s . Rotate 45
                , Translate (-50) 100 . Scale s s . Rotate (-45)]
        s = 1/sqrt 2
 
main = animate (InWindow "Tree" (800, 800) (0, 0)) white $ pithagor . (* 60)

{-
        InWindow
        - arg1 : naam van window
        - arg2 : groote van window
        - arg3 : reference points van window op scherm       
-}




 
