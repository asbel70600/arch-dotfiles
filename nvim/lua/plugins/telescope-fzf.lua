return {
    'nvim-telescope/telescope-fzf-native.nvim',
    name = "telescope-fzf",
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
}

