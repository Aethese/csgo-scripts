-- plays a sound file when opening the menu

local executed = false
local tab, container = 'CONFIG', 'Lua'

local ui_enabled = ui.new_checkbox(tab, container, 'Sound on menu open')
local ui_label = ui.new_label(tab, container, 'File name')
local ui_file = ui.new_textbox(tab, container, 'File name text box')

local on_paint_ui = function()
	local enabled = ui.get(ui_enabled)

	if not enabled then return end
	
	local is_menu_open = ui.is_menu_open()
	local file = ui.get(ui_file)

	if is_menu_open then
		if not executed then
			client.exec(string.format('playvol %s 1', file))
			executed = true
		end
	else
		executed = false
	end
end

client.set_event_callback('paint_ui', on_paint_ui)
