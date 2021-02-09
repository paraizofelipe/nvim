" Use deoplete.
let g:deoplete#enable_at_startup = 1

call deoplete#custom#var('omni', 'functions', {
	\ 'lua': 'xolox#lua#omnifunc',
\ })
call deoplete#custom#var('omni', 'input_patterns', {
	\ 'lua': '\w+|\w+[.:]\w*',
\ })
