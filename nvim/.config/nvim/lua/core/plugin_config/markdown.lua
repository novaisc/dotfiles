-- Disable header folding
vim.g.vim_markdown_folding_disabled = 1

-- Do not use conceal feature, the implementation is not so good
vim.g.vim_markdown_conceal = 0

-- Disable math tex conceal feature
vim.g.tex_conceal = ""
vim.g.vim_markdown_math = 1

-- Support front matter of various formats
vim.g.vim_markdown_frontmatter = 1  -- for YAML format
vim.g.vim_markdown_toml_frontmatter = 1  -- for TOML format
vim.g.vim_markdown_json_frontmatter = 1  -- for JSON format
