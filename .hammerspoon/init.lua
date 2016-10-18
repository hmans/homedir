--- keyboard shortcut prefix
mash = {"cmd", "alt", "ctrl"}

--- window animation speed
hs.window.animationDuration = 0

--- padding to apply to all resized windows
padding = 3


---
--- Window management
---

local wm = {}

function wm.moveto(win, x, y, w, h)
  local f = win:frame()

  f.x = x
  f.y = y
  f.w = w
  f.h = h

  win:setFrame(f)
end

function wm.movetoratio(win, rx, ry, rw, rh)
  local max = win:screen():frame()

  wm.moveto(win,
    (max.x + padding) + (rx * max.w),
    (max.y + padding) + (ry * max.h),
    max.w * rw - 2 * padding,
    max.h * rh - 2 * padding)
end

hs.hotkey.bind(mash, "Left", function()
  wm.movetoratio(hs.window.focusedWindow(), 0, 0, 0.5, 1)
end)

hs.hotkey.bind(mash, "Right", function()
  wm.movetoratio(hs.window.focusedWindow(), 0.5, 0, 0.5, 1)
end)

hs.hotkey.bind(mash, "Up", function()
  wm.movetoratio(hs.window.focusedWindow(), 0, 0, 1, 0.5)
end)

hs.hotkey.bind(mash, "Down", function()
  wm.movetoratio(hs.window.focusedWindow(), 0, 0.5, 1, 0.5)
end)

hs.hotkey.bind(mash, "Space", function()
  wm.movetoratio(hs.window.focusedWindow(), 0, 0, 1, 1)
end)


---
--- Caffeination
---

local caffeine = hs.menubar.new()

function setCaffeineDisplay(state)
  caffeine:setTitle(state and "☕" or "💤")
end

if caffeine then
  caffeine:setClickCallback(function()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
  end)

  setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end


---
--- Reloading
---

hs.hotkey.bind(mash, "R", function()
  hs.reload()
end)

hs.alert.show("Config loaded")
