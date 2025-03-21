return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify") -- sets the theme of alpha (can be changed )
		math.randomseed(os.time()) -- randomize the random function

		local dashboards = { -- add funny ascii art here
			{
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣶⡶⣶⣶⣤⣀⣤⣤⣤⣤⡴⡶⢶⢶⣚⢿⣩⢳⡍⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣾⣿⣷⣻⡝⣿⣿⣿⣿⣻⢷⡹⣏⢷⡹⣎⢷⣣⣟⡆⢷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣗⡿⣿⠿⣷⣹⣳⡟⣧⢿⣏⢷⡻⣜⢏⠷⣙⡞⣻⣿⣿⡀⢟⠄⠀⠀⠀Fuck those idiots.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣷⢮⣿⣛⣾⣿⣳⢿⡽⣾⣹⢞⡷⢍⢎⡱⢣⣜⡱⣊⠷⣌⠃⠨⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣾⣿⣿⣿⣳⢯⣳⢏⣷⡯⠿⢞⣺⣒⣷⣋⡜⢧⢎⣕⠚⡠⣸⣿⣿⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⡿⣾⡷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⡿⣟⣿⣿⣿⣿⢿⣟⡷⢯⡻⠼⣯⣷⣦⣿⣿⣿⣿⣿⣷⣌⣎⢣⣜⣧⡔⢻⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠠⡏⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣻⡽⢛⣴⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⡹⢯⣷⢯⡟⣞⣯⢾⡹⢣⠍⡘⠉⠈⠙⠿⣿⣿⣿⣿⠟⣿⣿⣿⣿⣶⣿⣷⣟⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠺⣦⡀⣧⣄⣀⣀⣀⡀⠀⠀⠀⢠⣾⡿⣯⡿⣟⣶⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣟⡾⣟⣧⢻⣾⢽⣺⡼⢣⢣⠁⠄⠀⠀⠀⠀⠀⠞⠯⠟⠁⠂⠸⢿⡿⣿⣿⣿⣿⣿⣾⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢠⡀⠀⠀⠈⠻⣷⡈⠉⠩⠉⠄⠀⢀⣼⣿⢯⣷⢟⣽⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⡿⣟⣯⣟⡾⣟⣿⣞⡿⣞⣯⣷⢻⣍⠦⢩⠐⡀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣥⢻⢍⠻⣹⢾⣽⣿⣿⣿⣿⣦⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠊⠳⣄⠀⠀⠀⠈⠛⠃⠀⠀⢀⣴⣿⣿⡟⣟⣵⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⢿⣹⢟⣯⢷⢯⢿⡽⣾⣟⣿⣽⡶⣯⡟⣼⢫⢆⠳⣀⠐⠀⠀⠠⠄⠀⣀⣴⡀⢞⣮⢦⢃⡜⢋⡿⣿⣿⣿⣿⣿⣧⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠚⢷⡶⠶⢤⣬⣷⣄⡀⠀⠀⠀⢀⣴⣿⣿⢏⣟⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣛⣾⣹⡞⣽⣚⢿⣺⣽⣳⢿⣻⣿⣟⡷⣿⢯⣟⣮⢻⡡⣙⠀⠀⡗⢀⣿⢭⣿⣷⡾⢟⡂⢏⢣⢳⢿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠹⢦⡀⠀⠈⠉⠀⠀⠀⣠⣾⣿⣛⣞⣯⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣼⣳⢽⣣⢯⢷⣣⢯⡝⣯⠿⣽⢿⣻⣽⣯⣟⣾⣳⢿⡬⣍⠂⢅⡎⢿⣿⣿⣿⣿⣷⡿⣼⣏⣧⣋⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢠⣾⠛⠳⢦⡀⠀⠀⠈⠛⠁⠠⠂⠀⣠⣾⣿⢟⣧⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⢀⣸⣿⣿⣿⣿⣿⣿⣭⣷⡹⢎⢷⣊⠶⡹⢎⢻⡹⢞⣳⢛⢾⡹⣞⠽⣎⠳⠆⠂⠀⠘⠣⢞⡽⢻⠿⣿⣿⣿⣿⣾⣿⠿⠛⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢸⡌⠀⠀⠈⢻⡄⠀⠀⠀⠀⠀⢀⣶⣿⡿⢮⣿⠿⠋⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⣾⣿⣿⣿⣿⣾⢿⣻⣿⣿⣿⣝⣎⠧⡓⢭⡘⠤⡑⢊⠔⠩⠆⠱⢌⠛⡌⠓⡌⠀⠀⠀⠀⠀⠈⠣⢟⡶⡹⢜⡩⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⠙⢶⣤⣤⠞⠀⠀⠀⠀⢀⣴⣿⡟⣵⣟⣯⣿⣶⣶⣶⣶⣾⣿⣿⣷⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⣰⣿⢧⡿⣿⣿⣿⣿⣟⣿⣽⣻⢿⡾⣯⡝⢦⡘⢤⠉⠄⠠⢀⠐⠀⠂⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠁⠐⠓⠈⠑⣗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢄⣠⡿⠉⢹⣗⣀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⢟⣧⣟⣻⣾⣿⣻⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⢠⣿⣿⢯⡿⣽⢿⣿⣿⣿⣿⢾⣯⡻⣵⢣⡛⢦⡙⢦⠙⡢⢑⠢⠄⠠⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⣴⠟⠉⢹⡏⠀⠀⠀⠀⠀⢀⣴⡿⣋⣿⣾⢻⡴⣫⣟⣾⣷⣯⣿⣿⣾⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⢀⣿⣿⣿⡿⣾⣽⣻⢿⣿⣿⣿⣿⣳⢿⣽⡖⡩⢆⠈⢂⠱⠀⢃⠐⠈⠁⠈⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⣦⡿⠁⠀⠀⠀⠀⢰⣿⢫⣵⣿⡿⣼⣳⣿⣿⣿⢟⠻⠍⠀⢻⣞⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⢀⣾⣿⣿⣿⣟⣷⣻⣞⡿⣿⣿⣿⣷⣿⣻⣾⣿⡱⣀⠈⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡄⠆⡄⠀⣻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⣰⡟⣧⢿⣽⣷⣿⣿⣿⣿⠿⡍⠄⠂⠀⠀⠢⢝⣾⣻⣿⣿⣿⣿⣿⣿⣿⣿⣻⣽⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⢸⣿⣿⣿⣿⣿⣿⡷⣯⣟⣿⣻⣿⣽⣾⣟⡾⣽⣻⣶⣌⠄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⢀⠁⡄⡠⢀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⣿⣼⣿⣿⣿⣿⣿⡿⣟⢯⡟⣘⢦⠡⡀⠀⠐⡈⢶⢻⡷⣟⣿⣾⣟⣿⣯⣿⢿⣟⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⢸⣿⣿⣿⣿⣿⣿⣽⡿⣽⣳⣟⣿⣯⣷⣿⣻⣗⣯⣿⣻⡴⢐⡀⠀⠀⠀⠀⠀⠀⡀⠠⠀⠀⠀⡠⠀⠀⠀⢠⠦⢏⠠⢑⢠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣼⣟⣳⣿⣿⣿⣿⣿⣟⢯⡽⣹⢮⡽⣽⣎⠇⡔⠀⢂⠱⢌⡳⣽⣻⣞⡷⣿⣯⣷⡿⣿⣻⣿⢿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀]],
				[[⢸⣿⣯⣿⣿⣿⣾⣟⡿⣷⣟⣾⢯⣿⣿⣿⢷⣻⣾⣳⣿⣹⣧⡜⢧⣌⢀⠃⠌⡐⢀⠂⠌⠐⠀⠁⢀⠄⠚⢀⠂⠄⠂⣌⠸⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣽⣿⣿⣿⣿⣿⣳⢏⡾⣱⢯⣷⣿⣿⣏⠖⠀⠈⡀⢊⠲⣹⢖⡿⣞⣿⣟⣾⣯⣿⣟⣯⣿⣿⣿⣿⣿⣀⠀⠀⠀⠀⠀⠀]],
				[[⠸⣿⣿⣷⣿⣷⣿⣯⣿⡷⣯⣿⣻⣽⣿⣿⣿⢯⣟⡷⣯⢷⡻⣞⣧⢞⣦⡉⢂⠐⠠⠈⢄⠂⡔⡈⢤⠈⠄⠁⠀⠀⠡⠀⢃⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⠏⣽⣿⣿⣿⣿⣿⣧⣛⢮⡳⢯⣿⣿⣿⡿⢎⠄⠀⠠⠐⡈⡕⣣⢏⡿⣽⢿⣾⣿⣽⣷⣿⣻⣿⣯⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀]],
				[[⠀⢻⣿⣿⣿⣿⣯⣿⣿⣿⣟⣷⣿⣽⣿⣿⣿⣿⣿⡿⣽⣫⠷⣯⢷⡋⡔⣳⠀⣦⠇⡱⢈⢆⣗⣫⣶⣯⠑⠀⠀⠐⠀⠁⣸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⠟⠁⠀⣿⣿⣿⣿⣿⣿⢶⣫⣞⣽⣿⣿⣿⣿⡻⢌⠀⠀⠀⠡⡒⢥⣋⠾⣽⢯⣿⣯⣿⣿⣾⣿⡿⣿⣽⣷⣿⣻⣿⣿⣆⡀⠀⠀⠀]],
				[[⠀⠀⢻⣿⣷⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣳⣏⢿⡜⣧⢓⠰⣀⣾⢯⠲⣭⢷⡺⣼⣿⣿⣟⣦⠀⠀⠀⠀⠁⠰⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⡟⠁⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⢿⡑⢂⠀⠀⠈⡐⢡⢓⡼⣻⣭⣟⣷⡿⣯⣷⣿⣿⣿⣿⣿⣯⣿⢿⣽⡿⣿⡄⠀⠀⠀]],
				[[⠀⠀⠀⠘⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣳⡽⣎⡜⡳⢌⠂⣼⣿⢎⡱⡎⣖⣻⣿⣿⣿⣿⣿⢸⠀⠀⡆⠀⠂⣷⣘⡳⢶⡤⢤⣄⣀⡀⠀⠀⠀⠀⠀⠀⣠⣾⣿⡿⠁⠀⠀⠀⠀⠀⠈⠛⠿⠿⠿⢿⣿⣿⣿⣿⡟⡿⡜⠣⠘⠀⠀⢈⠀⢌⡱⢎⡵⣳⣻⢾⣽⣿⣿⣿⣿⣿⣿⡿⣷⡿⣯⣿⣯⣿⢿⣿⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣟⡾⣱⢎⠵⣹⠀⢼⡗⢪⠱⢹⠹⠿⣿⣿⣿⣿⣿⢿⡀⠀⢄⡀⢄⣸⠷⠯⣷⣽⣧⣶⣤⣘⣍⡑⣲⡄⢀⣾⣿⡿⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡿⣽⡞⣝⠒⠩⠄⠂⠁⡀⠂⢌⢢⣙⢮⣳⢯⣿⣿⣟⣿⣾⣿⣿⣿⢿⣿⡿⣽⢯⣷⣻⡾⣿⣿⡀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠉⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣿⣝⢮⣒⠹⡀⠋⢌⠐⠡⢂⡙⠒⢡⠘⡽⣿⣻⣿⣵⡠⣸⡇⠀⢼⡀⠀⠀⠀⠀⠉⠉⠛⠟⠓⢻⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡟⡰⠙⡄⢉⠐⡐⡀⢂⠡⣉⠤⣓⢮⣳⢯⣿⣿⣿⣿⣿⣿⣿⣿⢿⡿⣯⣿⢯⣿⢾⣽⣟⣿⣿⣷⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣿⣿⣿⣿⣿⣷⣿⣯⣿⢾⣃⡓⠤⢉⠀⠈⠀⠀⠀⠀⠁⠌⠐⢣⢿⣽⣾⣳⡏⢠⠱⠘⣷⣄⡀⠀⠀⠀⠀⠀⣀⣴⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⢆⠭⢡⠐⡈⡐⢠⠐⣡⠲⣌⠶⣭⢿⣻⣿⣿⣯⣿⣟⣿⣿⣟⣿⡿⣟⣿⡽⣟⣾⣟⣾⣽⣷⣿⣿⡄⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠻⢿⣿⣿⣻⣿⣿⣫⠷⣉⠖⠡⣾⣄⣄⣰⣂⣤⠅⠀⠀⢀⠠⠿⠿⠗⠻⣽⡂⢂⡐⡏⢿⢷⡶⣶⢦⣴⣿⣿⣋⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡈⢎⢂⠡⠄⡑⠂⠉⠤⡓⢼⣙⣾⣻⢿⣽⣾⢿⣻⡿⣯⢿⡽⣯⣟⡿⣞⣽⣻⢾⣽⣾⣿⣿⣿⣿⡇⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣽⣏⠶⡉⣽⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠻⣤⡉⣀⠂⠈⠹⠿⠦⣀⠒⠼⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣻⡐⡀⠢⡐⡀⠂⠉⠄⠃⠜⡱⢺⡜⣯⢻⠷⣯⢿⡝⣿⢽⣫⡝⡧⢏⡷⣫⢾⣽⣻⣾⣿⣿⣿⣿⣿⣧⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⢺⡏⡔⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⢷⣄⣠⠐⢊⠄⣄⡋⢾⣵⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠁⡄⠡⠐⠡⠀⠁⠀⠂⢈⠒⡡⠞⣥⡛⢿⡸⢣⡛⣬⠓⡶⠹⡜⡭⣞⣽⣻⣾⢿⣿⣿⣿⣿⣿⣿⣿⡄]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣯⢧⣻⠔⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⠯⠽⠿⠤⠿⠿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠀⠄⠡⠈⠄⠡⠈⠀⠀⠂⢌⠰⣉⠖⡙⢎⡱⢃⠱⡂⡝⡰⢩⢳⡹⡼⣞⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣎⠗⣚⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣭⣤⣥⣬⣤⣥⣣⢬⡤⣤⣆⣴⣤⢎⣭⢦⣴⣥⣶⣵⣬⣵⣻⣮⣷⣿⣽⣯⡿⣿⣿⣿⣿⣿⣿⣿⣿⡇]],
			},
			{
				"                  /###%%#%&&&%,                           .%((//(/.              ",
				"                  #%%&&&&@@@@@@@*                        #%#&%@&%%##%%            ",
				"                 &&&@@@@@@@@@@@@@   .**(/(,*,/,*,       &@@@@@@@@@&&%%%*          ",
				"                 @@@@@@@@@@&@*                         %@@@@@@@@@@@@&&&&          ",
				"                  @@@@%/,               ,                 /@&%@@@@@@@&&&*         ",
				"                   &@,                 .                      /%@@@@@@@&.         ",
				"                .(..                  ,                         *#@@@@@#          ",
				"              .(                                                 .@@@@*           ",
				"              #                                                    (              ",
				"             ,             *%@%             .@@@@&*                 ,             ",
				"          *            /@@@@@@&            @@@@@@@@&                .*           ",
				"          ,            @@@@@@@@,   ...  .   .@@@@@@@@@                 /          ",
				"          /           @@@@@@/                  *&@@@@@&                           ",
				"         /           ,@&@@@.    %@@@@@@@@@,     .#@@@&&                 ,         ",
				"         #            (%%%/    *@@@@@@@@@%*      *&%#(*                 /         ",
				"         *        .     .           /                   , .,.                     ",
				"          .                /                     *                      *         ",
				"          *                #.    ./%,%/.      ,%                       /..        ",
				"          .,                                                        ,,*  *        ",
				"            %*                                 (%%#%%(,          *&*..    ,       ",
				"           ,/**#@%,**         ........ ...    #&&&@&&&%%%&(,#@@@@@&##%(%%#,,.     ",
				"          .%@@@@@@@@@@@@@@@@@@@@@@@&@@@@@@@@@(@@@@@@&&@@%&%%&&&#@@@@@@@@&&&%(,    ",
				"          (%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.@@@@@@@@@@@@@@@&&%&@%&@@@@@@@@@%#,   ",
				"        *&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@&%&&*&@@@@@@&&#.  ",
				"        &@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@@&@@@&&(@@@@@@&%* ",
				"      .#@@@@@@@@@@@@@@@@@@@@@@@@@@@&@@@%@@@(@@@@@@@@@@@@@@@@@@@@@@@@@&@@@@##@@@@#.",
				"      /@@@@@@@@@@@%%&%@&##%&#%/(@(&#%%###%&%@/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&/",
				"     @@@@@@@@@@%((/((**,.,,,,*,,.,*.*.,*,,,,.. @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/",
			},
			{
				"           -mh.                           h.    `Ndho               ",
				"           hmh+                          oNm.   oNdhh               ",
				"          `Nmhd`                        /NNmd  /NNhhd               ",
				"          -NNhhy                      `hMNmmm`+NNdhhh               ",
				"          .NNmhhs              ```....`..-:/./mNdhhh+               ",
				"           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
				"           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
				"      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
				" .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
				" h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
				" hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
				" /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
				"  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
				"   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
				"     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
				"       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
				"       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
				"       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
				"       //+++//++++++////+++///::--                 .::::-------::   ",
				"       :/++++///////////++++//////.                -:/:----::../-   ",
				"       -/++++//++///+//////////////               .::::---:::-.+`   ",
				"       `////////////////////////////:.            --::-----...-/    ",
				"        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
				"         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
				"           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
				"            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
				"           s-`::--:::------:////----:---.-:::...-.....`./:          ",
				"          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
				"         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
				"        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
				"                        .-:mNdhh:.......--::::-`                    ",
			},
            {
                "                             .-----.                                ",
                "                            /7  .  (                                ",
                "                           /   .-.  \\                              ",
                "                          /   /   \\  \\                            ",
                "                         / `  )   (   )                             ",
                "                        / `   )   ).   \\                           ",
                "                      .'  _.   \\_/  . |                            ",
                "     .--.           .' _.' )`.        |                             ",
                "    (    `---...._.'   `---.'_)    ..  \\                           ",
                "     \\            `----....___    `. \\  |                         ",
                "      `.           _ ----- _   `._  )/  |                           ",
                "        `.       /\"  \\   /\"  \\`.  `._   |                       ",
                "          `.    ((O)` ) ((O)` ) `.   `._\\                          ",
                "            `-- '`---'   `---' )  `.    `-.                         ",
                "               /                  ` \\      `-.                     ",
                "             .'                      `.       `.                    ",
                "            /                     `  ` `.       `-.                 ",
                "     .--.   \\ ===._____.======. `    `   `. .___.--`     .''''.    ",
                "    ' .` `-. `.                )`. `   ` ` \\          .' . '  8)   ",
                "   (8  .  ` `-.`.               ( .  ` `  .`\\      .'  '    ' /    ",
                "    \\  `. `    `-.               ) ` .   ` ` \\  .'   ' .  '  /    ",
                "     \\ ` `.  ` . \\`.    .--.     |  ` ) `   .``/   '  // .  /     ",
                "      `.  ``. .   \\ \\   .-- `.  (  ` /_   ` . / ' .  '/   .'      ",
                "        `. ` \\  `  \\ \\  '-.   `-'  .'  `-.  `   .  .'/  .'       ",
                "          \\ `.`.  ` \\ \\    ) /`._.`       `.  ` .  .'  /         ",
                "           |  `.`. . \\ \\  (.'               `.   .'  .'           ",
                "        __/  .. \\ \\ ` ) \\                     \\.' .. \\__       ",
                " .-._.-'     '\"  ) .-'   `.                   (  '\"     `-._.--.  ",
                "(_________.-====' / .' /\\_)`--..__________..-- `====-. _________)  ",
                "                 (.'(.'                               \",            ",
            },
		}

		local randomDashboard = dashboards[math.random(1, #dashboards)] -- choosing randomly between the dashboard array

		dashboard.section.header.val = randomDashboard

		alpha.setup(dashboard.opts)
	end,
}
