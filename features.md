# 🎯 Fonctionnalités de l'application **Upgrade**

Ce document présente les principales fonctionnalités prévues pour **Upgrade**, une application mobile dédiée au suivi de la santé, de la nutrition et de l'entraînement.

---

## 📑 Table des matières

1. [Authentification Utilisateur](#1-authentification-utilisateur)
2. [Suivi des Repas](#2-suivi-des-repas)
3. [Suivi du Poids](#3-suivi-du-poids)
4. [Suivi des Exercices](#4-suivi-des-exercices)
5. [Graphiques et Statistiques](#5-graphiques-et-statistiques)

---

## 1. Authentification Utilisateur

### 🎯 Objectif

Permettre aux utilisateurs de créer un compte, de se connecter et de gérer leurs informations personnelles.

### 🔧 Fonctionnalités

* Création de compte avec nom, email et mot de passe
* Connexion via email + mot de passe
* Réinitialisation de mot de passe par email
* Mise à jour des informations personnelles (poids cible, objectifs, etc.)

### 🧩 Comportement

* À la première utilisation, l’utilisateur est invité à s’inscrire ou se connecter
* Déconnexion et reconnexion à tout moment

### 🛠️ Technologies

* **Firebase Auth** (ou alternative d'authentification sécurisée)

---

## 2. Suivi des Repas

### 🎯 Objectif

Permettre à l'utilisateur d'enregistrer ses repas et de suivre sa consommation calorique.

### 🔧 Fonctionnalités

* Ajout d’un repas avec :

  * Nom
  * Calories
  * Photo (optionnelle)
  * Date et heure
* Modification et suppression de repas
* Affichage des repas par journée avec total calorique
* Affichage hebdomadaire du résumé des repas
* **Sections par jour** : Petit-déjeuner, Déjeuner, Dîner, Collations
* Détail des **macros et calories par section**
* Recherche d’aliments via barre de recherche
* Base de données intégrée d'aliments avec calories et macros
* Ajout par **photo ou scan de QR Code** pour reconnaître un aliment

### 🧩 Comportement

* Les repas sont enregistrés localement et peuvent être modifiés
* Le total journalier est calculé automatiquement

### 🛠️ Technologies

* Base de données **SQLite** (`sqflite`)
* Ajout d’images : `image_picker`
* Lecture code QR (à définir : `qr_code_scanner`, etc.)

---

## 3. Suivi du Poids

### 🎯 Objectif

Permettre à l'utilisateur de suivre son évolution de poids.

### 🔧 Fonctionnalités

* Ajout de poids (date automatiquement définie sur le jour courant)
* Modification et suppression d’entrées
* Historique affiché sous forme de liste
* Graphique de l’évolution sur une période (30 jours, etc.)

### 🧩 Comportement

* Les données sont d'abord stockées localement
* Objectif futur : synchronisation en ligne pour l’accès multiplateforme

### 🛠️ Technologies

* **SQLite**
* Graphiques : `fl_chart`

---

## 4. Suivi des Exercices

### 🎯 Objectif

Enregistrer les entraînements et suivre les performances.

### 🔧 Fonctionnalités

* Ajout d’un exercice :

  * Nom
  * Séries, répétitions
  * Poids (si applicable)
  * Durée
* Modification/suppression d’exercices
* Affichage journalier des exercices
* Statistiques : total de séries, répétitions, poids soulevé
* Mise en avant des "meilleures perfs"
* **Routines prédéfinies** à sélectionner pour gagner du temps
* Base d'exercices avec **description + image/vidéo** d’illustration

### 🧩 Comportement

* Les exercices sont classés par jour et par type

### 🛠️ Technologies

* Base de données **SQLite**

---

## 5. Graphiques et Statistiques

### 🎯 Objectif

Fournir une visualisation claire et motivante des progrès.

### 🔧 Fonctionnalités

* Graphique des calories consommées par jour
* Graphique de l’évolution du poids
* Suivi des performances sportives (volume total, répétitions, etc.)
* Statistiques hebdomadaires globales

### 🧩 Comportement

* Graphiques dynamiques mis à jour automatiquement selon les données

### 🛠️ Technologies

* `fl_chart`
* Données extraites de **SQLite**