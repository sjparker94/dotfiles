vim.filetype.add({
	extension = {
		env = "dotenv",
		mjml = "html",
	},
	filename = {
		[".env"] = "dotenv",
		["tsconfig.json"] = "jsonc",
	},
	pattern = {
		["%.env%.[%w_.-]+"] = "dotenv",
	},
})
