#!/bin/bash

echo -e "\033[0;32mUpdating local...\033[0m"

git pull

cd public
git pull
cd ..

