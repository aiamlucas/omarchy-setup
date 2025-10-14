-- ────────────────────────────────────────────────────────────
-- Neovim Theme: Solarized Osaka (for Omarchy Minimal Set)
-- ────────────────────────────────────────────────────────────
return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("solarized-osaka").setup({
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					sidebars = "dark",
					floats = "dark",
				},
				day_brightness = 0.3,
				dim_inactive = false,
				lualine_bold = false,
				on_colors = function(colors)
					colors.green = "#84FF00" -- chartreuse accent for Minimal Set
				end,
			})
			vim.cmd([[colorscheme solarized-osaka]])

			-- Optional: register your Hex→HSL command here too
			vim.api.nvim_create_user_command("HexToHSL", function()
				local ok, hsl = pcall(require, "hsl")
				if ok and hsl then
					hsl.replaceHexWithHSL()
				else
					vim.notify("HSL utils not found", vim.log.levels.WARN)
				end
			end, {})
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = { colorscheme = "solarized-osaka" },
	},
}
