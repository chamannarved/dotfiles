Remove-Item alias:nv -Forc      # Overwrite the built-in nv alias for New-Variablee

Set-Alias nv nvim
function config { git --git-dir="$HOME\dotfiles\" --work-tree="$HOME" $args }
