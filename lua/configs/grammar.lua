local M = {}
function M.config()
-- TODO: merge these into keymaps.lua
-- 	vim.cmd([[
--      let g:grammarous#languagetool_cmd = 'languagetool'
-- 	 nmap <leader>ec :GrammarousCheck<cr>
-- 	 nmap <leader>eR :GrammarousReset<cr>
-- 	 nmap <leader>er <Plug>(grammarous-reset)
-- 	 nmap <leader>eo <Plug>(grammarous-open-info-window)
--      nmap <leader>ex <Plug>(grammarous-close-info-window)
-- 	 nmap <leader>ef <Plug>(grammarous-fixit)
--      nmap <leader>en <Plug>(grammarous-move-to-next-error)
--      nmap <leader>ep <Plug>(grammarous-move-to-previous-error)
--      let g:grammarous#disabled_rules = {
--          \ '*' : ['WHITESPACE_RULE', 'EN_QUOTES', 'ARROWS', 'SENTENCE_WHITESPACE',
--          \        'WORD_CONTAINS_UNDERSCORE', 'COMMA_PARENTHESIS_WHITESPACE',
--          \        'EN_UNPAIRED_BRACKETS', 'UPPERCASE_SENTENCE_START',
--          \        'ENGLISH_WORD_REPEAT_BEGINNING_RULE', 'DASH_RULE', 'PLUS_MINUS',
--          \        'PUNCTUATION_PARAGRAPH_END', 'MULTIPLICATION_SIGN', 'PRP_CHECKOUT',
--          \        'CAN_CHECKOUT', 'SOME_OF_THE', 'DOUBLE_PUNCTUATION', 'HELL',
--          \        'CURRENCY', 'POSSESSIVE_APOSTROPHE', 'ENGLISH_WORD_REPEAT_RULE',
--          \        'NON_STANDARD_WORD'],
--          \ }
-- ]]);
end

return M
