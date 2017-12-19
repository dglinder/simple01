#!/bin/sh

for X in yellow red green ; do
    git checkout ${X}
    egrep "color: " site.yml
    cat templates/var/www/html/index.html.j2
    ansible-playbook -i inventory/home -u root ./site.yml
    echo "Updated to version \"${X}\" - now check the site."
    read -s foo
done

# Get back to the master/head of commit repo.
git checkout master

