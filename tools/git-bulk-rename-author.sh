#!/bin/sh

git filter-branch -f --env-filter '
    OLD_EMAIL=$(cat old_email.txt | base64 -d)
    OLD_EMAIL_2=$(cat old_email_2.txt | base64 -d)

    NEW_NAME="$(git config user.name)"
    NEW_EMAIL="$(git config user.email)"

    if test "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" || test "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL_2"
    then
        GIT_AUTHOR_NAME="$NEW_NAME"
        GIT_AUTHOR_EMAIL="$NEW_EMAIL"

        GIT_COMMITTER_NAME="$NEW_NAME"
        GIT_COMMITTER_EMAIL="$NEW_EMAIL"
    fi
' -- --all

