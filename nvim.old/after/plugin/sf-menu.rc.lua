local status, sf = pcall(require, 'sf-menu.config')
if (not status) then return end

sf.setup()
