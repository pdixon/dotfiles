import XMonad
import XMonad.Config.Gnome
import XMonad.Layout.Tabbed
import XMonad.Layout.PerWorkspace
import XMonad.Layout.IM
import XMonad.Layout.Reflect


myBaseConfig = gnomeConfig
myModMask = mod4Mask

-- display
-- replace the bright red border with a more stylish colour
myBorderWidth = 2
myNormalBorderColor = "#202030"
myFocusedBorderColor = "#A0A0D0"

-- workspaces
myWorkspaces :: [String]
myWorkspaces = 
    [ "Shells", "Emacs", "Web", "IM", "Music", "Misc"]

-- layouts
basicLayout = Tall nmaster delta ratio where
    nmaster = 1
    delta = 3/100
    ratio = 1/2
tallLayout = basicLayout
singleLayout = simpleTabbed
imLayout = withIM (0.2) (Role "contact list") $ reflectHoriz $ withIM (0.2) (ClassName "gwibber") simpleTabbed

myLayoutHook = im $ normal where
    normal = tallLayout ||| singleLayout
    im = onWorkspace "IM" imLayout

-- put it all together
main = xmonad $ myBaseConfig
       { modMask = myModMask
       , workspaces = myWorkspaces
       , layoutHook = myLayoutHook
--       , manageHook = myManageHook
       , borderWidth = myBorderWidth
       , normalBorderColor = myNormalBorderColor
       , focusedBorderColor = myFocusedBorderColor
--       , keys = myKeys
--       , mouseBindings = myMouseBindings
       }