local createKeymap = vim.keymap.set

local function CONFIG()
    local M = {}


    local harpoon = require("harpoon")
    harpoon.setup(M)
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
        end

        require("telescope.pickers")
            .new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            })
            :find()
    end

    createKeymap("n", "<C-\\>", function()
        toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })

    createKeymap("n", "<leader>a", function() harpoon:list():append() end)
end

return CONFIG
