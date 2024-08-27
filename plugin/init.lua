local wezterm = require("wezterm")

---@class init_module
local pub = {}

--- Send command to panes
--- @param cmd string
--- @param panes MuxPane[] Table of wezterm.Pane
function pub.send_cmd_to_panes(cmd, panes)
    for _, p in pairs(panes) do
        p:send_text(cmd .. "\r")
      end
end

--- Send command to tab's panes
--- @param cmd string
--- @param tab MuxTab
function pub.send_cmd_to_tab_panes(cmd, tab)
    pub.send_cmd_to_panes(cmd, tab:panes())
end

--- Wezterm action_callback
function pub.send_cmd_to_tab_panes_action()
    return wezterm.action_callback(function(window, _,line)
        if line then
            pub.send_cmd_to_tab_panes(line, window:active_tab())
        end
    end)
end

--- Apply configurations to plugin
--- @param config ConfigBuilder
--- @param opts { description: string?, key: string?, mods: string? }?
function pub.apply_to_config(config, opts)
    local key = 'mapped:s'
    local mods = 'CMD|SHIFT'
    local description = 'Enter command to send to all panes of active tab'

    if opts then
        if opts.key then
            key = opts.key
        end

        if opts.mods then
            mods = opts.mods
        end

        if opts.description then
            description = opts.description
        end
    end

    table.insert(config.keys, {
        key = key,
        mods = mods,
        action = wezterm.action.PromptInputLine {
            description = description,
            action = pub.send_cmd_to_tab_panes_action()
        },
    })
end

return pub