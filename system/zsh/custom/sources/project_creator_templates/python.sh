#!/usr/bin/env zsh

HELPER_FUNCTIONS=$DOTFILES/system/zsh/custom/sources/project_creator_templates

go_version_cmd=$(go version | awk -F' ' '{print $3}')
go_version="${go_version#*go}"

function _generate_default_main() {
    if [[ ! -f "$1" ]]; then touch "$1"; fi
    printf "#!/usr/bin/env python\n\n" >> "$1"
    printf "def main():\n" >> "$1"
    printf "    print('Hello World')\n\n\n" >> "$1"
    printf "if __name__ == '__main__':\n" >> "$1"
    printf "    main()\n" >> "$1"
}

cd $PROGRAMMING_PROJECTS
clear
read -p "Enter Project Name: " projectName
projectFolder="${PROGRAMMING_PROJECTS}/${projectName}"
mkdir -p $projectFolder
mkdir -p $projectFolder/{docs,tests,src,lib,scripts}
touch $projectFolder/{scripts/run.sh,ReadMe.md,Install.md}
printf "# %s\n\n" $projectName >> $projectFolder/Readme.md

printf "#!/usr/bin/env bash\n\n" >> $projectFolder/scripts/run.sh
printf "python -m black ../src/*\n" >> $projectFolder/scripts/run.sh
printf "python \$1\n" >> $projectFolder/scripts/run.sh

touch $projectFolder/.gitignore
curl -L "https://raw.githubusercontent.com/github/gitignore/main/Python.gitignore" >> .gitignore
cd $projectFolder
if [[ -f Readme.md ]]; then rm -rf Readme.md;fi
_generate_default_main "$projectFolder/src/app.py"
python -m venv ./.venv
source ./.venv/bin/activate
python -m pip install black
sh $HELPER_FUNCTIONS/_init_git.sh
sh $HELPER_FUNCTIONS/_push_to_github.sh $projectName
clear
sh $HELPER_FUNCTIONS/_open_editor.sh $projectFolder

