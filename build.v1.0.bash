cd && cd docker_open5gs_160424/docker_open5gs/base && docker build --no-cache --force-rm -t docker_open5gs .
cd && cd docker_open5gs_160424/docker_open5gs/ims_base && docker build --no-cache --force-rm -t docker_kamailio .
cd && cd docker_open5gs_160424/docker_open5gs/srslte && docker build --no-cache --force-rm -t docker_srslte .
cd && cd docker_open5gs_160424/docker_open5gs/srsran && docker build --no-cache --force-rm -t docker_srsran .
cd && cd docker_open5gs_160424/docker_open5gs/ueransim && docker build --no-cache --force-rm -t docker_ueransim .

cd && cd docker_open5gs_160424/docker_open5gs/
set -a
source .env
sudo ufw disable
sudo sysctl -w net.ipv4.ip_forward=1
sudo cpupower frequency-set -g performance

echo -ne "5g or 4g ? : "
read REPLY
if [[ "$REPLY" == "5g" || "$REPLY" == "5G" ]]; then
	docker compose -f sa-deploy.yaml build && docker pull mongo:6.0
else
	docker compose -f sa-deploy.yaml build && docker pull mongo:6.0
fi
