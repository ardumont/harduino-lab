module Morse where

import qualified Data.Map as Map
import System.Hardware.Arduino
import System.Environment

-- unit of time (ms)
unitOfTime :: Integer
unitOfTime = 300

-- short pulse
dit :: Integer
dit = 1 * unitOfTime

-- long pulse
dahs :: Integer
dahs = 3 * unitOfTime

pauseBetweenLetters :: Integer
pauseBetweenLetters = 3 * unitOfTime

pauseBetweenWords :: Integer
pauseBetweenWords = 7 * unitOfTime

-- http://www.colorpilot.com/morse.html

-- map representation of the morse
morseMap :: Map.Map Char [Integer]
morseMap = Map.fromList [('a', [0,1]),
                         ('b', [1,0,0,0]),
                         ('c', [1,0,1,0]),
                         ('d', [1,0,0]),
                         ('e', [0]),
                         ('f', [0,0,1,0]),
                         ('g', [1,1,0]),
                         ('h', [0,0,0,0]),
                         ('i', [0,0]),
                         ('j', [0,1,1,1]),
                         ('k', [1,0,1]),
                         ('l', [0,1,0,0]),
                         ('m', [1,1]),
                         ('n', [1,0]),
                         ('o', [1,1,1]),
                         ('p', [0,1,1,0]),
                         ('q', [1,1,0,1]),
                         ('r', [0,1,0]),
                         ('s', [0,0,0]),
                         ('t', [1]),
                         ('u', [0,0,1]),
                         ('v', [0,0,0,1]),
                         ('w', [0,1,1]),
                         ('x', [1,0,0,1]),
                         ('y', [1,0,1,1]),
                         ('z', [1,1,0,0])]

type Bit = Integer
type Word = String
type Sentence = [Word]

wordToMorse :: Word -> [[Bit]]
wordToMorse =
  map morseWord
  where morseWord w = case (Map.lookup w morseMap) of
          Just v -> v
          _      -> []

sentenceToMorse :: Sentence -> [[[Bit]]]
sentenceToMorse = map wordToMorse
