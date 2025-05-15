return {
    "mistweaverco/kulala.nvim",
    keys = {
        { "<Space>Rs", desc = "Send request" },
        { "<Space>Ra", desc = "Send all requests" },
        { "<Space>Rb", desc = "Open scratchpad" },
    },
    ft = { "http", "rest" },
    opts = {
        global_keymaps = true,
    },
}
