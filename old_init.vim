"" basic settings
set hidden ""don't get mad when starting new buffer without saving
set nocp ""something so that my commands work in vi I think
set rnu ""show relative numbers
set nu ""show actual numbers
set showcmd
set mouse=nvc
syntax on 

colors deus

"" style status bar
function! StatusMode()
	let currentMode = mode()
	if match(currentMode, "n") == 0
		return "%#TermCursor#Normal"
	elseif match(currentMode, "i") == 0
		return "%#DiffAdd#Insert"
	elseif match(currentMode, "v") == 0 || match(currentMode, "V") == 0
		return "%#DiffText#Visual"
	elseif match(currentMode, "R") == 0
		return "%#DiffAdd#Replace"
	elseif currentMode == "c"
		return "%#DiffText#Command"
	else
		return "%#Visual#Other"
	endif
endfunction

function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0 ? '  '.l:branchname.'  ' : ''
endfunction

set statusline=
set statusline+=%{%StatusMode()%}
set statusline+=%#PmenuSel# ""set the color to that of PmenuSel
set statusline+=\%{%StatuslineGit()%}
set statusline+=%#PmenuSbar# "" change the color 
set statusline+=\ %f
set statusline+=%=
set statusline+=%#WildMenu# ""set the color to that of PmenuSel
set statusline+=\ %y
set statusline+=\ %l:%c%V
set statusline+=\ 

"" white space characters
set listchars=space:•,tab:>-,lead:•,trail:•,multispace:___
set list

lua << EOF
local nvim_lsp = require'lspconfig'

local on_attach = function(client)
	require'completion'.on_attach(client)
end
nvim_lsp.rust_analyzer.setup({
	on_attach=on_attach,
	settings = {
		["rust-analyzer"] = {
			assist = {
				importGranularity = "module",
				importPrefix = "self",
			},
			cargo = {
				loadOutDirsFromCheck = true
			},
			procMacro = {
				enable = true
			},
		}
	}
})
EOF

