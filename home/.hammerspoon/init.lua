hs.window.animationDuration = 0
units = {
-- all monitors
  maximum       = { x = 0.00, y = 0.00, w = 1.00, h = 1.00 },
-- big monitors, split into 3rds
  right33       = { x = 0.66, y = 0.00, w = 0.33, h = 1.00 },
  left33        = { x = 0.00, y = 0.00, w = 0.33, h = 1.00 },
  top33         = { x = 0.00, y = 0.00, w = 1.00, h = 0.33 },
  bot33         = { x = 0.00, y = 0.66, w = 1.00, h = 0.33 },
  vmid33        = { x = 0.00, y = 0.33, w = 1.00, h = 0.33 },
  center        = { x = 0.3291, y = 0.10, w = 0.33, h = 1.00 },
-- don't know what these are for
  right70       = { x = 0.33, y = 0.00, w = 0.70, h = 1.00 },
  left70        = { x = 0.00, y = 0.00, w = 0.70, h = 1.00 },
-- smol monitors
  top50         = { x = 0.00, y = 0.00, w = 1.00, h = 0.50 },
  bot50         = { x = 0.00, y = 0.50, w = 1.00, h = 0.50 },
  upright33     = { x = 0.70, y = 0.00, w = 0.33, h = 0.50 },
  botright33    = { x = 0.70, y = 0.50, w = 0.33, h = 0.50 },
  upleft70      = { x = 0.00, y = 0.00, w = 0.70, h = 0.50 },
  botleft70     = { x = 0.00, y = 0.50, w = 0.70, h = 0.50 }
}

mash = { 'control', 'option', 'cmd' }
-- all monitors
hs.hotkey.bind(mash, 'm', function() hs.window.focusedWindow():move(units.maximum,    nil, true) end)
-- big monitors, split in 3rds
hs.hotkey.bind(mash, 'l', function() hs.window.focusedWindow():move(units.right33,    nil, true) end)
hs.hotkey.bind(mash, 'h', function() hs.window.focusedWindow():move(units.left33,     nil, true) end)
hs.hotkey.bind(mash, 'j', function() hs.window.focusedWindow():move(units.bot33,      nil, true) end)
hs.hotkey.bind(mash, 'n', function() hs.window.focusedWindow():move(units.vmid33,     nil, true) end)
hs.hotkey.bind(mash, 'c', function() hs.window.focusedWindow():move(units.center,     nil, true) end)
-- small monitors, split in half
hs.hotkey.bind(mash, 'k', function() hs.window.focusedWindow():move(units.top50,      nil, true) end)
-- big monitor layers:  | bigbox | littlebox |
hs.hotkey.bind(mash, '[', function() hs.window.focusedWindow():move(units.upleft70,   nil, true) end)
hs.hotkey.bind(mash, ']', function() hs.window.focusedWindow():move(units.upright33,  nil, true) end)
hs.hotkey.bind(mash, ';', function() hs.window.focusedWindow():move(units.botleft70,  nil, true) end)
hs.hotkey.bind(mash, "'", function() hs.window.focusedWindow():move(units.botright33, nil, true) end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)
