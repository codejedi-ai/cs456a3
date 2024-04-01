3) Open a new terminal in the CS456 VM and dump the flow rules installed on switch s1 
using the command, 

sudo ovs-ofctl dump-flows s1. 

 cookie=0x0, duration=636.763s, table=0, n_packets=145, n_bytes=13650, hard_timeout=1800, priority=65001,dl_src=00:00:00:00:00:05,dl_dst=00:00:00:00:00:01 actions=output:"s1-eth1"
 cookie=0x0, duration=635.727s, table=0, n_packets=143, n_bytes=13566, hard_timeout=1800, priority=65001,dl_src=00:00:00:00:00:01,dl_dst=00:00:00:00:00:05 actions=output:"s1-eth2"
 cookie=0x0, duration=664.609s, table=0, n_packets=256, n_bytes=10496, priority=65000,dl_dst=01:23:20:00:00:01,dl_type=0x88cc actions=CONTROLLER:65535
 cookie=0x0, duration=664.559s, table=0, n_packets=0, n_bytes=0, priority=32769,arp,dl_dst=02:00:00:00:be:ef actions=CONTROLLER:65535


Dump the flow rules on all the switches both before and after the ping, make sure you change s1 in the command above to the appropriate switch name. Compare the initial flow rules with the ones installed in the switches after initiating ping between hosts. 


What do you think the initial rules are for? 
The initial rules

 cookie=0x0, duration=664.609s, table=0, n_packets=256, n_bytes=10496, priority=65000,dl_dst=01:23:20:00:00:01,dl_type=0x88cc actions=CONTROLLER:65535
 cookie=0x0, duration=664.559s, table=0, n_packets=0, n_bytes=0, priority=32769,arp,dl_dst=02:00:00:00:be:ef actions=CONTROLLER:65535

The initial rules are meant to connect the switches to the external controler. 


Do all switches have newly installed flow rules after the ping? Explain why. 
Not all switches have newelly installed pings. Only the switches in which the packets pass through have newelly installed pings. The reason for such is because the packet have no-where to go on switches not on the path. THe switches not on the path of the ping do not need the rules as they are not involved in the routing process. 


Include a screenshot of the terminal showing all the dump commands and their outputs in 
your answer, use multiple screenshots, if necessary. The screenshots should be readable and clearly show which output pertains to which switch. 

Observe how the OVS rules are different from the rules you defined in part A. Explain what that indicates about the type of packet-forwarding that this controller implements? (Hint: Consider the fields that are or are not being used in the OVS rules compared to part A.)

The fields that are not considered in the OVS in part-C that are otherwise considered in part A are the in-mac addresses and the in port number. 

Only the destination ip address is important as it deterines the port the data-layer use ot output the packet. 