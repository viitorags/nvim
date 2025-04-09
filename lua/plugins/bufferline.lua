return {
    {
        "akinsho/bufferline.nvim", 
        version = "*", 
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            options = {
    	        numbers = "none",  -- Você pode alterar para "ordinal" ou "buffer_id" se quiser exibir números
    	        close_command = "bdelete! %d",  -- Comando para fechar um buffer
    	        right_mouse_command = "bdelete! %d",  -- Comando para fechar ao clicar com o botão direito
    	        left_mouse_command = "buffer %d",  -- Comando ao clicar no buffer
    	        middle_mouse_command = nil,  -- Comando ao clicar no meio (se necessário)
    	        show_buffer_icons = true,  -- Exibe ícones no buffer
    	        show_buffer_close_icons = true,  -- Exibe ícones de fechar no buffer
    	        show_tab_indicators = true,  -- Exibe indicadores de aba
    	        persist_buffer_sort = true,  -- Mantém a ordem dos buffers após reiniciar
    	        separator_style = "slope",  -- Estilo do separador (pode ser "thin", "slant" ou "solid")
    	        diagnostics = "nvim_lsp",
                offsets = {
	                {
		                filetype = "NvimTree",
		                text = "File Explorer",		
                        separator = true,
	                },
	            },
    	        always_show_bufferline = true,  -- Sempre mostrar a bufferline, mesmo se houver apenas um buffer
            },
        },
    }
}
