## Install Docker and Docker Compose

- **[Ubuntu](https://docs.docker.com/engine/install/ubuntu/)**
- **[CentOS](https://docs.docker.com/engine/install/centos/)**
- **[RHEL](https://docs.docker.com/engine/install/rhel/)**

### Run
```bash
git clone https://github.com/ybucci/mysql56-docker.git
cd mysql56-docker
docker-compose up -d
```
### Change root password

1. After start mysql, you need to change root password, for that, get the generated password with the command above

```bash
docker logs mysql 2>&1 | grep "GENERATED" | awk '{print $8}'
```

2. Change root password with this command

```bash
docker exec -it mysql mysqladmin --user=root  --password password "$NEW_PASSWORD"
```

### Create New Databases and Users

1. Run script **01-create-db_user.sh**

### Commands

**Start MySQL**

```bash
docker-compose up -d
```

**Stop MySQL**

```bash
docker-compose down
```

**Enter inside MySQL Container**
```bash
docker exec -it mysql bash
```