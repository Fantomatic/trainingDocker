Compléter un fichier docker-compose.yml qui lancera une application python, un redis, un load-balancer :

créer un dossier avec les fichiers de l’application python :
app.py.
requirements.txt.

créer le Dockerfile à partir d’une image de base python:3.4 ou python:3.4-alpine. Il doit inclure les opérations suivants pour lancer l’application python :

# Dans le dossier placé les fichiers app.py, requirements.txt
mkdir code
cd code
# Installation des dépendances
pip install -r requirements.txt
# Lancement de l'application sur le port 5000
python app.py


compléter le docker-compose : docker-compose.yml.

builder l’image puis lancer l’application. Consulter de l’application
curl http://127.0.0.1:5000

scaler le service web,

Recommencer en incluant le service du load-balancer dans le docker-compose pour résoudre le problème.

builder, lancer et scaler le service. Consulter l’application :
curl -H Host:whoami.docker.localhost http://127.0.0.1
