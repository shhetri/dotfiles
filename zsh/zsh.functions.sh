#!/bin/sh

function git_current_branch() {
  git symbolic-ref -q HEAD | sed -e 's|^refs/heads/||'
}

