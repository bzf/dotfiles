import XMonad
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import System.IO

main :: IO ()
main = do
  xmproc <- spawnPipe "setxkbmap -option ctrl:nocaps"
  xmproc <- spawnPipe "xmobar"
  xmonad
    $                 defaultConfig
                        { terminal           = "alacritty"
                        , borderWidth        = 1
                        , focusedBorderColor = "#1C1C1C"
                        , normalBorderColor  = "#1C1C1C"
                        , modMask            = mod4Mask
                        , manageHook = manageDocks <+> manageHook defaultConfig
                        , layoutHook = avoidStruts $ layoutHook defaultConfig
                        , logHook            = dynamicLogWithPP xmobarPP
                          { ppOutput = hPutStrLn xmproc
                          , ppTitle  = xmobarColor "green" "" . shorten 50
                          }
                        }
    `additionalKeys`  [((mod4Mask, xK_p), spawn "rofi -show run")]
    `additionalKeysP` [ ("<XF86MonBrightnessUp>"  , spawn "xbacklight -inc 5")
                      , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 5")
                      ]
