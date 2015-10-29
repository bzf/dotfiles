import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig

main = xmonad =<< xmobar myConfig

myConfig = 
  defaultConfig
    { terminal    = myTerminal
      , modMask     = myModMask
      , borderWidth = myBorderWidth
    } `additionalKeysP`
    [
      ("M-w M-w", spawn "~/.bin/layout_switch.sh" )
    ] 

myTerminal    = "urxvt"
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 3
