#!/usr/bin/env bash

# Sets bridge s0 to use OpenFlow 1.3
ovs-vsctl set bridge s0 protocols=OpenFlow13 

# Sets bridge s2 to use OpenFlow 1.3
ovs-vsctl set bridge s2 protocols=OpenFlow13 

# Print the protocols that each switch supports
for switch in s0 s2;
do
    protos=$(ovs-vsctl get bridge $switch protocols)
    echo "Switch $switch supports $protos"
done

# Avoid having to write "-O OpenFlow13" before all of your ovs-ofctl commands.
ofctl='ovs-ofctl -O OpenFlow13'

# OVS rules for switch 0
# from h0 to h2 switch s0
$ofctl add-flow s0 \
    in_port=1,ip,nw_src=10.0.0.2,nw_dst=10.0.2.2,actions=mod_dl_src:0A:00:0A:01:00:02,mod_dl_dst:0A:00:0B:FE:00:02,output=3

# from h2 to h0 through switch s0
$ofctl add-flow s0 \
    in_port=3,ip,nw_src=10.0.2.2,nw_dst=10.0.0.2,actions=mod_dl_src:0A:00:00:01:00:01,mod_dl_dst:0A:00:00:02:00:00,output=1 

# OVS rules for switch 2

# from h0 to h2 switch s2
$ofctl add-flow s2 \
    in_port=2,ip,nw_src=10.0.0.2,nw_dst=10.0.2.2,actions=mod_dl_src:0A:00:01:01:00:01,mod_dl_dst:0A:00:02:02:00:00,output=1 
# from h2 to h0 switch s2
$ofctl add-flow s2 \
    in_port=1,ip,nw_src=10.0.2.2,nw_dst=10.0.0.2,actions=mod_dl_src:0A:00:0B:FE:00:02,mod_dl_dst:0A:00:0A:01:00:02,output=2 

# Print the flows installed in each switch
for switch in s0 s1;
do
    echo "Flows installed in $switch:"
    $ofctl dump-flows $switch
    echo ""
done
