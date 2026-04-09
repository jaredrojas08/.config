vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.g.mapleader = " "

vim.wo.relativenumber = true
vim.opt.signcolumn = "yes"

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<Leader>d", function()
    vim.diagnostic.open_float(nil, { scope = "cursor", source = "always", focusable = true })
end)

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

vim.keymap.set("i", "jk", "<Esc>")

local themes = { "embark", "tokyonight-night", "oxocarbon" }
local theme_file = vim.fn.stdpath("data") .. "/current_theme"
local theme_index = 1

local function save_theme(name)
    local f = io.open(theme_file, "w")
    if f then
        f:write(name)
        f:close()
    end
end

vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        vim.schedule(function()
            local f = io.open(theme_file, "r")
            if f then
                local saved = f:read("*l")
                f:close()
                for i, t in ipairs(themes) do
                    if t == saved then
                        theme_index = i
                        break
                    end
                end
            end
            vim.cmd.colorscheme(themes[theme_index])
        end)
    end,
})

vim.keymap.set("n", "<leader>tt", function()
    theme_index = (theme_index % #themes) + 1
    local theme = themes[theme_index]
    vim.cmd.colorscheme(theme)
    save_theme(theme)
    vim.notify("Theme: " .. theme)
end, { desc = "Toggle theme" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "text" },
    callback = function()
        vim.opt_local.spell = true
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp", { clear = true }),
    callback = function(args)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
                vim.lsp.buf.format({ async = false, id = args.data.client_id })
            end,
        })
    end,
})
