#!/bin/bash

# === Настройки пользователя ===
GIT_NAME="Dridjohnrose"
GIT_EMAIL="ChristopherMcCarthy562@outlook.com"
REPO_DIR="taskboard"

# === Уникальные даты коммитов (13 штук до 30 июня 2025) ===
commit_dates=(
  "2025-06-10T12:00:00"
  "2025-06-13T12:00:00"
  "2025-06-14T12:00:00"
  "2025-06-15T12:00:00"
  "2025-06-17T12:00:00"
  "2025-06-18T12:00:00"
  "2025-06-21T12:00:00"
  "2025-06-25T12:00:00"
  "2025-06-26T12:00:00"
  "2025-06-27T12:00:00"
  "2025-06-28T12:00:00"
  "2025-06-29T12:00:00"
  "2025-06-30T12:00:00"
)

# === Создание директории и файлов ===
mkdir "$REPO_DIR"
cd "$REPO_DIR" || exit
git init

echo "# Taskboard" > README.md
git add README.md
GIT_COMMITTER_DATE="${commit_dates[0]}" git commit --date="${commit_dates[0]}" -m "Initial commit: add README"

# Основные файлы
echo 'print("Main logic")' > main.py
echo 'def util(): return "Utility function"' > utils.py
echo '- Task 1
- Task 2' > todo.txt
git add main.py utils.py todo.txt
GIT_COMMITTER_DATE="${commit_dates[1]}" git commit --date="${commit_dates[1]}" -m "Add main, utils, and todo list"

# Остальные 11 фиктивных коммитов
for i in {2..12}; do
  echo "Log entry $i" >> history.log
  git add history.log
  GIT_COMMITTER_DATE="${commit_dates[$i]}" git commit --date="${commit_dates[$i]}" -m "Auto commit from ${commit_dates[$i]:0:10}"
done

# === Установка имени и почты ===
git config user.name "$GIT_NAME"
git config user.email "$GIT_EMAIL"

echo -e "✅ Репозиторий готов. Выполни:\n  cd $REPO_DIR\n  git remote add origin https://github.com/Dridjohnrose/taskboard.git\n  git branch -M main\n  git push -u origin main"
