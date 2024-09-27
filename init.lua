local preq = require('utils').preq

local modules = {
  'settings',
  'settings.keymap',
  'lazy-setup',
}

for _, module in ipairs(modules) do
  preq(module)
end
