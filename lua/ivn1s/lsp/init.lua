local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("ivn1s.lsp.lsp_installer")
require("ivn1s.lsp.handlers").setup()
