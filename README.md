
# ChatApp Flutter & Firebase

Ce projet est une application de chat en temps réel développée avec Flutter et Firebase. L'application permet aux utilisateurs de s'inscrire, de se connecter, de voir la liste des utilisateurs connectés, de chatter individuellement avec d'autres utilisateurs et de se déconnecter.

## Fonctionnalités

- Authentification des utilisateurs avec Firebase Authentication.
- Stockage des données des utilisateurs et des messages avec Firebase Firestore.
- Affichage de la liste des utilisateurs connectés.
- Chat en temps réel avec d'autres utilisateurs.
- Déconnexion sécurisée.

## Configuration

Avant de commencer, assurez-vous d'avoir configuré Firebase pour votre projet. Suivez ces étapes :

1. Créez un projet sur la console Firebase : [console.firebase.google.com](https://console.firebase.google.com/).
2. Activez Firebase Authentication et Firebase Firestore pour votre projet.
3. Ajoutez votre application Flutter à votre projet Firebase en suivant les instructions pour Android ou iOS.
4. Téléchargez le fichier `google-services.json` (pour Android) ou `GoogleService-Info.plist` (pour iOS) et placez-le dans le répertoire `android/app` ou `ios/Runner` de votre projet Flutter.
5. Modifiez les règles Firestore pour autoriser l'accès aux données des utilisateurs et des messages.

## Installation

#!/bin/bash

# Cloner le référentiel
```git clone https://github.com/Justclemax/ChatApp.git```

# Accéder au répertoire du projet
```
cd chatApp
```

# Installer les dépendances
```flutter pub get```

# Exécuter l'application
flutter run

