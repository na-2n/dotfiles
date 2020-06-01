#!/bin/sh

git filter-branch -f --tree-filter '
    OLD_NAME=$(cat old_name.txt | base64 -d)
    OLD_NAME_LOWER=$(echo $OLD_NAME | tr "[:upper:]" "[:lower:]")

    NEW_NAME=$(cat new_name.txt)
    NEW_NAME_LOWER=$(echo $NEW_NAME | tr "[:upper:]" "[:lower:]")

    sed -i "s/$OLD_NAME/$NEW_NAME/g" *
    sed -i "s/$OLD_NAME_LOWER/$NEW_NAME_LOWER/g" *
' -- --all

