# CLAUDE.md

## Spec Kit (développement piloté par spécification)

Ce repo est équipé de [Spec Kit](https://github.com/github/spec-kit) (`.specify/` + commandes `/speckit-*` dans `.claude/skills/`).

Avant de démarrer une nouvelle fonctionnalité ou un chantier significatif ici, propose à Xavier d'utiliser le workflow Spec Kit plutôt que de coder directement :

1. `/speckit-constitution` — poser les principes du projet (une fois, si pas déjà fait)
2. `/speckit-specify` — décrire le besoin (le "quoi", pas le "comment")
3. `/speckit-plan` — traduire en plan technique
4. `/speckit-tasks` — découper en tâches actionnables
5. `/speckit-implement` — exécuter les tâches

Skills optionnels utiles en cours de route : `/speckit-clarify` (avant le plan, pour lever les ambiguïtés), `/speckit-checklist` (après le plan), `/speckit-analyze` (après les tâches, avant l'implémentation).

Pour une tâche ponctuelle très simple (petit fix, question, script isolé), ce workflow est disproportionné — utilise le jugement pour ne le proposer que quand la structuration apporte une vraie valeur.
