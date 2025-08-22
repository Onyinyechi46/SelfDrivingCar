module Main where

import Data.Char (toLower)

-- Define Traffic Light states
data TrafficLight = Red | Yellow | Green deriving (Show, Eq)

-- Define Car Action
data CarAction = Stop | Slow | Go deriving (Show, Eq)

-- AI function: decide car action based on traffic light
decideAction :: TrafficLight -> CarAction
decideAction light =
    case light of
        Red    -> Stop
        Yellow -> Slow
        Green  -> Go

-- Helper: Parse user input into a TrafficLight
parseTrafficLight :: String -> Maybe TrafficLight
parseTrafficLight str =
    case map toLower str of
        "red"    -> Just Red
        "yellow" -> Just Yellow
        "green"  -> Just Green
        _        -> Nothing

-- Main program (entry point)
main :: IO ()
main = do
    putStrLn "=== Self Driving Car AI ==="
    loop

-- Loop until user types "quit"
loop :: IO ()
loop = do
    putStrLn "Enter traffic light color (red, yellow, green) or type 'quit' to exit:"
    input <- getLine
    if map toLower input == "quit"
        then putStrLn "Exiting Self Driving Car AI..."
        else case parseTrafficLight input of
            Nothing -> do
                putStrLn "Invalid color! Please enter red, yellow, or green."
                loop
            Just light -> do
                let action = decideAction light
                putStrLn $ "Traffic light: " ++ show light
                putStrLn $ "Car action: " ++ show action
                loop
