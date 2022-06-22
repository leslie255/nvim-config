-- aleph is a stripped down version of goolord/alpha-nvim to improve startup time
local M = {}
function M.config()
	local aleph = require("aleph")
	local dashboard = require("aleph.themes.dashboard")
	aleph.setup(dashboard.opts)
	-- Disable folding on aleph buffer:
	vim.cmd("autocmd FileType aleph setlocal nofoldenable")
end

return M
