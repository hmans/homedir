--- keyboard shortcut prefix
mash = {"cmd", "alt", "ctrl"}

--- window animation speed
hs.window.animationDuration = 0

--- padding to apply to all resized windows
padding = 3


---
--- Window management
---

function movewindow(win, rx, ry, rw, rh)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = (max.x + padding) + (rx * max.w)
  f.y = (max.y + padding) + (ry * max.h)
  f.w = max.w * rw - 2 * padding
  f.h = max.h * rh - 2 * padding

  win:setFrame(f)
end

hs.hotkey.bind(mash, "Left", function()
  movewindow(hs.window.focusedWindow(), 0, 0, 0.5, 1)
end)

hs.hotkey.bind(mash, "Right", function()
  movewindow(hs.window.focusedWindow(), 0.5, 0, 0.5, 1)
end)

hs.hotkey.bind(mash, "Up", function()
  movewindow(hs.window.focusedWindow(), 0, 0, 1, 0.5)
end)

hs.hotkey.bind(mash, "Down", function()
  movewindow(hs.window.focusedWindow(), 0, 0.5, 1, 0.5)
end)

hs.hotkey.bind(mash, "Space", function()
  movewindow(hs.window.focusedWindow(), 0, 0, 1, 1)
end)


---
--- Caffeination
---

local caffeine = hs.menubar.new()

function setCaffeineDisplay(state)
  if state then
    caffeine:setTitle("AWAKE")
  else
    caffeine:setTitle("SLEEPY")
  end
end

function caffeineClicked()
  setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
  caffeine:setClickCallback(caffeineClicked)
  setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end


---
--- Reloading
---

hs.hotkey.bind(mash, "R", function()
  hs.reload()
end)

hs.alert.show("Config loaded")
