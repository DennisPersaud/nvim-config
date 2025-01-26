----------------------------------------------------------------------
--      ██▓ ███▄    █  ██▓▄▄▄█████▓      ██▒   █▓ ██▓ ███▄ ▄███▓
--     ▓██▒ ██ ▀█   █ ▓██▒▓  ██▒ ▓▒     ▓██░   █▒▓██▒▓██▒▀█▀ ██▒
--     ▒██▒▓██  ▀█ ██▒▒██▒▒ ▓██░ ▒░      ▓██  █▒░▒██▒▓██    ▓██░
--     ░██░▓██▒  ▐▌██▒░██░░ ▓██▓ ░        ▒██ █░░░██░▒██    ▒██
--     ░██░▒██░   ▓██░░██░  ▒██▒ ░  ██▓    ▒▀█░  ░██░▒██▒   ░██▒
--     ░▓  ░ ▒░   ▒ ▒ ░▓    ▒ ░░    ▒▓▒    ░ ▐░  ░▓  ░ ▒░   ░  ░
--      ▒ ░░ ░░   ░ ▒░ ▒ ░    ░     ░▒     ░ ░░   ▒ ░░  ░      ░
--      ▒ ░   ░   ░ ░  ▒ ░  ░       ░        ░░   ▒ ░░      ░
--      ░           ░  ░             ░        ░   ░         ░
--                                   ░       ░
----------------------------------------------------------------------

if package.config:sub(1, 1) == "\\" then
	-- code to execute on Windows
	print("Running Windows config")
	require("win")
elseif package.config:sub(1, 1) == "/" then
	-- code to execute on Linux
	print("Running Linux config")
	require("linux")
else
	-- No config
	print("OS undetected no config loaded")
end
