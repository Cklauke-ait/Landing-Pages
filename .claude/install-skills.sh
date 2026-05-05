#!/bin/bash
SKILLS_REPO="https://github.com/Cklauke-ait/claude-skills.git"
TMP_DIR=$(mktemp -d)
trap "rm -rf $TMP_DIR" EXIT
git clone --depth 1 --quiet "$SKILLS_REPO" "$TMP_DIR" 2>/dev/null || { echo "[skills] Skipping update"; exit 0; }
mkdir -p ~/.claude/skills
for skill_dir in "$TMP_DIR"/*/; do
  skill_name=$(basename "$skill_dir")
  [[ ! -f "$skill_dir/SKILL.md" ]] && continue
  rsync -a --delete "$skill_dir" ~/.claude/skills/"$skill_name"/
  echo "[skills] Installed: $skill_name"
done
