import XMonad
import XMonad.Util.EZConfig

main :: IO ()
main = do
    xmonad $ defaultConfig
        { terminal = "st"
        , borderWidth = 1
        , focusedBorderColor = "#1C1C1C"
        , normalBorderColor = "#1C1C1C"
        , modMask = mod4Mask
        }
