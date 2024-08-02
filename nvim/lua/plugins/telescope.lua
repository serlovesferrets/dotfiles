return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            defaults = {
                dynamic_preview_title = true,
            },
        },
        config = function()
            require("telescope").load_extension("git_grep")

            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {
                desc = "Search document symbols",
            })

            vim.keymap.set("n", "<leader>fb", builtin.git_branches, {
                desc = "Browse git branches",
            })

            vim.keymap.set("n", "<leader>fA", builtin.find_files, {
                desc = "look for files in the directory nvim started",
            })

            vim.keymap.set("n", "<leader>fa", builtin.git_files, {
                desc = "look for files in the repo nvim is in",
            })

            vim.keymap.set("n", "<leader>fG", builtin.live_grep, {
                desc = "Grep on files in the directory nvim started",
            })
        end,
    },
    {
        "davvid/telescope-git-grep.nvim",
        config = function()
            local git_grep = require("git_grep")

            vim.keymap.set("n", "<leader>fg", git_grep.live_grep, {
                desc = "Grep on files in the repo nvim is in",
            })
        end,
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
    },
    {
        "cljoly/telescope-repo.nvim",
        config = function()
            local repos = require("telescope").extensions.repo
            vim.keymap.set("n", "<leader>fp", function()
                repos.list({
                    tail_path = true,
                    search_dirs = {
                        "~/dev/",
                        "~/.config/",
                        "/tmp",
                    },
                })
            end, {
                desc = "Find git repositories in your system",
            })
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
    },
}
