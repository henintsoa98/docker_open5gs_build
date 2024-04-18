# Introduction
This script use this awesome project : [docker_open5gs](https://github.com/herlesupreeth/docker_open5gs) \
This patch/script is used to reducing the internet consumption of git clone commands, on the other hand, we were able to recover checkouts from current times
## Cause of creation of this repository
the internet connection in Madagascar is terribly bad, high latency, very unstable, and very very expensive. \
Any operator presents the fatal early EOF error during several operations git clone of LimeSuite, BladeRF, no-OS(BladeRF),..., then Telma🖕, Airtel 🖕, orange🖕. \
this patch is used to bypass this error, by reducing the internet consumption of git clone commands.
## Information
Tags info : For building docker_open5gs_build \
tags name : a.b.c.d \
a -> official repo (herlesupreth) \
b -> my ID for the repo (1 -> docker_open5gs) \
c -> ID of my build (x) \
d -> directory of official repo(xxxx) \
## NB
Before doing anything make sure that [docker](https://docs.docker.com/engine/install/), cpupower and wget is on your computer, and work correctly to get best performance \
Always use latest version at this README or use old version at your own risk \
Learn docker if you want to update or try to clean completly because I always test this script on fresh install, not from an previous version \

# v1.0 (16-04-24 15:00)
## BUILDING
Main source on [docker open5gs](https://github.com/herlesupreeth/docker_open5gs/tree/8b2f5c9211f37fc9a0d8b1256eec845953a42bb6) but pacth some **git clone** command. \
Run :
```bash
wget -O - https://raw.githubusercontent.com/henintsoa98/docker_open5gs_build/main/clone.v1.0.bash | bash
```
**IF you are sure to have good connection** :
```bash
cd && cd docker_open5gs_160424/docker_open5gs && bash build.v1.0.bash
```
**ELSE RUN THIS LINE BY LINE, IF ERROR OCURS RUN AGAIN**
```bash
cd && cd docker_open5gs_160424/docker_open5gs/base && docker build --no-cache --force-rm -t docker_open5gs .
```
```bash
cd && cd docker_open5gs_160424/docker_open5gs/ims_base && docker build --no-cache --force-rm -t docker_kamailio .
```
```bash
cd && cd docker_open5gs_160424/docker_open5gs/srslte && docker build --no-cache --force-rm -t docker_srslte .
```
You can skip srsran and ueransim if build for 4g only
```bash
cd && cd docker_open5gs_160424/docker_open5gs/srsran && docker build --no-cache --force-rm -t docker_srsran .
```
```bash
cd && cd docker_open5gs_160424/docker_open5gs/ueransim && docker build --no-cache --force-rm -t docker_ueransim .
```
```bash
cd && cd docker_open5gs_160424/docker_open5gs/
set -a
source .env
sudo ufw disable # don't wory if there is not ufw on your system
sudo sysctl -w net.ipv4.ip_forward=1
sudo cpupower frequency-set -g performance
```
**4G only**
```bash
cd && cd docker_open5gs_160424/docker_open5gs/ && docker compose -f sa-deploy.yaml build && docker pull mongo:6.0
```
**5G only**
```bash
cd && cd docker_open5gs_160424/docker_open5gs/ && docker compose -f sa-deploy.yaml build && docker pull mongo:6.0
```
## RUNNING
**Edit .env file (MNC,MCC,DOCKER_IP)**
```bash
cd && vim docker_open5gs_160424/docker_open5gs/.env
```
**PRE-LAUNCH**
```bash
sudo ufw disable # don't wory if there is not ufw on your system
sudo sysctl -w net.ipv4.ip_forward=1
sudo cpupower frequency-set -g performance
```
**TERMINAL1**
```bash
set -a && cd && cd docker_open5gs_160424/docker_open5gs/ && source .env && docker compose -f 4g-volte-deploy.yaml up
```
**TERMINAL2**
```bash
set -a && cd && cd docker_open5gs_160424/docker_open5gs/ && source .env && docker compose -f srsenb.yaml up -d && docker container attach srsenb
```
On your system, base directory is located at **~/docker_open5gs_160424/** \
Continue installation tutorial for provisionning SIM [here (v1.0)](https://github.com/herlesupreeth/docker_open5gs/tree/8b2f5c9211f37fc9a0d8b1256eec845953a42bb6).Or view readme with :
```bash
glow ~/docker_open5gs_160424/docker_open5gs/README.md
# or
less ~/docker_open5gs_160424/docker_open5gs/README.md
```
## list of checkout (JUST FOR INFORMATION)
### base
```bash
git clone --recursive https://github.com/open5gs/open5gs
git checkout 322719f3e729aafacf531e85552d7a977fff3e2a
# git clone --depth 1 -b herlesupreeth.1.0.base https://github.com/henintsoa98/open5gs 66.12mb/15.95mb
```
### ims_base
```bash
git clone https://github.com/kamailio/kamailio # misy module ratsy be
git checkout 4fb8accc6747ad56fec3dc84d70cb2b8bbd7316e
# git clone --depth 1 -b herlesupreeth.1.0.ims_base https://github.com/henintsoa98/kamailio 105.18mb/13.81mb
```
### srslte
```bash
git clone https://github.com/pothosware/SoapySDR.git
git checkout 637023d5e1b60e117a6533daddc4d991a33375f9
# git clone --depth 1 -b herlesupreeth.1.0.srslte https://github.com/henintsoa98/SoapySDR 4.57mb/178.97kb
git clone https://github.com/myriadrf/LimeSuite.git
git checkout tags/v22.09.1 -b v22.09.1 # b18db192f4faca43a6739143ca75b862067d6bde
# git clone --depth 1 -b herlesupreeth.1.0.srslte https://github.com/henintsoa98/LimeSuite 196.06mb/5.00mb
git clone https://github.com/Nuand/bladeRF.git # 2fbae2c38b377cfbee98c281789cd43d1f1b55e4
# git clone --depth 1 -b herlesupreeth.1.0.srslte https://github.com/henintsoa98/bladeRF 12.62mb/2.77mb
git clone https://github.com/analogdevicesinc/no-OS bladeRF/thirdparty/analogdevicesinc/no-OS # 0bba46e6f6f75785a65d425ece37d0a04daf6157
# git clone --depth 1 -b herlesupreeth.1.0.srslte https://github.com/henintsoa98/no-OS  bladeRF/thirdparty/analogdevicesinc/no-OS 446.75mb/27.98mb
git clone https://github.com/pothosware/SoapyBladeRF.git # 85f6dc554ed4c618304d99395b19c4e1523675b0
# git clone --depth 1 -b herlesupreeth.1.0.srslte https://github.com/henintsoa98/SoapyBladeRF 180.03kb/37.02kb
git clone https://github.com/srsran/srsGUI # a277a1ac210b5020060360e74b6d6e027355af05
# git clone --depth 1 -b herlesupreeth.1.0.srslte https://github.com/henintsoa98/srsGUI 91.96kb/56.99kb
git clone https://github.com/srsran/srsRAN_4G.git
git checkout 4eb990c9c6ad9b0af943bba71d0f8355b3ebb259
# git clone --depth 1 -b herlesupreeth.1.0.srslte https://github.com/henintsoa98/srsRAN_4G 63.71mb/15.15mb
```
### srsran
```bash
git clone https://github.com/srsran/srsRAN_Project.git
git checkout 55c984b55736d0dd2d2ee328f1ae8d9de97e3e19
# git clone --depth 1 -b herlesupreeth.1.0.srsran https://github.com/henintsoa98/srsRAN_Project 49.03mb/6.69mb
```
### ueransim
```bash
git clone https://github.com/aligungr/UERANSIM
git checkout tags/v3.2.6 # 384636f4fcf46b8c86109790ff3e2cd242b53556
# git clone --depth 1 -b herlesupreeth.1.0.ueransim https://github.com/henintsoa98/UERANSIM 5.31mb/3.62mb
```
### rtpengine
```bash
git clone https://github.com/sipwise/rtpengine
git checkout mr9.4.1 # 9aa365903a8654ef6d8f9bd6ee97be738d49f287
# git clone --depth 1 -b herlesupreeth.1.0.rtpengine https://github.com/henintsoa98/rtpengine 21.69mb/713.51kb
```
### pyhss
```bash
git clone https://github.com/nickvsnetworking/pyhss
git checkout fa059d56330f6e565a9b546d5a9ed4071c2c9ab6
# git clone --depth 1 -b herlesupreeth.1.0.pyhss https://github.com/henintsoa98/pyhss 4.06mb/2.95mb
```
### oai/enb_dockerfile
```bash
git clone https://github.com/myriadrf/LimeSuite.git
git checkout tags/v20.10.0 -b v20.10.0 # 1480bfeaf4de211c40813fc5ca161b1b644778ec
# git clone --depth 1 -b herlesupreeth.1.0.oai https://github.com/henintsoa98/LimeSuite 196.06mb/5.19mb
git clone https://gitlab.eurecom.fr/oai/openairinterface5g.git
git checkout develop # 749779247d298c45352a636ad933f5204480c65b
# git clone --depth 1 -b herlesupreeth.1.0.oai https://github.com/henintsoa98/openairinterface5g 289.70mb/24.31mb
```
### oai/gnb_dockerfile
```bash
git clone https://github.com/myriadrf/LimeSuite.git
git checkout tags/v20.10.0 -b v20.10.0 # 1480bfeaf4de211c40813fc5ca161b1b644778ec
# git clone --depth 1 -b herlesupreeth.1.0.oai https://github.com/henintsoa98/LimeSuite 196.06mb/5.19mb
git clone https://gitlab.eurecom.fr/oai/openairinterface5g.git
git checkout develop # 749779247d298c45352a636ad933f5204480c65b
# git clone --depth 1 -b herlesupreeth.1.0.oai https://github.com/henintsoa98/openairinterface5g 289.70mb/24.31mb
```
