#!/usr/bin/env bash
set -euo pipefail

move_sql_assets () {
  SRC="$1"
  DEST="$2"
  mkdir -p "$DEST"
  for d in deploy verify revert sql; do
    if [ -e "$SRC/$d" ]; then
      if [ -e "$DEST/$d" ]; then
        :
      else
        git mv "$SRC/$d" "$DEST/" || true
      fi
    fi
  done
  if compgen -G "$SRC/"'*.control' >/dev/null; then
    for f in "$SRC"/*.control; do
      if [ -e "$f" ]; then
        base="$(basename "$f")"
        if [ -e "$DEST/$base" ]; then
          :
        else
          git mv "$f" "$DEST/" || true
        fi
      fi
    done
  fi
  for f in sqitch.conf sqitch.plan launchql.plan; do
    if [ -e "$SRC/$f" ]; then
      if [ -e "$DEST/$f" ]; then
        :
      else
        git mv "$SRC/$f" "$DEST/" || true
      fi
    fi
  done
}

move_sql_assets "source/internal-utils/extensions/@launchql/ext-jobs" "packages/jobs/ext-jobs"

move_sql_assets "source/internal-utils/extensions/@launchql/ext-default-roles" "packages/security/ext-default-roles"
move_sql_assets "source/internal-utils/extensions/@launchql/ext-jwt-claims" "packages/security/ext-jwt-claims"
move_sql_assets "source/utils/packages/verify" "packages/security/ext-verify"
move_sql_assets "source/internal-utils/packages/encrypted-secrets" "packages/security/encrypted-secrets"
move_sql_assets "source/internal-utils/packages/encrypted-secrets-table" "packages/security/encrypted-secrets-table"

move_sql_assets "source/internal-utils/extensions/@launchql/ext-types" "packages/data-types/ext-types"
move_sql_assets "source/internal-utils/extensions/@launchql/ext-uuid" "packages/data-types/ext-uuid"
move_sql_assets "source/utils/packages/types" "packages/data-types/ext-types"
move_sql_assets "source/utils/packages/uuid" "packages/data-types/ext-uuid"
move_sql_assets "source/utils/packages/base32" "packages/data-types/base32"
move_sql_assets "source/internal-utils/extensions/@launchql/ext-stamps" "packages/data-types/stamps"
move_sql_assets "source/utils/packages/stamps" "packages/data-types/stamps"
move_sql_assets "source/internal-utils/extensions/@launchql/inflection" "packages/data-types/inflection"
move_sql_assets "source/utils/packages/inflection" "packages/data-types/inflection"

move_sql_assets "source/utils/packages/defaults" "packages/utils/defaults"
move_sql_assets "source/utils/packages/utils" "packages/utils/utils"
move_sql_assets "source/utils/packages/totp" "packages/utils/totp"

move_sql_assets "source/utils/packages/measurements" "packages/metrics/measurements"
move_sql_assets "source/pg-utils/packages/measurements" "packages/metrics/measurements"
move_sql_assets "source/utils/packages/achievements" "packages/metrics/achievements"

move_sql_assets "source/utils/packages/geotypes" "packages/geo/geotypes"

move_sql_assets "source/internal-utils/packages/db_meta" "packages/meta/db_meta"
move_sql_assets "source/internal-utils/packages/db_meta_modules" "packages/meta/db_meta_modules"
move_sql_assets "source/internal-utils/packages/db_meta_test" "packages/meta/db_meta_test"

while IFS= read -r -d '' plan; do
  dest_dir="$(dirname "$plan")"
  if [ ! -e "$dest_dir/launchql.plan" ]; then
    git mv "$plan" "$dest_dir/launchql.plan"
  else
    git rm -f "$plan"
  fi
done < <(find packages -type f -name "sqitch.plan" -print0)

git status --porcelain
