## Private Club

  Réalisation d'une page heroku, [The Private Club](https://the-private-club.herokuapp.com/), permettant d'accéder à la liste de ses members uniquement en se loggant ou en s'enregistrant.
  Utilisation de la gem Bcrypt.

  L'app a été réalisée avec un certain nombre de tests via les gem Minitest et rails-controller-testing. Permettant de tester notamment, la validité des liens de la Home, la validité de l'inscription, du log in et de l'edit de son profil.

## Tester en local

Même si c'est fun de spam sur le lien heroku ci-dessus. Pour tester en local, le petit git clone devra être suivi :
* bundle install
* rails db:migrate
* rails db:seed
* rails s / rails c
* rails test:models / rails test:controllers

Du fun en perspective.

## Contributions

En Pair-programming avec la team:
* [Thomas Charvet](https://github.com/TomacTh)
* [Nikita Vasilev](https://github.com/nikitavasilev)
* [Arthur Mansuy](https://github.com/tutus06)
* [Nathaniel Debache](https://github.com/Natdenice)
* [et moi-même](https://github.com/Ysalien)

## Contact

Any probleme ? Go to our [GitHub](https://github.com/THP-nice/active_record_gossip_project/issues).
