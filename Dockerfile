FROM ubuntu:latest
COPY st-stm32cubeclt_1.14.0_19471_20231121_1200_amd64.deb_bundle.sh /install.sh

RUN apt update && apt upgrade
RUN apt-get install -y libusb-1.0-0-dev

# Setup the timezone non-interactively so we don't need to in the install
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

RUN chmod +x /install.sh
