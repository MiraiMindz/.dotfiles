#!/usr/bin/env zsh

HELPER_FUNCTIONS=$DOTFILES/system/zsh/custom/sources/project_creator_templates

go_version_cmd=$(go version | awk -F' ' '{print $3}')
go_version="${go_version#*go}"

function _generate_default_main() {
    if [[ ! -f "$1" ]]; then touch "$1"; fi
    printf "package main\n\n" >> "$1"
    printf "func main() {\n\n" >> "$1"
    printf "}\n" >> "$1"
}

cd $PROGRAMMING_PROJECTS
clear
read -p "Enter Project Name: " projectName
projectFolder="${PROGRAMMING_PROJECTS}/${projectName}"
mkdir -p $projectFolder
mkdir -p $projectFolder/{internal/_test,pkg/domain,cmd,doc,bin} # Hexagonal Archtecture: https://youtu.be/oL6JBUk6tj0?t=1808
touch $projectFolder/{cmd/run.sh,ReadMe.md,Install.md,go.mod,go.work}
printf "# %s\n\n" $projectName >> $projectFolder/Readme.md
printf "module %s\n\n" "$projectName" >> $projectFolder/go.mod
printf "go %s\n\n" "${go_version%.*}" >> $projectFolder/go.mod

printf "go %s\n\n" "${go_version%.*}" >> $projectFolder/go.work
printf "use {\n\t.\n}\n" >> $projectFolder/go.work

printf "#!/usr/bin/env bash\n\n" >> $projectFolder/cmd/run.sh
printf "goimports -w ../*/*.go\n" >> $projectFolder/cmd/run.sh
printf "go vet ../...\n" >> $projectFolder/cmd/run.sh
printf "go run \$1\n" >> $projectFolder/cmd/run.sh

touch $projectFolder/.gitignore
curl -L "https://raw.githubusercontent.com/github/gitignore/main/Go.gitignore" >> $projectFolder/.gitignore
cd $projectFolder
if [[ -f Readme.md ]]; then rm -rf Readme.md;fi
_generate_default_main "$projectFolder/main.go" 
sh $HELPER_FUNCTIONS/_init_git.sh
sh $HELPER_FUNCTIONS/_push_to_github.sh $projectName
clear
sh $HELPER_FUNCTIONS/_open_editor.sh $projectFolder

