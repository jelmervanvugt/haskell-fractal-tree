# haskell-fractal-tree
a fractal tree written in haskell using visual studio code. as part of the bachelor program software engineering at the HAN in Nijmegen.

## Prerequisites
To be able to run the Haskell fractal tree a few prerequisites are needed.

| Prerequisite      | Where |   Version used by me |
| ----------- | ----------- | ----------- |
| Haskell Cabal      | https://www.haskell.org/cabal/       | v3.4.0.0 |
| Haskell GHCi   | https://www.haskell.org/ghc/        | v9.0.1 |
| Cabal package Gloss | https://hackage.haskell.org/package/gloss | unknown |
| Gloss dependency freeGLUT | https://www.transmissionzero.co.uk/software/freeglut-devel/ | v3.0.0 |
<br>

The freeGLUT _.dll_ has already been included in the 'mylibs' folder. However, for the application to run properly the device executing the fractal tree also needs to add the file to it's PATH system variables.
<br></br>

## How to execute
If not already, we need to install the Gloss package using Cabal. This is done by executing the command below in a terminal located in the root of the project.

```
cabal install gloss
``` 

Secondly we build the project.
 ```
cabal build haskell-fractal-tree
```

Lastly we can execute the project.
 ```
cabal run haskell-fractal-tree
```