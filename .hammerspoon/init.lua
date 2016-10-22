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

function bindmovetoratio(key, rx, ry, rw, rh)
  hs.hotkey.bind(mash, key, function()
    wm.movetoratio(hs.window.focusedWindow(), rx, ry, rw, rh)
  end)
end

function cyclewindowposition(key, configurations)
  local num = 0
  local lastWin

  hs.hotkey.bind(mash, key, function()
    local win = hs.window.focusedWindow()

    -- Select next configuration
    num = num + 1
    if num > #configurations or (lastwin and win:id() ~= win:id()) then
      num = 1
    end

    -- Remember stuff
    lastWin = win

    -- Apply configuration
    local c = configurations[num]
    wm.movetoratio(win, c[1], c[2], c[3], c[4])
  end)
end


-- Fullscreen
bindmovetoratio("Space", 0,   0,   1,   1)

-- Screen halves
cyclewindowposition("Left", { {0, 0, 0.5, 1}, {0, 0, 0.65, 1}, {0, 0, 0.35, 1} })
cyclewindowposition("Right", { {0.5, 0.0, 0.5, 1}, {0.35, 0, 0.65, 1}, {0.65, 0, 0.35, 1} })
cyclewindowposition("Up", { {0, 0, 1, 0.5}, {0, 0, 1, 0.65}, {0, 0, 1, 0.35} })
cyclewindowposition("Down", { {0, 0.5, 1, 0.5}, {0, 0.35, 1, 0.65}, {0, 0.65, 1, 0.35} })

-- Screen corners, with slight overlap
cyclewindowposition("1", { {0, 0, 0.6, 0.6}, {0, 0, 0.8, 0.8} })
cyclewindowposition("2", { {0.4, 0, 0.6, 0.6}, {0.2, 0, 0.8, 0.8} })
cyclewindowposition("3", { {0.4, 0.4, 0.6, 0.6}, {0.2, 0.2, 0.8, 0.8} })
cyclewindowposition("4", { {0, 0.4, 0.6, 0.6}, {0, 0.2, 0.8, 0.8} })
cyclewindowposition("5", { { 0.2, 0.2, 0.6, 0.6 }, { 0.1, 0.1, 0.8, 0.8 } })


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
--- Manual Reloading
---

hs.hotkey.bind(mash, "R", function()
  hs.reload()
end)


---
--- Automatic Reloading
---

function reloadConfig(files)
  doReload = false

  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end

  if doReload then
    hs.reload()
  end
end

local myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

-- Notify user that configuration has been loaded
hs.alert.show("Config loaded")
