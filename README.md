# Upgrade - Application Flutter 
(En cour de dévéloppement)

## Description

L'application **Upgrade** a été développée pour aider les utilisateurs à suivre leur alimentation, leurs exercices et leur évolution physique au quotidien. Elle permet de centraliser toutes les informations liées à la nutrition, aux exercices en salle, et au suivi du poids, tout en offrant des outils pratiques tels que des graphiques pour visualiser les progrès.

Que vous soyez en train de perdre du poids, de maintenir votre forme physique ou simplement de suivre vos habitudes alimentaires, cette application offre une expérience complète et intuitive pour vous aider à atteindre vos objectifs.

---

## Fonctionnalités

Pour plus de détails sur les fonctionnalités de l'application, vous pouvez consulter le fichier [features.md](./features.md).

Voici un aperçu rapide des fonctionnalités principales :

1. **Authentification Utilisateur** : Créez un compte, connectez-vous, et suivez vos progrès de manière personnalisée.
2. **Suivi des Repas** : Enregistrez vos repas, suivez votre consommation calorique, et analysez vos habitudes alimentaires.
3. **Suivi du Poids** : Suivez l'évolution de votre poids au fil du temps, avec des graphiques pour mieux visualiser vos progrès.
4. **Suivi des Exercices** : Enregistrez vos exercices de salle de sport, suivez les séries et répétitions, et analysez vos performances.
5. **Graphiques et Statistiques** : Visualisez vos progrès à travers des graphiques clairs et intuitifs.

---

## Technologies Utilisées

* **Flutter** : Framework pour le développement multiplateforme (iOS, Android).
* **Firebase Auth** : Gestion de l'authentification utilisateur.
* **SQLite** : Base de données locale pour stocker les informations sur les repas, les exercices et le poids.
* **fl\_chart** : Librairie pour afficher des graphiques.
* **image\_picker** : Librairie pour sélectionner des images de repas.

---

## 📁 Structure du dossier `lib/`

Ce projet Flutter est organisé de manière modulaire pour faciliter la lisibilité, la maintenance et l’évolutivité. Voici une vue d'ensemble des principaux dossiers et fichiers du répertoire `lib/` :

```
lib/
│
├── main.dart
├── app.dart
│
├── core/
├── data/
├── ui/
└── providers/
```

### 🔹 `main.dart`

Point d'entrée principal de l'application. Ce fichier initialise l'app et appelle `App()` (défini dans `app.dart`).

### 🔹 `app.dart`

Contient le `MaterialApp`, la définition des routes, du thème global, et du système de navigation.

---

### 📂 `core/` – Outils et constantes globales

* `constants.dart` : Définition des constantes utilisées globalement (ex : couleurs, tailles, textes).
* `theme.dart` : Définition du thème principal de l'application (couleurs, typographies...).
* `utils.dart` : Fonctions utilitaires diverses réutilisables dans toute l’app.

---

### 📂 `data/` – Données et services

#### `models/` :

Contient les modèles de données utilisés dans l'application.

* `meal.dart` : Représente un repas (nom, calories, image, etc.).
* `user.dart` : Représente l'utilisateur (poids cible, email, etc.).

#### `services/` :

Gestion des sources de données : API, base de données locale, etc.

* `nutrition_api.dart` : Service pour récupérer les données nutritionnelles d’aliments.
* `local_db.dart` : Gestion de la base de données locale via SQLite.

---

### 📂 `ui/` – Interface utilisateur

#### `screens/` :

Écrans principaux de l'app.

* `home_screen.dart` : Écran d’accueil.
* `nutrition_screen.dart` : Suivi des repas.
* `settings_screen.dart` : Paramètres utilisateur.

#### `widgets/` :

Widgets personnalisés, utilisés dans plusieurs écrans.

* `meal_card.dart` : Carte affichant les détails d’un repas.
* `progress_bar.dart` : Barre de progression (ex : calories consommées).

#### `components/` :

Petits widgets UI réutilisables partout.

* `custom_button.dart` : Bouton stylisé commun.
* `input_field.dart` : Champ de saisie personnalisable.

---

### 📂 `providers/` – Gestion de l’état (avec Provider)

* `meal_provider.dart` : Logique et état liés aux repas (ajout, suppression, etc.).
* `user_provider.dart` : Logique et état liés aux données utilisateur.

---