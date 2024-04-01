#!/usr/bin/env bash

# Sets bridge s3 to use OpenFlow 1.3
ovs-vsctl set bridge R1 protocols=OpenFlow13 

# Sets bridge s6 to use OpenFlow 1.3
ovs-vsctl set bridge R2 protocols=OpenFlow13 

# Print the protocols that each switch supports
for switch in R1 R2;
do
    protos=$(ovs-vsctl get bridge $switch protocols)
    echo "Switch $switch supports $protos"
done

# Avoid having to write "-O OpenFlow13" before all of your ovs-ofctl commands.
ofctl='ovs-ofctl -O OpenFlow13'
# ([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}
# OVS rules for R1
$ofctl add-flow R1 \
    ip,nw_dst=10.4.4.48,actions=mod_dl_dst:0B:0A:0B:0A:0B:0A,output=2 

$ofctl add-flow R2 \
    ip,nw_dst=10.4.4.48,actions=mod_dl_dst:b0:b0:b0:b0:b0:b0,output=1 

# OVS rules for switch 1
$ofctl add-flow R2 \
    ip,nw_dst=10.1.1.17,actions=mod_dl_dst:0A:0B:0A:0B:0A:0B,output=2 

$ofctl add-flow R1 \
    ip,nw_dst=10.1.1.17,actions=mod_dl_dst:aa:aa:aa:aa:aa:aa,output=1 

# Print the flows installed in each switch
for switch in R1 R2;
do
    echo "Flows installed in $switch:"
    $ofctl dump-flows $switch
    echo ""
done
