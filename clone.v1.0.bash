cd
mkdir docker_open5gs_160424
cd docker_open5gs_160424
git clone https://github.com/herlesupreeth/docker_open5gs
git clone --depth 1 https://github.com/henintsoa98/docker_open5gs_build
cp docker_open5gs_build/build.v1.0.bash docker_open5gs_build/clone.v1.0.bash docker_open5gs
cd docker_open5gs
git checkout 8b2f5c9211f37fc9a0d8b1256eec845953a42bb6
# TEMPLATE
#sed -i "s###;s#git checkout [a-zA-Z0-9./]*#echo CLONE_SUCCESS#" /Dockerfile

# rtpengine
sed -i "s#git clone https://github.com/sipwise/rtpengine#git clone --depth 1 -b herlesupreeth.1.0.rtpengine https://github.com/henintsoa98/rtpengine#;s#git checkout [a-zA-Z0-9./]*#echo CLONE_SUCCESS#" rtpengine/Dockerfile

# base
sed -i "s#git clone --recursive https://github.com/open5gs/open5gs#git clone --depth 1 --recursive -b herlesupreeth.1.0.base https://github.com/henintsoa98/open5gs#;s#git checkout [a-zA-Z0-9./]*#echo CLONE_SUCCESS#" base/Dockerfile

# srslte
sed -i "s#git clone https://github.com/pothosware/SoapySDR.git#git clone --depth 1 -b herlesupreeth.1.0.srslte https://github.com/henintsoa98/SoapySDR#;s#git checkout [a-zA-Z0-9./]*#echo CLONE_SUCCESS#" srslte/Dockerfile
sed -i "s#git clone https://github.com/myriadrf/LimeSuite.git#git clone --depth 1 -b herlesupreeth.1.0.srslte https://github.com/henintsoa98/LimeSuite#;s#git checkout [a-zA-Z0-9./]*#echo CLONE_SUCCESS#" srslte/Dockerfile
sed -i "s#git clone https://github.com/Nuand/bladeRF.git#git clone --depth 1 -b herlesupreeth.1.0.srslte https://github.com/henintsoa98/bladeRF \&\& git clone --depth 1 -b herlesupreeth.1.0.srslte https://github.com/henintsoa98/no-OS bladeRF/thirdparty/analogdevicesinc/no-OS#;s#git checkout [a-zA-Z0-9./]*#echo CLONE_SUCCESS#" srslte/Dockerfile
sed -i "s#git clone https://github.com/pothosware/SoapyBladeRF.git#git clone --depth 1 -b herlesupreeth.1.0.srslte https://github.com/henintsoa98/SoapyBladeRF#;s#git checkout [a-zA-Z0-9.]/*#echo CLONE_SUCCESS#" srslte/Dockerfile
sed -i "s#git clone https://github.com/srsran/srsGUI#git clone --depth 1 -b herlesupreeth.1.0.srslte https://github.com/henintsoa98/srsGUI#;s#git checkout [a-zA-Z0-9./]*#echo CLONE_SUCCESS#" srslte/Dockerfile
sed -i "s#git clone https://github.com/srsran/srsRAN_4G.git#git clone --depth 1 -b herlesupreeth.1.0.srslte https://github.com/henintsoa98/srsRAN_4G#;s#git checkout [a-zA-Z0-9./]*#echo CLONE_SUCCESS#" srslte/Dockerfile

# ueransim
sed -i "s#git clone https://github.com/aligungr/UERANSIM#git clone --depth 1 -b herlesupreeth.1.0.ueransim https://github.com/henintsoa98/UERANSIM#;s#git checkout [a-zA-Z0-9./]*#echo CLONE_SUCCESS#" ueransim/Dockerfile

# srsran
sed -i "s#git clone https://github.com/srsran/srsRAN_Project.git#git clone --depth 1 -b herlesupreeth.1.0.srsran https://github.com/henintsoa98/srsRAN_Project#;s#git checkout [a-zA-Z0-9./]*#echo CLONE_SUCCESS#" srsran/Dockerfile

# pyhss
sed -i "s#git clone https://github.com/nickvsnetworking/pyhss#git clone --depth 1 -b herlesupreeth.1.0.pyhss https://github.com/henintsoa98/pyhss#;s#git checkout [a-zA-Z0-9./]*#echo CLONE_SUCCESS#" pyhss/Dockerfile

# oai
sed -i "s#git clone https://github.com/myriadrf/LimeSuite.git#git clone --depth 1 -b herlesupreeth.1.0.oai https://github.com/henintsoa98/LimeSuite#;s#git checkout [a-zA-Z0-9./]*#echo CLONE_SUCCESS#" oai/enb_dockerfile
sed -i "s#git clone https://gitlab.eurecom.fr/oai/openairinterface5g.git#git clone --depth 1 -b herlesupreeth.1.0.oai https://github.com/henintsoa98/openairinterface5g#;s#git checkout [a-zA-Z0-9./]*#echo CLONE_SUCCESS#" oai/enb_dockerfile
sed -i "s#git clone https://github.com/myriadrf/LimeSuite.git#git clone --depth 1 -b herlesupreeth.1.0.oai https://github.com/henintsoa98/LimeSuite#;s#git checkout [a-zA-Z0-9./]*#echo CLONE_SUCCESS#" oai/gnb_dockerfile
sed -i "s#git clone https://gitlab.eurecom.fr/oai/openairinterface5g.git#git clone --depth 1 -b herlesupreeth.1.0.oai https://github.com/henintsoa98/openairinterface5g#;s#git checkout [a-zA-Z0-9./]*#echo CLONE_SUCCESS#" oai/gnb_dockerfile

#ims_base
sed -i "s#git clone https://github.com/kamailio/kamailio#git clone --depth 1 -b herlesupreeth.1.0.ims_base https://github.com/henintsoa98/kamailio#;s#git checkout [a-zA-Z0-9./]*#echo CLONE_SUCCESS#" ims_base/Dockerfile
