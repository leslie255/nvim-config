local M = {}

function M.config()
    -- default components
    local bufferlist = require("ide.components.bufferlist")
    local explorer   = require("ide.components.explorer")
    local outline    = require("ide.components.outline")
    local timeline   = require("ide.components.timeline")
    local terminal   = require("ide.components.terminal")
    local changes    = require("ide.components.changes")
    local commits    = require("ide.components.commits")
    local branches   = require("ide.components.branches")

    require("ide").setup({
        -- The global icon set to use.
        -- values: "nerd", "codicon", "default"
        icon_set = "nerd",
        -- Component specific configurations and default config overrides.
        components = {
            -- The global keymap is applied to all Components before construction.
            -- It allows common keymaps such as "hide" to be overriden, without having
            -- to make an override entry for all Components.
            --
            -- If a more specific keymap override is defined for a specific Component
            -- this takes precedence.
            global_keymaps = {
                maximize = "=",
                minimize = "-",
                hide = "X",
            },
            Explorer = {
                list_directories_first = true,
                disabled_keymaps = false,
                keymaps = {
                    change_dir = "<NOP>",
                    close = "X",
                    collapse = "c",
                    collapse_all = "<NOP>",
                    copy_file = "y",
                    delete_file = "d",
                    deselect_file = "<S-SPACE>",
                    edit = "<CR>",
                    edit_split = "<C-x>",
                    edit_tab = "<C-t>",
                    edit_vsplit = "<C-v>",
                    expand = "o",
                    file_details = "f",
                    hide = "<NOP>",
                    maximize = "+",
                    minimize = "-",
                    move_file = "m",
                    new_dir = "<NOP>",
                    new_file = "a",
                    rename_file = "r",
                    select_file = "<Space>",
                    toggle_exec_perm = "<NOP>",
                    up_dir = "<NOP>",
                }
            }
        },
        -- default panel groups to display on left and right.
        panels = {
            left = "explorer",
            right = "git",
        },
        -- panels defined by groups of components, user is free to redefine the defaults
        -- and/or add additional.
        panel_groups = {
            explorer = {
                outline.Name,
                explorer.Name,
            },
            terminal = { terminal.Name },
            git = {
                changes.Name,
                timeline.Name,
                branches.Name,
                commits.Name,
            },
        },
        -- workspaces config
        workspaces = {
            -- which panels to open by default, one of: 'left', 'right', 'both', 'none'
            auto_open = "left",
        },
        -- default panel sizes for the different positions
        panel_sizes = {
            left = 30,
            right = 30,
            bottom = 15
        }
    })
end

return M
