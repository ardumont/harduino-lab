module MorseTests where

import Morse (wordToMorse, sentenceToMorse)
import Test.HUnit

-- ######### Tests

testWordToMorse1 :: Test.HUnit.Test
testWordToMorse1 = [[0,1,0,0],[0,0],[0,0,1,0],[0]]
                   ~=?
                   wordToMorse "life"

testWordToMorse2 :: Test.HUnit.Test
testWordToMorse2 = [[0,1,0,0],[0,0],[0,0,1,0],[0]]
                   ~=?
                   wordToMorse "LIFE"

testWordToMorses :: Test.HUnit.Test
testWordToMorses = TestList ["testWordToMorse1" ~: testWordToMorse1
                            ,"testWordToMorse2" ~: testWordToMorse2]

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
