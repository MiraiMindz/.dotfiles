#!/usr/bin/env zsh

HELPER_FUNCTIONS=$DOTFILES/system/zsh/custom/sources/project_creator_templates

function _generate_default_main() {
    if [[ ! -f "$1" ]]; then touch "$1"; fi
    printf "#include <stdio.h>\n" >> "$1"
    printf "#include <stdlib.h>\n\n" >> "$1"
    printf "int main() {\n\n" >> "$1"
    printf "    return 0;\n" >> "$1"
    printf "}\n" >> "$1"
}

cd $PROGRAMMING_PROJECTS
clear
read -p "Enter Project Name: " projectName
projectFolder="${PROGRAMMING_PROJECTS}/${projectName}"
mkdir -p $projectFolder
mkdir -p $projectFolder/{src,include,doc,bin,build,test}
touch $projectFolder/{bootstrap.sh,ReadMe.md,Install.md,MakeFile,run.sh}
printf "# %s\n\n" $projectName >> $projectFolder/Readme.md

printf "#!/usr/bin/env bash\n\n" >> $projectFolder/run.sh
printf "gcc -o ./bin/main ./src/main.c\n" >> $projectFolder/run.sh
printf "./bin/main\n" >> $projectFolder/run.sh

touch $projectFolder/.gitignore
curl -L "https://raw.githubusercontent.com/github/gitignore/main/C.gitignore" >> .gitignore
cd $projectFolder
if [[ -f Readme.md ]]; then rm -rf Readme.md;fi
_generate_default_main "$projectFolder/src/main.c" 
sh $HELPER_FUNCTIONS/_init_git.sh
sh $HELPER_FUNCTIONS/_push_to_github.sh $projectName
clear
sh $HELPER_FUNCTIONS/_open_editor.sh $projectFolder

