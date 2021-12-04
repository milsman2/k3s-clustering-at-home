#!/bin/bash

k3sup install \
--cluster \
--ip 192.168.20.205 \
--k3s-channel stable \
--k3s-extra-args '--disable servicelb --disable traefik --write-kubeconfig-mode 644' \
--merge \
--context k3s-ha-amd64 \
--local-path $HOME/.kube/config \
--user miles

wait

echo ""
echo "Server 1 complete!"
echo ""

wait

k3sup join \
--ip 192.168.20.206 \
--k3s-channel stable \
--k3s-extra-args '--disable servicelb --disable traefik --write-kubeconfig-mode 644' \
--user miles \
--server-user miles \
--server-ip 192.168.20.205 \
--server

wait

echo ""
echo "Server 2 complete!"
echo ""

wait

k3sup join \
--ip 192.168.20.207 \
--k3s-channel stable \
--k3s-extra-args '--disable servicelb --disable traefik --write-kubeconfig-mode 644' \
--user miles \
--server-user miles \
--server-ip 192.168.20.205 \
--server

wait

echo ""
echo "Server 3 complete!"
echo ""

wait

k3sup join \
--ip 192.168.20.208 \
--k3s-channel stable \
--user miles \
--server-user miles \
--server-ip 192.168.20.205

wait

echo ""
echo "Server 4 complete!"
echo ""

wait

k3sup join \
--ip 192.168.200.209 \
--k3s-channel stable \
--user miles \
--server-user miles \
--server-ip 192.168.20.205

wait

echo ""
echo "Server 5 complete!"
echo ""

wait

k3sup join \
--ip 192.168.20.210 \
--k3s-channel stable \
--user miles \
--server-user miles \
--server-ip 192.168.20.205

wait

echo ""
echo "Server 6 complete!"
echo ""

wait

k3sup join \
--ip 192.168.20.212 \
--k3s-channel stable \
--user miles \
--server-user miles \
--server-ip 192.168.20.205

wait

echo ""
echo "Server 7 complete!"
echo ""

k3sup join \
--ip 192.168.20.213 \
--k3s-channel stable \
--user miles \
--server-user miles \
--server-ip 192.168.20.205

echo ""
echo "Server 8 complete!"
echo ""

export KUBECONFIG=/home/miles/.kube/config

wait

kubectl config set-context k3s-ha-amd64

echo "All Servers Installed!"

sleep 60

echo "Here is your cluster:"

wait

kubectl get nodes -o wide
