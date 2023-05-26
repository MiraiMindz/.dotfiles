# .dotfiles

for the english version click [here](./readme.md)

Se você não sabe .dotfiles são basicamente arquivos de configuração em sistemas baseados em UNIX.

Essa branch é focada na distro Arch Linux, esse repositório contém todos os .dotfiles da minha jornada como usuário de linux

## Temas

Eu customizei muito meu sistema através do tempo e eu salvei todas as variações dele, os temas atualmente são:

- Nord
- Catpuccin
- Catpuccin (com fontes 8-bits)
- Dracula
- Material Ocean

## Instalação via script

Para a instalação via scripts você vai precisar configurar o particionamento de disco e ter uma conexão com a internet no dispositivo de instalação.

Meu particionamento é o seguinte em um disco de 500GB:

| Nome | Tamanho        | Tipo  | Ponto de Montagem | Sistema de Arquivos |
|:----:|:--------------:|:-----:|:-----------------:|:-------------------:|
| sdX  | DISCO-INTEIRO  | disco |                   |                     |
| sdXY | 4GB~12GB       | part  | [SWAP]            | LINUX-SWAP          |
| sdXY | 30GB           | part  | /home             | EXT4                |
| sdXY | 50GB           | part  | /                 | EXT4                |
| sdXY | RESTO-DO-DISCO | part  | /media/Arquivos   | EXT4                |

***OBS: SÓ USO A PARTIÇÃO SWAP SE NECESSÁRIO***

## Pacotes

Esses são os pacotes que eu estou usando para o sistema.

- <https://github.com/gitGNU/gnu_bash> or <https://github.com/zsh-users/zsh>
- <https://github.com/ibhagwan/picom>
- <https://github.com/Airblader/i3>
- <https://github.com/dylanaraps/neofetch>
- <https://github.com/polybar/polybar>
- <https://github.com/davatorium/rofi>
- <https://github.com/adi1090x/rofi>
- <https://github.com/gnome-terminator/terminator>
- <https://github.com/Swordfish90/cool-retro-term>
- <https://github.com/vim/vim>
- <https://github.com/Peltoche/lsd>
- <https://github.com/tadly/hideIt.sh>

### [Esquemas de cores para o VIM](https://github.com/MiraiMindz/vim-colorschemes-collection)

<https://github.com/MiraiMindz/vim-colorschemes-collection>
