local M = {}
function M.config()
	require("toggleterm").setup {
		-- size can be a number or function which is passed the current terminal
		size = 30,
		open_mapping = "<f5>",
		on_open = function() end, -- function to run when the terminal opens
		on_close = function() end, -- function to run when the terminal closes
		on_stdout = function() end, -- callback for processing output on stdout
		on_stderr = function() end, -- callback for processing output on stderr
		on_exit = function() end, -- function to run when terminal process exits
		hide_numbers = true, -- hide the number column in toggleterm buffers
		shade_filetypes = {},
		highlights = {
			-- highlights which map to a highlight group name and a table of it's values
			-- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
		},
		shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
		shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
		start_in_insert = true,
		insert_mappings = true, -- whether or not the open mapping applies in insert mode
		terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
		persist_size = true,
		persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
		direction = 'horizontal', -- 'horizontal' 'vertical' 'tab' 'float'
		close_on_exit = true, -- close the terminal window when the process exits
		shell = vim.o.shell, -- change the default shell
		auto_scroll = true, -- automatically scroll to the bottom on terminal output
		-- This field is only relevant if direction is set to 'float'
		float_opts = {
			-- The border key is *almost* the same as 'nvim_open_win'
			-- see :h nvim_open_win for details on borders however
			-- the 'curved' border is a custom border type
			-- not natively supported but implemented in this plugin.
			border = 'single',
			-- like `size`, width and height can be a number or function which is passed the current terminal
			width = 140,
			height = 50,
			winblend = 1,
		},
		winbar = {
			enabled = false,
			name_formatter = function(term) --  term: Terminal
				return term.name
			end
		},
	}
end

return M
