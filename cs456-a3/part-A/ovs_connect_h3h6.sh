#!/usr/bin/env bash

# Sets bridge s3 to use OpenFlow 1.3
ovs-vsctl set bridge s3 protocols=OpenFlow13 

# Sets bridge s6 to use OpenFlow 1.3
ovs-vsctl set bridge s6 protocols=OpenFlow13 

# Print the protocols that each switch supports
for switch in s3 s6;
do
    protos=$(ovs-vsctl get bridge $switch protocols)
    echo "Switch $switch supports $protos"
done

# Avoid having to write "-O OpenFlow13" before all of your ovs-ofctl commands.
ofctl='ovs-ofctl -O OpenFlow13'

# OVS rules for switch 0
$ofctl add-flow s3 \
    in_port=1,ip,nw_src=10.0.3.2,nw_dst=10.0.6.2,actions=mod_dl_src:0A:00:0F:01:00:04,mod_dl_dst:0A:00:0F:FE:00:02,output=4 

$ofctl add-flow s6 \
    in_port=2,ip,nw_src=10.0.3.2,nw_dst=10.0.6.2,actions=mod_dl_src:0A:00:06:01:00:01,mod_dl_dst:0A:00:06:02:00:00,output=1 

# OVS rules for switch 1
$ofctl add-flow s6 \
    in_port=1,ip,nw_src=10.0.6.2,nw_dst=10.0.3.2,actions=mod_dl_src:0A:00:0F:FE:00:02,mod_dl_dst:0A:00:0F:01:00:04,output=2 

$ofctl add-flow s3 \
    in_port=4,ip,nw_src=10.0.6.2,nw_dst=10.0.3.2,actions=mod_dl_src:0A:00:03:01:00:01,mod_dl_dst:0A:00:03:02:00:00,output=1 

# Print the flows installed in each switch
for switch in s0 s1;
do
    echo "Flows installed in $switch:"
    $ofctl dump-flows $switch
    echo ""
done
