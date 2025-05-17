# Upgrade - Application Flutter 
(En cour de dévéloppement)

## Description

L'application **Upgrade** a été développée pour aider les utilisateurs à suivre leur alimentation, leurs exercices et leur évolution physique au quotidien. Elle permet de centraliser toutes les informations liées à la nutrition, aux exercices en salle, et au suivi du poids, tout en offrant des outils pratiques tels que des graphiques pour visualiser les progrès.

Que vous soyez en train de perdre du poids, de maintenir votre forme physique ou simplement de suivre vos habitudes alimentaires, cette application offre une expérience complète et intuitive pour vous aider à atteindre vos objectifs.

---

## 🚀 Avancement du Projet

### 📊 Objectifs et Statut

| **Tâche**                     | **Statut**  | **Commentaires**                                            |
| ----------------------------- | ----------- | ----------------------------------------------------------- |
| **Conception du Design**      | ✅ Terminé  | Design principal, couleurs et styles validés.               |
| **Structure du Code**         | ✅ Terminé  | Structure de projet définie et mise en place.               |
| **Développement du Backend**  | 🔄 En Cours | API de gestion des données utilisateurs.                    |
| **Développement du Frontend** | 🔄 En Cours | Interface de suivi nutrition en cours.                      |
| **Tests Unitaires**           | ⏳ À venir   | Les tests seront ajoutés après la mise en place du backend. |
| **Mise en Production**        | ⏳ À venir   | Lancement prévu après l'intégration du frontend et backend. |
| **Documentation**             | ⏳ À venir   | README et documentation de l'API en cours de rédaction.     |

---

## 📚 Sommaire

* [📱 Description](#description)
* [✨ Fonctionnalités](#fonctionnalités)
* [🛠️ Technologies Utilisées](#technologies-utilisées)
* [📁 Structure du dossier `lib/`](#-structure-du-dossier-lib)
* [📦 Organisation du développement par features](#️-organisation-du-développement-par-features)

  * [✅ V1 – Suivi du poids + Graph](#✅-v1--suivi-du-poids--graph)
  * [✅ V2 – Ajout manuel des repas + calories](#✅-v2--ajout-manuel-des-repas--calories)
  * [🔄 V3 – Analyse photo (via API)](#🔄-v3--analyse-photo-via-api-externe-plus-tard)
  * [🏋️ V4 – Suivi des entraînements](#🏋️-v4--suivi-des-entraînements)
  * [📊 V5 – Statistiques](#📊-v5--statistiques)

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
* **Firebase** : Base de données pour les informations sur les repas, les exercices et le poids.
* **fl\_chart** : Librairie pour afficher des graphiques.
* **image\_picker** : Librairie pour sélectionner des images de repas.

---

## 📁 Structure du dossier `lib/`

Ce projet Flutter est organisé de manière modulaire pour faciliter la lisibilité, la maintenance et l’évolutivité. Voici une vue d'ensemble des principaux dossiers et fichiers du répertoire `lib/` :

```
lib/
├── main.dart              # Point d’entrée principal
├── app.dart               # Définit MaterialApp, GoRouter et thème
│
├── assets/                    # Assets de l'application
│   └── img/
│       └──icons8-google-480.png
├── core/                  # Thème, constantes, utilitaires
│   ├── constants.dart
│   ├── theme.dart
│   ├── colors.dart
│   ├── typography.dart
│   └── router.dart
│
├── data/                  # Données (modèles, services)
│   ├── models/
│   │   ├── aliment_model.dart
│   │   ├── exo_model.dart
│   │   ├── mealLog_model.dart
│   │   ├── routineWork_model.dart
│   │   ├── session_model.dart
│   │   └── user_model.dart
│   └── services/
│       ├── user_services.dart
│       └── local_db.dart
│
├── ui/                    # Interface utilisateur
│   ├── screens/
│   │   ├── home_screen.dart
│   │   ├── login_screen.dart
│   │   ├── nutrition_screen.dart
│   │   ├── register_screen.dart
│   │   └── profile_screen.dart
│   ├── widgets/
│   └── components/
│       ├── primary_button.dart
│       └── primary_input.dart
│
└── providers/             # Gestion de l'état
│   └── user_provider.dart
│
└── app.dart
└── auth_wrapper.dart
└── firebase_options.dart
└── main.dart
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

## 🛠️ **Organisation du développement par features**

---

### ✅ **V1 – Suivi du poids + Graph**

> 🎯 Objectif : Permettre à l’utilisateur d’enregistrer et visualiser son évolution de poids.

**Fonctionnalités :**

* Ajout manuel de pesées quotidiennes
* Visualisation d’un graphique (line chart)
* Poids objectif (optionnel)
* Stockage local (SQLite ou Hive)

---

### ✅ **V2 – Ajout manuel des repas + calories**

> 🎯 Objectif : Créer une interface simple pour enregistrer ses repas et suivre les calories.

**Fonctionnalités :**

* Formulaire d’ajout d’un repas (nom, calories, heure)
* Liste des repas du jour
* Total calorique quotidien
* Suppression/modification possible

---

### 🔄 **V3 – Analyse photo (via API externe, plus tard)**

> 🎯 Objectif : Ajouter une fonctionnalité IA/OCR pour reconnaître des aliments sur photo.

**Fonctionnalités (plus tard) :**

* Upload ou capture d’image d’un repas
* Appel à une API nutritionnelle pour estimation automatique
* Remplissage automatique du formulaire nutrition

---

### 🏋️ **V4 – Suivi des entraînements**

> 🎯 Objectif : Ajouter et visualiser ses séances de sport.

**Fonctionnalités :**

* Ajout d’exercices avec séries, poids, répétitions
* Historique des entraînements
* Regroupement par jour
* Statistiques simples (nb total de reps, poids soulevé)

---

### 📊 **V5 – Statistiques**

> 🎯 Objectif : Synthétiser les données pour une vue d’ensemble.

**Fonctionnalités :**

* Graphique de progression calories/jour
* Graphique de l’évolution du poids
* Moyenne calorique/semaine
* Fréquence d'entraînement

---







#### 3. **Créer tes models (`models/`)**

> 🧱 Classe Dart pour chaque entité (`User`, `Food`, `Exercise`, `MealLog`, `Routine`, etc.)
> Avec méthodes :

```dart
factory Food.fromJson(Map<String, dynamic> json)
Map<String, dynamic> toJson()
```

---

#### 4. **Créer tes providers/services (`services/`, `repositories/`)**

> 🔌 Ils gèrent l’accès aux données :

* Pour Firebase : `user_remote_service.dart`, `auth_service.dart`
* Pour la logique : `meal_tracker_service.dart`

---

#### 5. **Commencer les écrans de base (`screens/`)**

> 🚧 Commence par :

* **Onboarding/Login/Register**
* **Dashboard** (résumé nutrition + entraînement)
* **Add/Edit Repas**
* **Add/Edit Routine**

---

#### 6. **Créer tes widgets réutilisables (`widgets/`)**

> Exemples :

* `FoodCard`, `ExerciseTile`, `DayProgressBar`, `MacroPieChart`, `PrimaryButton`, etc.

---

#### 8. **Tests manuels + responsive design**

> 📱 Teste ton app sur :

* Écran petit, moyen, grand
* Thème clair et sombre
* Vitesse d'exécution / bugs

---

#### 9. **Connexion à Firebase**

> Quand la logique locale est bien testée :

* Auth Firebase
* Firestore pour sync
* `Cloud sync toggle` dans settings
