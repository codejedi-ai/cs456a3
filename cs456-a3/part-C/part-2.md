2) Take a screenshot of the ping RTT times for the first 5 ping messages. Compare the RTT of 
the first ping message with the subsequent ones. Is there a difference? Why or why not?

mininet> h1 ping h5
PING 10.0.0.5 (10.0.0.5) 56(84) bytes of data.
64 bytes from 10.0.0.5: icmp_seq=1 ttl=64 time=2578 ms
64 bytes from 10.0.0.5: icmp_seq=2 ttl=64 time=1556 ms
64 bytes from 10.0.0.5: icmp_seq=3 ttl=64 time=526 ms
64 bytes from 10.0.0.5: icmp_seq=4 ttl=64 time=0.061 ms
64 bytes from 10.0.0.5: icmp_seq=5 ttl=64 time=0.065 ms

the RTT of the first 3 messages are longer than the last 2. htis is due to the POX installing the flow rules for the respective hosts