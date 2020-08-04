# How to run

* Run the `terraform` to provision the AWS EC2 instance :
  * first, you need your AWS credentials `~/.aws/credentials` :

```ini
[default]
aws_access_key_id=AKIAIOSFODNN7EXAMPLE
aws_secret_access_key=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

  * and your AWS config `~/.aws/config` :

```ini
[default]
region=eu-west-1
output=json
```

  * now you can run the terraform :

```bash
export GIT_URI=git@github.com:gravitee-lab/drone-stack.git
export DESIRED_VERSION=HEAD
export DESIRED_VERSION="feature/simple_compose"
export D_COMPOSE_HOME=~/gitea-drone

git clone ${GIT_URI} ${D_COMPOSE_HOME}

cd ${D_COMPOSE_HOME}

git checkout ${DESIRED_VERSION}

cd terraform/

echo "implementation not finished"

```

* Configure all required subdomains (`drone.pegasusio.io`, `git.pegasusio.io`) :

![godaddy conf](./documentation/images/screenshots/GRAVITEE_DRONE_STACK_GO_DADDY_DNS_2020-08-04 12-05-32.png)

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
docker-compose exec gitea su git -c "gitea admin create-user --admin --name demo --password demo --email demo@pegasusio.io"

docker-compose -f docker-compose.yml logs -f reverse_proxy

echo "--"
echo "Tear down : "
echo "--"
echo 'docker-compose down --rmi all && docker system prune -f --all && docker system prune -f --volumes'
echo "--"
```

* the `/etc/hosts` (replace `192.168.1.28` with the IP Address of your VM) :

```bash
192.168.1.28 git.pegasusio.io drone.pegasusio.io support.pegasusio.io
```

* old :

```bash
git clone https://github.com/hamdouni/gitea-drone ~/gitea-drone
cd ~/gitea-drone
# là, il faut editer le docker-compose pour ouvrir le port 8000 pour le drone
# il faut aussi changer la valuer de la var. env. `DRONE_HOST` :
sed -i "s#https://drone.pegasusio.io#http://drone.kytes.io:8000#g" docker-compose.yml
# and use /etc/hosts from machines from which you access drone with http://drone.kytes.io:8000
cp env/osticketdb.secret-config env/osticketdb.secret
cp env/osticket.secret-config env/osticket.secret
cp /home/jbl/gitea-drone/env/smtp.secret-config /home/jbl/gitea-drone/env/smtp.secret
make

#
```



# IAAC Cycle

* To enter devops mode :
