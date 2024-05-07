Unofficial STM32Cube CLT Docker Image
=====================================

This repo creates a Docker image for the STM32 Command Line Tools (CLT).

A ubuntu environment is recommended for building. WSL can be used on Windows.

There are a few manual steps involved.

Building
--------

1. Download the [STM32 CLT installer](https://www.st.com/en/development-tools/stm32cubeclt.html)
   for Linux (DEB). It must be the DEB version.
2. Extract the downloaded file ending in .deb_bundle.sh to this directory
3. Update the COPY command in the Dockerfile with the script name
4. run ```docker build -t ghcr.io/<organization name>/stm32cubeclt:<version> .```
5. run ```docker run -it ghcr.io/<organization name>/stm32cubeclt:<version> /install.sh```
6. Accept the license by pressing down arrow until you see the prompt for y/N
   (You must press down arrow exactly enough times to reach the prompt. It will 
   reject the license if you press the down arrow again)
7. run ```docker ps -a``` to find the container id
8. run ```docker commit <container id from before> ghcr.io/<organization name>/stm32cubeclt:<version>```

Pushing
-------

1. Create a PAT for your GitHub account
2. run ```echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin``` to login to docker
3. run ```docker push ghcr.io/<organization name>/stm32cubeclt:<version>```

License
-------

[See the license here](LICENSE)
