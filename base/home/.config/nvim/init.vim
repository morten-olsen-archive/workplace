let configs = [
\  "init",
\  "plugins",
\  "general",
\  "keybindings",
\  "coc",
\  "which",
\  "pluginconfig"
\]
for file in configs
  let x = expand("~/.config/nvim/configs/".file.".vim")
  if filereadable(x)
    execute 'source' x
  endif
endfor
