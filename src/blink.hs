module Blink where

import Control.Monad (forever)

import System.Hardware.Arduino
import System.Environment

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
run :: String -> IO ()
run device = withArduino False device $ do
               let led = digital 13
               prepareLed led
               forever $ blink led

-- *Blink> run "/dev/ttyACM0"
--   C-c C-chArduino: Caught Ctrl-C, quitting..

-- run from the cli
main :: IO ()
main =
  do (devicePath:_) <- getArgs
     run devicePath
