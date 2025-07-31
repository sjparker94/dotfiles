vim.filetype.add({
	extension = {
		env = "dotenv",
	},
	filename = {
		[".dockerignore"] = "gitignore",
		[".env"] = "dotenv",
		[".eslintrc.json"] = "jsonc",
		[".ignore"] = "gitignore",
		[".yamlfmt"] = "yaml",
		[".yamllint"] = "yaml",
		["project.json"] = "jsonc", -- assuming nx project.json
	},
	pattern = {
		["compose.y.?ml"] = "yaml.docker-compose",
		["docker%-compose%.y.?ml"] = "yaml.docker-compose",
		["%.env%.[%w_.-]+"] = "dotenv",
		["tsconfig%."] = "jsonc",
	},
})
