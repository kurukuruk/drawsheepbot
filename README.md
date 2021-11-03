Un bot pour slack/drawsheep.

Nécessite: Ruby -v > 2.6.8.

Créer et configurer un fichier .env avec la variable SLACK_API_TOKEN=...

Utiliser la commande "bundle i" pour télécharger les gems et générer le gemfile.lock.

Lancer avec la commande "rackup config.ru".

## Commit Conventions

This project uses [CommitLint](https://github.com/conventional-changelog/commitlint) and [Husky](https://github.com/typicode/husky) to force the devs to write comprehensive and clean commit message by following a commit convention.   
We are currently using the [@commitlint/config-conventional ](https://github.com/conventional-changelog/commitlint/tree/master/%40commitlint/config-conventional) preset   
The commit message should be structured as follows:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

You can learn more about the commit convention at [Conventional Commits](https://conventionalcommits.org/) website.

