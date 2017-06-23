# Command-line bootcamp

Forked from the original with the intention of adding content

Learn the unix command-line by using it in your browser.

### contributors

- [@jessicamizzi](https://github.com/jessicamizzi)

### build and deploy the frontend

You'll need node.js

```bash
# install and set up nvm and node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
source ~/.bashrc

# some dependencies don't work with node 1+, so stick with 0.12
nvm install 0.12
nvm use 0.12
```

Once you've got node installed, grab this repo and let node install the dependencies:

```bash
git clone https://github.com/iracooke/command_line_bootcamp.git
cd command_line_bootcamp
npm install
```

Make your changes (if any) and then deploy:

```bash
npm run deploy
```

### setup and run the docker server backend

Instructions for running on a Nectar Ubuntu 16.04 image

Login and switch to the root account


```bash
# need some basics
apt-get update
apt-get install -y build-essential g++ curl git

# install and set up nvm and node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
source ~/.bashrc

# some dependencies don't work with node 1+, so stick with 0.12
nvm install 0.12
nvm use 0.12

# major dependencies
npm install --global iracooke/docker-browser-server

# setup docker
# You first need to install docker according to the instructions on dockerproject.org

git clone https://github.com/iracooke/bc2023.git
cd BC2023
docker build -t "bc2023" .
docker-browser-server bc2023 -p 8080
```

### cleaning up long-running containers

Sometimes people leave their browser windows open for a really long time. If you don't want to fund the docker container running for that time, you can clean up long-running containers:

```bash
docker stop $(docker ps | grep hours | cut -d ' ' -f1 | paste - - - - )
```
