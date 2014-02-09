module MorseTests where

import Morse
import Test.HUnit
import qualified Data.Map as Map

-- ######### Tests

testWordToMorse1 :: Test.HUnit.Test
testWordToMorse1 = [[0,1,0,0],[0,0],[0,0,1,0],[0]]
                   ~=?
                   wordToMorse "life"

testWordToMorses :: Test.HUnit.Test
testWordToMorses = TestList ["testWordToMorse1" ~: testWordToMorse1]

testSentenceToMorse1 :: Test.HUnit.Test
testSentenceToMorse1 = [[[1],[0,0,0,0],[0]],[[0,1],[1,0],[0,0,0],[0,1,1],[0],[0,1,0]],[[1],[1,1,1]],[[0,1,0,0],[0,0],[0,0,1,0],[0],[]],[[1],[0,0,0,0],[0]],[[0,0,1],[1,0],[0,0],[0,0,0,1],[0],[0,1,0],[0,0,0],[0]],[[0,1],[1,0],[1,0,0]],[[0],[0,0,0,1],[0],[0,1,0],[1,0,1,1],[1],[0,0,0,0],[0,0],[1,0],[1,1,0]]]
                       ~=?
                       (sentenceToMorse . words) "the answer to life, the universe and everything"

testSentenceToMorses :: Test.HUnit.Test
testSentenceToMorses = TestList ["testSentenceToMorse1" ~: testSentenceToMorse1]

-- Full tests
tests :: Test.HUnit.Test
tests = TestList [testWordToMorses
                 ,testSentenceToMorses]

main :: IO ()
main = runTestTT tests >>= print
