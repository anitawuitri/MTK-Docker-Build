# MTK Genios i1200/i700 EVK Docker Build
This project is to build MTK Genios i1200/i700 in docker container.
## _MTK Genios i1200/i700 EVK_
_TODO_: CI/CD icons

## Features

- **build.sh** :  shell script to build MTK Genios i1200/i700 EVK yocto
- **docker_run.sh** : shell script to run container (TODO: replace with compose yaml file)
- **Dockerfile** :  to build docker image for MTK Genios i1200/i700 EVK build environment
- **env.sh** : MTK Genios i1200/i700 yocto environment parameters which called by build.sh
- **repo.sh** : repo script to download MTK Genios i1200/i700 EVK yocto source codes


## Environments (Recommendations)
- **[Ubuntu Build Server]** create new sudo user for build personal environment
- **[tmux]** for background screen while long time build
### Prerequsites Installation
#### Google Andriod repo tool
```bash
mkdir -p ~/.bin
PATH="${HOME}/.bin:${PATH}"
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo
chmod a+rx ~/.bin/repo
```
```bash
~ » repo --version                                                                                                                                                                               anitawu@r300
<repo not installed>
repo launcher version 2.35
       (from /usr/sbin/repo)
git 2.43.0
Python 3.8.10 (default, Nov 22 2023, 10:22:35)
[GCC 9.4.0]
OS Linux 5.15.0-88-generic (#98~20.04.1-Ubuntu SMP Mon Oct 9 16:43:45 UTC 2023)
CPU x86_64 (x86_64)
Bug reports: https://issues.gerritcodereview.com/issues/new?component=1370071
```

### GIT Installation
```bash
sudo apt-get update
sudo apt-get install git
```

### Docker Installation on Ubuntu
[Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
1. Set up Docker's apt repository.
```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```
2. Install the Docker packages.
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
3. Verify that the Docker Engine installation is successful by running the hello-world image.
```bash
sudo docker run hello-world
```

### tmux Installation

```bash
sudo apt-get install tmux
```

## Installation
#### GIT Clone

```sh
git clone https://github.com/anitawuitri/MTK-Docker-Build.git
```
#### Move to Genio-Series folder
```bash
cd Genio-Series
```
#### download MTK Genios i1200/i700 EVK yocto source codes using repo script
```bash
#### IoT Yocto recipes for v23.1 release
./repo.sh

Downloading Repo source from https://gerrit.googlesource.com/git-repo

... A new version of repo (2.36) is available.
... New version is available at: /media/data1/anitawu/mtk/MTK-Docker/i1200/.repo/repo/repo
... The launcher is run from: /usr/sbin/repo
!!! The launcher is not writable.  Please talk to your sysadmin or distro
!!! to get an update installed.


Your identity is: Anita Wu <anita.wu@itri.org.tw>
If you want to change this, please re-run 'repo init' with --config-name

repo has been initialized in /media/data1/anitawu/mtk/MTK-Docker/i1200

... A new version of repo (2.36) is available.
... New version is available at: /media/data1/anitawu/mtk/MTK-Docker/i1200/.repo/repo/repo
... The launcher is run from: /usr/sbin/repo
!!! The launcher is not writable.  Please talk to your sysadmin or distro
!!! to get an update installed.

remote: Enumerating objects: 294, done.
remote: Counting objects: 100% (144/144), done.
remote: Compressing objects: 100% (48/48), done.
remote: Total 294 (delta 91), reused 138 (delta 90), pack-reused 150
Fetching: 100% (14/14), done in 21m18.725s
Checking out: 100% (14/14), done in 1.895s
repo sync has finished successfully.
```
## Build i1200/i700 EVK Yocto Docker Images
Skip this step if Genio docker images exists
```bash
## docker images name is sb52:dev
$ docker build -t genio:dev . --no-cache
## check genio:dev has been created
$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED        SIZE
genio        dev       f11d9ff95194   6 days ago     749MB
ubuntu       18.04     f9a80a55f492   3 months ago   63.2MB
```

## Start to Build MTK Genios i1200/i700 EVK in Container
### 1. create new tmux screen (optional/recommendation)
```bash
$ tmux new -s genio
```

### 2. create your own container with your username
```bash
### run docker_run.sh script
$ ./docker_run.sh
create anitawu-genio container
06461f40213e797322f8d5ac4732d293948873c5c6b9c9ee3042d87bc34f2488
set dev uid and gid
### check container exist
$ docker ps
CONTAINER ID   IMAGE       COMMAND       CREATED          STATUS          PORTS     NAMES
06461f40213e   genio:dev   "/bin/bash"   23 seconds ago   Up 22 seconds             anitawu-genio
```
### 3. enter your own container
```bash
$ docker exec -it anitawu-genio bash
dev@06461f40213e:~$ 
```
### 4. start to build sb52 in container
```bash
### 3. cd to iot-yocto folder
dev@7837edb4ee77:~$ cd iot-yocto/
### 4. start to build iot-yocto
### build i1200
./build.sh -m 1200 
### or build i700
./build.sh -m 700
```
### 5. exit tmux screen to do other thing with Ctrl+D (optional/recommendation)
[tmux cheat sheet](https://tmuxcheatsheet.com/)
```bash
[detached (from session genio)]
$
```







