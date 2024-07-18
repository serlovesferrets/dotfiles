vim.filetype.add({
    extension = {
        ["csproj"] = "xml",
        ["fsproj"] = "xml",
    },
    filename = {
        ["yabairc"] = "bash",
        ["sketchybarrc"] = "bash",
        ["bordersrc"] = "bash",
        ["tmux.conf"] = "bash",

        ["tsconfig.json"] = "jsonc",

        ["CMakeLists.txt"] = "cmake",
        ["meson.build"] = "meson"
    },
})
