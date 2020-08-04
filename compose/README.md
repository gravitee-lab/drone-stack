# gitea-drone (development)

First, configure secrets by copying config files :

```sh
cp env/osticketdb.secret-config env/osticketdb.secret
cp env/osticket.secret-config env/osticket.secret
```

Then edit those two files to adapt them. This must be done before lunching 'make' or it will not work.

```sh
make
```

It stops all containers if they are running, removes the network if it exists and then recreates the network and lunch all containers.

You can access locally to all containers with :

* gitea => http://127.0.0.1/ 
* drone => http://0.0.0.0/ 
* osticket => http://localhost/

# Create gitea user

Add demo user (demo:demo) as admin :

```sh
docker-compose exec gitea su git -c "gitea admin create-user --admin --name demo --password demo --email demo@de.mo"
```
