# Airport Chat 🛫💬

Une application de chat en temps réel multi-salon basée sur les aéroports du monde.

## Fonctionnalités

- **Chat en temps réel** : Communication instantanée via WebSocket (ActionCable)
- **Multi-salon** : Chaque aéroport dispose de son propre salon de discussion
- **Autocomplete** : Recherche intelligente d'aéroports par nom, code ou ville
- **Historique** : Affichage des 1000 derniers messages par salon
- **Design moderne** : Interface élégante avec Tailwind CSS

## Prérequis

- Ruby 3.1.2
- PostgreSQL
- Redis (pour ActionCable)

## Installation

1. **Cloner le repository**
   ```bash
   git clone <votre-repo>
   cd airport-chat
   ```

2. **Installer les dépendances**
   ```bash
   bundle install
   ```

3. **Démarrer PostgreSQL**
   ```bash
   # Sur Linux/WSL
   sudo service postgresql start
   
   # Sur macOS
   brew services start postgresql
   ```

4. **Démarrer Redis**
   ```bash
   # Sur Linux/WSL
   sudo service redis-server start
   
   # Sur macOS
   brew services start redis
   ```

5. **Créer et préparer la base de données**
   ```bash
   bin/rails db:create
   bin/rails db:migrate
   bin/rails db:seed
   ```

6. **Démarrer le serveur**
   ```bash
   bin/rails server
   ```

7. **Accéder à l'application**
   Ouvrez votre navigateur sur `http://localhost:3000`

## Utilisation

1. **Page d'accueil** : Recherchez un aéroport avec l'autocomplete ou sélectionnez-en un dans la liste
2. **Salon de chat** : Entrez votre nom et commencez à discuter
3. **Messages en temps réel** : Les nouveaux messages apparaissent instantanément pour tous les utilisateurs du salon

## Architecture

- **Models** : Airport, Room, Message
- **Controllers** : RoomsController, MessagesController, AirportsController
- **Channels** : RoomChannel pour la communication WebSocket
- **Stimulus Controllers** : 
  - `airport_search_controller.js` : Gestion de l'autocomplete
  - `chat_controller.js` : Gestion du chat en temps réel

## Base de données

L'application inclut 50+ aéroports du monde entier (Paris CDG, JFK, Tokyo Haneda, etc.)

## Technologies

- **Backend** : Ruby on Rails 7.0
- **Database** : PostgreSQL
- **WebSocket** : ActionCable + Redis
- **Frontend** : Turbo, Stimulus
- **CSS** : Tailwind CSS
- **JavaScript** : ES6 modules

## Fonctionnalités techniques

- Limite automatique à 1000 messages par salon
- Broadcast en temps réel via ActionCable
- Sauvegarde du nom d'utilisateur dans localStorage
- Protection CSRF
- Validation des données côté serveur

## Développement

Pour contribuer au projet :

1. Créez une branche feature
2. Committez vos changements
3. Poussez vers la branche
4. Créez une Pull Request

## License

MIT
