# ZSH_Theme
My ZSH Theme

![image](https://github.com/lebojo/ZSH_Theme/assets/48327357/bc5447c6-cdc1-4e8b-8020-1b3a7bf36d92)

(Emoji, pwd, gitbranch)

### To set it:

clone it

go into the folder
```
cd ZSH_Theme
```

copy it inside the zsh theme folder:
```  
cp lebojo.zsh-theme ~/.oh-my-zsh/themes
```

Change the theme here:
```
vim ~/.zshrc
```
```
ZSH_THEME="lebojo"
```

##ZSHRC
I also added my .zshrc file who's in your user folder(~)
This line is the most useful to add in your own ZSHRC (or copy mine)
```
#gcp -> git commit push, usage: _>gcp "commit message"
alias gcp='f() { git add . && git commit -m "$@" && git push; unset -f f; }; f'
```
