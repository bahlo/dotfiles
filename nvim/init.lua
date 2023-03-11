local conf_files = {
  "options.vim",
  "opts.lua",
  "plugins.lua",
}

for _, name in ipairs(conf_files) do
  local path = string.format("%s/%s", vim.fn.stdpath("config"), name)
  local source_cmd = "source " .. path
  vim.cmd(source_cmd)
end

