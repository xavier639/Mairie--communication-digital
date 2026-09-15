# Mairie--communication-digital

Hébergement temporaire et **volontairement public** des visuels (affiches
d'événements) utilisés pour programmer des posts Facebook via Metricool,
pour le compte du skill/agent
[`com-mairie`](https://github.com/xavier639/com-mairie).

Les fichiers dans `flyers/<commune>/` sont des affiches d'événements
municipaux déjà destinées à une publication Facebook publique — leur
contenu n'est pas sensible. Metricool récupère l'image directement via son
URL brute GitHub (`raw.githubusercontent.com`), sans étape d'autorisation :
c'est justement pour ça que ce repo doit rester public (un repo privé
renvoie une page de connexion au lieu du fichier).

**Règle stricte : ce repo ne contient jamais que des visuels destinés à un
post public.** Jamais de document interne, de donnée personnelle, ou de
fichier sans rapport avec un post en cours. Le repo
[`com-mairie`](https://github.com/xavier639/com-mairie) (le code du skill
et de l'agent) reste privé — ne pas confondre les deux.

## Nommage — obligatoire

`flyers/<commune>/AAAA-MM-JJ-<slug>.<ext>`

Le préfixe est la **date de l'événement**, pas celle de l'ajout du fichier.
C'est ce qui rend le nettoyage mécanique : sans lui, personne ne peut
savoir quand un visuel devient obsolète.

Exemple : `flyers/seraincourt/2026-09-04-cinema-plein-air-wall-e.jpg`

## Hygiène

Le nettoyage est scripté, plus manuel :

```bash
./cleanup.sh          # liste ce qui serait supprimé (sans risque)
./cleanup.sh --apply  # supprime, commit et pousse
```

Le script supprime tout visuel dont la date d'événement est passée, et
signale (sans jamais les supprimer) les fichiers qui n'ont pas de préfixe
de date. À lancer quand on passe dans le repo — ou depuis la routine
quotidienne, qui a ce dépôt rattaché.

## Pour un nouvel opérateur (nouvelle commune, transfert à la mairie)

Ne pas réutiliser ce repo tel quel — en créer un à soi (même structure),
et le déclarer comme `MEDIA_REPO` dans son propre
`~/.claude/skills/com-mairie/SKILL.md`. Voir la section "Installation pour
un nouvel opérateur" de ce skill pour la checklist complète.
