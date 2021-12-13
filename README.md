# vimrc
My vimrc file that has changed over the years. I don't know how most of it works I copied it from someone else and changed a few things here and there.

Copy the file and put it in ~/.vimrc for vim to use these settings, might need to download some things along the way.

`mkdir -p  ~/.vim/autoload/`

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

`sudo curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim`

`git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

`brew install coreutils`

`git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k`

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

`brew install zsh`

`git clone git@github.com:ryanoasis/nerd-fonts.git`

`git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
