# Here are my dotfiles

dotfiles from my arch linux laptop

# Installed package using pacman

the installed packages are stored in ./installed

## requirements 

### git
### gnu stow

## installation 

```
$ git clone git@github.com:Gnarks/dotfiles.git
```

Then use gnu stow to symlink all dotfiles (in dotfiles dir)

```
$ stow .
```

## note for myself

don't forget to 
```
$ stow .
```
after adding files to symlink them
