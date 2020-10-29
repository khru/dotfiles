#!/bin/bash
wget https://get.symfony.com/cli/installer -O - | bash
sudo mv /home/$USER/.symfony/bin/symfony /usr/local/bin/symfony
symfony check:requirements
