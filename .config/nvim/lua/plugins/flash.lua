return {
	"folke/flash.nvim",
	-- event = "VeryLazy",
	opts = {},
	-- stylua: ignore
	keys = {
		{'f','f', mode = {"n","o", "x"}},
		{'F','F', mode = {"n","o", "x"}},
		{'t','t', mode = {"n","o", "x"}},
		{'T','T', mode = {"n","o", "x"}},
		{ "<leader>s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Search (Flash)" },
		{ "<leader>S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Search node Treesitter (Flash)" },
		{ "<leader>r", mode = "o", function() require("flash").remote() end, desc = "Remote Search (Flash)" },
		{ "<leader>R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search (Flash)" },
		-- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle (Flash) Search" },
	},
}
