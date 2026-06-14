-- pinkterm — Terminal.app theme installer
-- Creates a "Pinkterm" settings set with a dark-plum + pink palette and
-- sets it as the default + startup profile.

on rgb(r, g, b)
	-- macOS AppleScript color: each channel is 0-65535
	return {r * 257, g * 257, b * 257}
end rgb

tell application "Terminal"
	set profileName to "Pinkterm"
	set existing to name of every settings set

	if profileName is in existing then
		set target to settings set profileName
	else
		set base to settings set "Pro"
		set target to (duplicate base)
		set name of target to profileName
	end if

	-- Window
	set background color of target to my rgb(27, 14, 22)
	set normal text color of target to my rgb(255, 217, 230)
	set bold text color of target to my rgb(255, 230, 240)
	set cursor color of target to my rgb(255, 102, 179)

	-- ANSI palette (pastel + hot pink mix)
	try
		set ansi black color of target to my rgb(45, 31, 41)
		set ansi red color of target to my rgb(255, 95, 162)
		set ansi green color of target to my rgb(184, 232, 160)
		set ansi yellow color of target to my rgb(255, 209, 164)
		set ansi blue color of target to my rgb(200, 168, 255)
		set ansi magenta color of target to my rgb(255, 138, 204)
		set ansi cyan color of target to my rgb(255, 184, 224)
		set ansi white color of target to my rgb(255, 240, 245)

		set ansi bright black color of target to my rgb(92, 61, 81)
		set ansi bright red color of target to my rgb(255, 133, 184)
		set ansi bright green color of target to my rgb(212, 245, 179)
		set ansi bright yellow color of target to my rgb(255, 225, 189)
		set ansi bright blue color of target to my rgb(220, 200, 255)
		set ansi bright magenta color of target to my rgb(255, 168, 219)
		set ansi bright cyan color of target to my rgb(255, 209, 236)
		set ansi bright white color of target to my rgb(255, 255, 255)
	end try

	-- Font + window basics
	try
		set font of target to "Menlo"
		set size of target to 14
		set font antialiasing of target to true
	end try
	try
		set number of rows of target to 36
		set number of columns of target to 110
	end try

	-- Apply as default + startup for new windows
	set default settings to target
	set startup settings to target

	return "Pinkterm profile installed and set as default."
end tell
