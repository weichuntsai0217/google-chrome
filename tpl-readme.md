<h1 align="center">$PROJ_NAME$</h1>

<p align="center">Your Universal Google Chrome by Docker</p>

## Preview
![preview](./preview.png)


## Installation & run

* Step 1. Install `docker` by following [Docker official installation guide](https://docs.docker.com/install/).
Docker is cross-platform so you can run **$PROJ_NAME$** on Mac OSX / Linux / Windows.

* Step 2. Download the image, run
```
$ docker pull $DEP_REPO$:$DEP_VER$
$ docker pull $PROJ_REPO$:$PROJ_VER$
```

* Step 3. Install a VNC viewer. I recommend [RealVNC](https://www.realvnc.com/en/connect/download/viewer/).

* Step 4. Initialize the **$DEP_NAME$** container, the command is as follows:
```
$ docker run --name mydisplay -e VNC_PASSWORD=1234 -p 5901:5900 $DEP_REPO$:$DEP_VER$
```
For other scenarios of this step, please refer to [$DEP_NAME$ README.md](https://github.com/weichuntsai0217/$DEP_NAME$/blob/master/README.md)

* Step 5. Initialize the **$PROJ_NAME$** container with link to **$DEP_NAME$** container (assume you want to name the $PROJ_NAME$ container as `chrome`), please run
```
$ docker run --name chrome -dt --link mydisplay:$DEP_NAME$ --volumes-from mydisplay $PROJ_REPO$:$PROJ_VER$
```

* Step 6. Setup authentication cookie in the container `chrome` and run the command `$PROJ_NAME$`
```
$ docker exec -it chrome bash
$ chmod 755 /setup-xclient.sh; /setup-xclient.sh $DEP_NAME$; source ${HOME}/.bashrc
$ $PROJ_NAME$ --no-sandbox
```

* Step 7. Open your VNC viewer in the host computer (assume you initialize **$DEP_NAME$** like Step 4),
connect to `localhost:5901` and type in the password `1234`,
then you can see your $PROJ_NAME$ console window inside the VNC viewer window like the following figure:
![demo1](./demo1.png)
