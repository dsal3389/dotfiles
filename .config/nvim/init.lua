local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("lazy").setup({
    {
        "stevearc/dressing.nvim",
        config = function() 
            local dressing = require("dressing")
            dressing.setup({
                builtin = {
                    show_numbers = true,
                    border = "rounded"
                }
            })
        end
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                snippet = {
                    expand = function()
                        require("luasnip").lsp_expand(args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),  -- exit completion snip
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" }
                }, {
                    { name = "buffer" }
                })
            })
        end
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim"
        },
        config = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            local lspconfig = require("lspconfig")
            local luasnip = require("luasnip")
            
            mason.setup()
            mason_lspconfig.setup({
                automatic_installation = true,
            })

            require('luasnip.loaders.from_vscode').lazy_load()
            luasnip.config.setup {}

            mason_lspconfig.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({})
                end,
            })
        end
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        },
        keys = {
            { "<leader>ee", "<cmd>Neotree toggle<cr>" },
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = false,
                enable_git_status = true,
                enable_diagnostics = true,
                default_component_configs = {
                    indent = {
                        indent_size = 4,
                    },
                    modified = {
                        synmbol = "~",
                    },
                },
                commands = {},
                filesystem = {
                    filtered_items = {
                        visible = true,
                        hide_gitignored = false,
                        hide_dotfiles = false
                    }
                }
            })

        end
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>" }
        }
    },
    {
        "ellisonleao/gruvbox.nvim",  -- theme 
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                contrast = "soft",
                palette_overrides = {
                    dark0_soft = "#181512"
                },
                overrides = {
                    SignColumn = { bg = "#181512" }
                }
            })
            vim.cmd([[colorscheme gruvbox]])
        end
    }
}, {})


vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.wo.number = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.undofile = true
vim.o.hlsearch = false


