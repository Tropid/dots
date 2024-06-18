return {
	name = "zig test",
	builder = function()
		return {
			cmd = { "zig" },
			args = { "build", "test" },
			components = { "default" },
		}
	end,
	condition = {
		filetype = { "zig" },
	},
}
