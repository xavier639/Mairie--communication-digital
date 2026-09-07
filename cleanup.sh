#!/usr/bin/env bash
# Supprime les visuels dont l'événement est passé.
#
# Repose sur la convention de nommage AAAA-MM-JJ-<slug>.<ext> : le préfixe
# est la date de l'événement, pas celle de l'ajout du fichier. Un fichier
# sans préfixe de date est signalé et jamais supprimé automatiquement.
#
# Usage :
#   ./cleanup.sh          # liste ce qui serait supprimé (défaut, sans risque)
#   ./cleanup.sh --apply  # supprime, commit et pousse
set -euo pipefail
cd "$(dirname "$0")"

apply=false
[[ "${1:-}" == "--apply" ]] && apply=true
today=$(date -u +%Y-%m-%d)
expired=() undated=()

while IFS= read -r f; do
  base=$(basename "$f")
  if [[ "$base" =~ ^([0-9]{4}-[0-9]{2}-[0-9]{2})- ]]; then
    [[ "${BASH_REMATCH[1]}" < "$today" ]] && expired+=("$f")
  else
    undated+=("$f")
  fi
done < <(find flyers -type f ! -name '.gitkeep' | sort)

for f in "${undated[@]:-}"; do
  [[ -n "$f" ]] && echo "SANS DATE (à renommer à la main) : $f"
done

if [[ ${#expired[@]} -eq 0 ]]; then
  echo "Rien à supprimer (aucun événement passé au $today)."
  exit 0
fi

printf 'À SUPPRIMER : %s\n' "${expired[@]}"
if ! $apply; then
  echo
  echo "Simulation. Relancer avec --apply pour supprimer, commiter et pousser."
  exit 0
fi

git rm -q "${expired[@]}"
git commit -q -m "Cleanup: retire $(( ${#expired[@]} )) visuel(s) après publication"
git push -q -u origin HEAD
echo "Fait."
