if exists('g:plugs["vim-nerdtree-syntax-highlight"]')
let s:brown = "FEBBA2"
let s:aqua =  "AFC9E7"
let s:blue = "B0AEE6"
let s:darkBlue = "44788E"
let s:purple = "DAAEE6"
let s:lightPurple = "834F79"
let s:red = "FEA2A2"
let s:beige = "F5C06F"
let s:yellow = "E4D3AA"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "BEE6AE"
let s:lightGreen = "31B53E"
let s:white = "#E5E7F4"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['css'] = s:purple

let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['vim'] = s:purple

let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['rust'] = s:purple

let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['js'] = s:purple

let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['jsx'] = s:purple

let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['ts'] = s:purple

let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['md'] = s:purple

let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['go'] = s:purple

let g:WebDevIconsDefaultFolderSymbolColor = s:green
let g:WebDevIconsDefaultFileSymbolColor = s:blue
endif
