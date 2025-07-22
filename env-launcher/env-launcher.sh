#!/bin/bash

# A script to create or attach to a tmux session for a specific project,
# with options to activate a Python virtual environment using poetry or uv.

PROJECT_NAME=$1
TOOL=$2

if [ -z "$PROJECT_NAME" ]; then
  echo "Usage: $0 <project_name> [tool]"
  echo "  <project_name>: The name of the project, which will also be the tmux session name."
  echo "  [tool]: Optional. 'poetry' or 'uv' to activate the respective virtual environment."
  exit 1
fi

echo $GITHUB_DIR

PROJECT_PATH="${GITHUB_DIR}/${PROJECT_NAME}"

if [ ! -d "$PROJECT_PATH" ]; then
  echo "Error: Project directory '$PROJECT_PATH' not found."
  exit 1
fi

ACTIVATION_CMD=""
if [ "$TOOL" = "poetry" ]; then
  ACTIVATION_CMD="source $(cd "$PROJECT_PATH" && poetry env info --path)/bin/activate"
elif [ "$TOOL" = "uv" ]; then
  ACTIVATION_CMD="source .venv/bin/activate"
elif [ -n "$TOOL" ]; then
  echo "Warning: Unknown tool '$TOOL' specified. Virtual environment will not be activated."
fi

if ! tmux has-session -t "$PROJECT_NAME" 2>/dev/null; then
  echo "Creating new tmux session: $PROJECT_NAME"

  tmux new-session -d -s "$PROJECT_NAME" -c "$PROJECT_PATH"

  tmux send-keys -t "$PROJECT_NAME:1" "$ACTIVATION_CMD" C-m
  tmux send-keys -t "$PROJECT_NAME:1" "nvim" C-m
  tmux send-keys -t "$PROJECT_NAME:1" " ntr"

  tmux new-window -t "$PROJECT_NAME" -c "$PROJECT_PATH"
  tmux send-keys -t "$PROJECT_NAME:2" "$ACTIVATION_CMD" C-m

  tmux attach-session -t "$PROJECT_NAME"
else
  echo "Tmux session '$PROJECT_NAME' already exists. Attaching to it."
  tmux attach-session -t "$PROJECT_NAME"
fi


