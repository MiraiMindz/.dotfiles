
function fzcd() {
  cd "$(while IFS="" read -r line; do echo "${line#*:}/"; done < "${HOME}/.warprc" | while IFS="" read -r line; do echo "${line#*:}"; done <<< "$(fd -d 1 --type d . /media/Arquivos/Programming/Projects)" | fzf --border-label="Projects Folders" --preview-label="Contents" --preview 'cat <(while IFS="" read -r line; do echo "${line#*{}}"; done <<< "$(fd --type f . {} | as-tree | bat --color=always --style=numbers --line-range=:500)")')"
  clear 
}

function pkginstall() {
  clear
  yay -Fyyy 
  yay -Slq | fzf --border-label="Packages" --multi --preview-label="Info" --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk "{print \$2}" | bat --color=always --style=plain --line-range=:500)' | xargs -ro yay -S
}

function pkgremove() {
  clear
  yay -Qq | fzf --border-label="Packages" --multi --preview-label="Info" --preview 'cat <(yay -Qi {1}) <(yay -Fl {1} | awk "{print \$2}" | bat --color=always --style=plain --line-range=:500)' | xargs -ro yay -Rns
}