#!/usr/bin/env sh

tmux new-session \; \
  split-window -v -p 20 \; \
  split-window -h -p 50 -t 0 \; \
  select-pane -t 1 \; \
  send-keys 'racket -i -l xrepl -l sicp' C-m \; \
  select-pane -t 2 \; \
  send-keys 'git fetch && git status' C-m \; \
  select-pane -t 2 \; \
  send-keys 'make test' C-m \; \
  select-pane -t 0 \; \
  attach

