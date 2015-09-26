import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import qualified XMonad.StackSet as W


main = xmonad =<< xmobar myConfig 


myConfig = defaultConfig {
    terminal           = myTerminal,
    modMask            = myModMask,
    borderWidth        = myBorderWidth,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,
    startupHook        = myStartupHook,
    workspaces         = myWorkspaces
    } `additionalKeys` surfacePro3Keys


surfacePro3Keys =
    [ ((0, 0x1008ff13), spawn "amixer set Master 2%+"),
      ((0, 0x1008ff11), spawn "amixer set Master 2%-"),
      ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s"),
      ((0, xK_Print), spawn "scrot")
    ]
    

myWorkspaces :: [WorkspaceId]
myWorkspaces = ["1:any", "2:code", "3:config"]


myStartupHook :: X ()
myStartupHook = do
                 spawnToWorkspace "1:any" "gnome-terminal -e 'bash -c ~/.xmonad/invaders.bash;bash'"
                 spawnToWorkspace "3:config" "gnome-terminal -x vim $HOME/.xmobarrc"
                 spawnToWorkspace "3:config" "gnome-terminal -x vim $HOME/.xmonad/xmonad.hs"
                 spawnToWorkspace "3:config" "gnome-terminal -x vim $HOME/.vimrc"


spawnToWorkspace :: String -> String -> X ()
spawnToWorkspace workspace program = do
                                      spawn program
                                      windows $ W.greedyView workspace


myTerminal           = "gnome-terminal"
myTerminalClass      = "Gnome-terminal"
myModMask            = mod4Mask -- rebind mod key to windows key 
myBorderWidth        = 3 
myNormalBorderColor  = "#073642"
myFocusedBorderColor = "#268bd2"
