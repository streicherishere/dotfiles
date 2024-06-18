-- Set your project directory here for fzf searches
local project_dir = "~/work/projects"

return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "FzfLua",
  opts = {
    keymap = {
      fzf = {
        ["ctrl-a"] = "select-all",
        ["ctrl-q"] = "accept",
      },
    },
    files = {
      cmd = 'rg --files --follow --hidden --glob "!{.git,node_modules}/*"',
    },
  },
  keys = {
    { "<leader>0", "<cmd>FzfLua command_history<cr>", desc = "Fzf Command History" },
    { "<C-x>", "<cmd>FzfLua changes<cr>", desc = "Fzf Changes" },
    { "<C-z>", "<cmd>FzfLua jumps<cr>", desc = "Fzf Jumps" },
    { "<C-t>", "<cmd>FzfLua files<cr>", desc = "Fzf Files" },
    { "<C-f>", "<cmd>FzfLua lgrep_curbuf<cr>", desc = "Fzf Grep Current Buffer" },
    { "<leader>fk", function() require("fzf-lua").keymaps({ previewer = true }) end, desc = "Fzf Keymaps" },
    {
      "<C-g>",
      function()
        require("fzf-lua").live_grep({ cmd = "git grep --line-number --column --color=always" })
      end,
      desc = "Fzf Git Grep",
    },
    {
      "<C-y>",
      function()
        require("fzf-lua").live_grep({
          cmd = "rg --hidden --follow --line-number --column --color=always --glob '!**/.git/**' --glob '!**/node_modules/**'",
        })
      end,
      desc = "Fzf Ripgrep (Hidden)",
    },
    {
      "<leader>fg",
      function()
        require("fzf-lua").fzf_exec("fd . " .. project_dir .. " --max-depth=2", {
          actions = {
            ["default"] = function(selected)
              if selected and #selected > 0 then
                local dir = vim.fn.trim(selected[1])
                require("fzf-lua").live_grep({
                  cwd = dir,
                  cmd = "rg --hidden --line-number --column --color=always --glob '!{.git,node_modules}/*'",
                })
              else
                print("Kein Verzeichnis ausgewählt.")
              end
            end,
          },
        })
      end,
      desc = "Live Grep in Project",
    },
    {
      "<leader>fd",
      function()
        require("fzf-lua").fzf_exec("fd . " .. project_dir .. " --max-depth=2 --type d", {
          actions = {
            ["default"] = function(selected)
              if selected and #selected > 0 then
                local dir = vim.fn.trim(selected[1])
                require("fzf-lua").git_files({ cwd = dir })
              else
                print("Kein Verzeichnis ausgewählt.")
              end
            end,
          },
        })
      end,
      desc = "Find Files in Project",
    },
  },
}