current_dir=$(pwd)
~/pox 

./pox.py --verbose py openflow.of_01 --port=6633 openflow.discovery forwarding.l2_learning host_tracker


sudo mn --controller=remote,ip=127.0.0.1,port=6633  --topo=tree,depth=3 --mac --switch ovs

sudo ovs-ofctl show s1
sudo ovs-ofctl dump-flows s1