# Configuraciones de linux

Estoy usando un bare git repo, siguiendo [este tutorial](https://www.atlassian.com/git/tutorials/dotfiles).

Para copiar la configuración a otra computadora:

```fish
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Evitar recursiones

```fish
echo ".cfg" >> .gitignore
```

Despues clonar el repo, elegir el link de ssh.

```fish
git clone --bare <git-repo-url> $HOME/.cfg
```

Aplicar

```fish
config checkout
```

