module Blink where

import Control.Monad (forever)

import System.Hardware.Arduino

-- prepare the led
prepareLed :: Pin -> Arduino ()
prepareLed = flip setPinMode OUTPUT

-- make the led blink
blink :: Pin -> Arduino ()
blink l = do digitalWrite l True
             delay 1000
             digitalWrite l False
             delay 1000

-- Blink the led connected to port 13 on the Arduino UNO board.
main :: IO ()
main = withArduino False "/dev/ttyACM0" $ do
          let led = digital 13
          prepareLed led
          forever $ blink led
