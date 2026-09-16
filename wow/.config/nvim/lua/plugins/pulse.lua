return {
	"linguini1/pulse.nvim",
	---@module 'pulse'
	version = "*", -- Latest stable release
	---@type pulse.SetupOpts
	opts = {
		interval = 1,
		message = "Take a break!",
		level = vim.log.levels.WARN,
		enabled = true,
	},
}
