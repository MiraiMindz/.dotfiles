# Install Cool-Retro-Term Themes

## Manually

Usually the location of the themes will be: `/usr/lib/qt/qml/QMLTermWidget/color-schemes/`

to install, remove the file called `cool-retro-term.colorscheme` in that folder:

`sudo rm /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme`

and then link one of the themes to that location, for example, if you want to install the Nord Theme, you do:

`sudo ln -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/Nord.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme`

## Via Script

Just run the `changeTheme.sh` in this folder

## Setting a bash function

or if you want you can create a bash function.

```sh
if [[ -e $(which cool-retro-term) ]]; then
    if [[ $(ps -o 'cmd=' -p $(ps -o 'ppid=' -p $$)) == "cool-retro-term" ]]; then
        changeThemeCoolRetroTerm() {
            if [[ -e /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme ]]; then
                sudo rm /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
                printf "Please select one of these themes:\n"
                printf "0. Default\n"
                printf "1. Dracula\n"
                printf "2. MaterialOcean\n"
                printf "3. Nord\n"
                read -e -p "Enter the number: " CHOICE
                case $CHOICE in
                "0" | 0)
                sudo ln -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/default.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
                ;;
                "1" | 1)
                sudo ln -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/Dracula.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
                ;;
                "2" | 2)
                sudo ln -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/MaterialThemeOcean.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
                ;;
                "3" | 3)
                sudo ln -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/Nord.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
                ;;
                *)
                printf "Invalid input, try again\n"
                ;;
                esac
            fi
            exec cool-retro-term &
            exit
        }
    fi
fi
```

This function basically checks if the cool-retro-term is installed and if it is the current running terminal

if both are true, then it declares the function, this function just do the linking for us

This functions need the sudo permissions because the color theme resides in the `/usr` dir
