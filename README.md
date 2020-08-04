# How to run

* On a VM with `docker` and `docker-compose` Run the docker compose to provision the `Drone CI` Stack :

```bash
export GIT_URI=git@github.com:gravitee-lab/drone-stack.git
export DESIRED_VERSION=HEAD
export DESIRED_VERSION="feature/simple_compose"
export D_COMPOSE_HOME=~/gitea-drone

git clone ${GIT_URI} ${D_COMPOSE_HOME}

cd ${D_COMPOSE_HOME}

git checkout ${DESIRED_VERSION}

cd compose/


# and use /etc/hosts from machines from which you access drone with http://drone.kytes.io:8000
cp ./env/osticketdb.secret-config ./env/osticketdb.secret
cp ./env/osticket.secret-config ./env/osticket.secret
cp ./env/smtp.secret-config ./env/smtp.secret

make

# And finally create the demo user in gitea
docker-compose exec gitea su git -c "gitea admin create-user --admin --name demo --password demo --email demo@gravitee-lab.io"

echo "--"
echo "Tear down : "
echo "--"
echo 'docker-compose down --rmi all && docker system prune -f --all && docker system prune -f --volumes'
echo "--"

```

* the `/etc/hosts` (replace `192.168.1.28` with the IP Address of your VM) :

```bash
192.168.1.28 git.gravitee-lab.io drone.gravitee-lab.io support.gravitee-lab.io
```

* old :

```bash
git clone https://github.com/hamdouni/gitea-drone ~/gitea-drone
cd ~/gitea-drone
# là, il faut editer le docker-compose pour ouvrir le port 8000 pour le drone
# il faut aussi changer la valuer de la var. env. `DRONE_HOST` :
sed -i "s#https://drone.gravitee-lab.io#http://drone.kytes.io:8000#g" docker-compose.yml
# and use /etc/hosts from machines from which you access drone with http://drone.kytes.io:8000
cp env/osticketdb.secret-config env/osticketdb.secret
cp env/osticket.secret-config env/osticket.secret
cp /home/jbl/gitea-drone/env/smtp.secret-config /home/jbl/gitea-drone/env/smtp.secret
make

#
```



# IAAC Cycle

* To enter devops mode :
