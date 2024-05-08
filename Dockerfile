FROM ubuntu:latest
COPY st-stm32cubeclt_1.14.0_19471_20231121_1200_amd64.deb_bundle.sh /install.sh

RUN apt update && apt upgrade
RUN apt-get install -y libusb-1.0-0-dev

# Install CMake using KitWare's APT repository (https://apt.kitware.com/)
RUN apt-get update && \
    apt-get install -y ca-certificates gpg wget

# Download manual KitWare keyring so we can add their APT repo
RUN test -f /usr/share/doc/kitware-archive-keyring/copyright || \
    wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null

RUN echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ jammy main' | tee /etc/apt/sources.list.d/kitware.list >/dev/null && \
    apt-get update

# remove manual KitWare keyring
RUN test -f /usr/share/doc/kitware-archive-keyring/copyright || \
    rm /usr/share/keyrings/kitware-archive-keyring.gpg

# Install KitWare's keyring through APT
RUN apt-get install -y kitware-archive-keyring

# Install CMake
RUN apt-get install -y cmake

# Setup the timezone non-interactively so we don't need to in the install
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

RUN chmod +x /install.sh
