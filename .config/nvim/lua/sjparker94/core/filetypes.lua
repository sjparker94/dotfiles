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
	filename = {
		[".dockerignore"] = "gitignore",
		[".env"] = "dotenv",
		[".eslintrc.json"] = "jsonc",
		[".ignore"] = "gitignore",
		[".yamlfmt"] = "yaml",
		[".yamllint"] = "yaml",
		["project.json"] = "jsonc",
	},
	pattern = {
		["compose.y.?ml"] = "yaml.docker-compose",
		["docker%-compose%.y.?ml"] = "yaml.docker-compose",
		["%.env%.[%w_.-]+"] = "dotenv",
		["tsconfig%."] = "jsonc",
	},
})
