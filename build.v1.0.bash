cd base
docker build --no-cache --force-rm -t docker_open5gs .
cd ../ims_base
docker build --no-cache --force-rm -t docker_kamailio .
cd ../srslte
docker build --no-cache --force-rm -t docker_srslte .
cd ../srsran
docker build --no-cache --force-rm -t docker_srsran .
cd ../ueransim
docker build --no-cache --force-rm -t docker_ueransim .

cd ..
set -a
source .env
sudo ufw disable
sudo sysctl -w net.ipv4.ip_forward=1
sudo cpupower frequency-set -g performance

echo -ne "5g or 4g ? : "
read REPLY
if [[ "$REPLY" == "5g" || "$REPLY" == "5G" ]]; then
	docker compose -f sa-deploy.yaml build
else
	docker compose -f sa-deploy.yaml build
fi


