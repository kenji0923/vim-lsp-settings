function! Vim_lsp_settings_pyright_langserver_capabilities() abort
  let l:capabilities = lsp#default_get_supported_capabilities('pyright-langserver')
  let l:capabilities.textDocument.documentSymbol.hierarchicalDocumentSymbolSupport = v:true
  return l:capabilities
endfunction


augroup vim_lsp_settings_pyright_langserver
  au!
  LspRegisterServer {
      \ 'name': 'pyright-langserver',
      \ 'cmd': {server_info->lsp_settings#get('pyright-langserver', 'cmd', [lsp_settings#exec_path('pyright-langserver')]+lsp_settings#get('pyright-langserver', 'args', ['--stdio']))},
      \ 'root_uri':{server_info->lsp_settings#get('pyright-langserver', 'root_uri', lsp_settings#root_uri('pyright-langserver'))},
      \ 'initialization_options': lsp_settings#get('pyright-langserver', 'initialization_options', v:null),
      \ 'capabilities': lsp_settings#get('pyright-langserver', 'capabilities', Vim_lsp_settings_pyright_langserver_capabilities()),
      \ 'allowlist': lsp_settings#get('pyright-langserver', 'allowlist', ['python']),
      \ 'blocklist': lsp_settings#get('pyright-langserver', 'blocklist', []),
      \ 'config': lsp_settings#get('pyright-langserver', 'config', lsp_settings#server_config('pyright-langserver')),
      \ 'workspace_config': lsp_settings#get('pyright-langserver', 'workspace_config', {
      \   'python': {
      \     'analysis': {
      \       'useLibraryCodeForTypes': v:true
      \     },
      \   },
      \ }),
      \ 'semantic_highlight': lsp_settings#get('pyright-langserver', 'semantic_highlight', {}),
      \ }
augroup END
