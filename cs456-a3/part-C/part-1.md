1) Try pinging h5 from h1 (type h1 ping h5 in Mininet). The ping should succeed, even 
though you have not installed any OVS rules on the switches yourself. Study the output in 
the POX controller terminal. What has the controller done?  Include a screenshot of the 
output as well as your interpretation of it. Make sure that the screenshot is readable. Hint: 
To interpret the effect of the controller, consider the path ping packets must take from h1 to 
h5. Now consider the number of logs generated by the controller and explain how they 
relate to the topology. 


- The POX controlder have detected the links between the hosts and then implemented the flow rules after I initiated the ping command



When start out:
./pox.py --verbose py openflow.of_01 --port=6633 openflow.discovery forwarding.l2_learning host_tracker
POX 0.7.0 (gar) / Copyright 2011-2020 James McCauley, et al.
INFO:host_tracker:host_tracker ready
DEBUG:core:POX 0.7.0 (gar) going up...
DEBUG:core:Running on CPython (3.6.9/Jan 26 2021 15:33:00)
DEBUG:core:Platform is Linux-4.15.0-112-generic-x86_64-with-Ubuntu-18.04-bionic
WARNING:version:Support for Python 3 is experimental.
INFO:core:POX 0.7.0 (gar) is up.
DEBUG:openflow.of_01:Listening on 0.0.0.0:6633
Ready.
POX> WARNING:openflow.of_01:Bad OpenFlow version (0x47) on connection [None 1]
WARNING:openflow.of_01:Bad OpenFlow version (0x47) on connection [None 2]
WARNING:openflow.of_01:Bad OpenFlow version (0x47) on connection [None 3]
DEBUG:openflow.of_01:3 connections aborted
POX> WARNING:openflow.of_01:Bad OpenFlow version (0x47) on connection [None 4]
DEBUG:openflow.of_01:2 connections aborted
INFO:openflow.of_01:[00-00-00-00-00-01 6] connected
DEBUG:openflow.discovery:Installing flow for 00-00-00-00-00-01
DEBUG:forwarding.l2_learning:Connection [00-00-00-00-00-01 6]
INFO:openflow.of_01:[00-00-00-00-00-06 7] connected
DEBUG:openflow.discovery:Installing flow for 00-00-00-00-00-06
DEBUG:forwarding.l2_learning:Connection [00-00-00-00-00-06 7]
INFO:openflow.of_01:[00-00-00-00-00-03 8] connected
DEBUG:openflow.discovery:Installing flow for 00-00-00-00-00-03
DEBUG:forwarding.l2_learning:Connection [00-00-00-00-00-03 8]
INFO:openflow.of_01:[00-00-00-00-00-02 9] connected
DEBUG:openflow.discovery:Installing flow for 00-00-00-00-00-02
DEBUG:forwarding.l2_learning:Connection [00-00-00-00-00-02 9]
INFO:openflow.discovery:link detected: 00-00-00-00-00-01.1 -> 00-00-00-00-00-02.3
INFO:openflow.of_01:[00-00-00-00-00-07 10] connected
DEBUG:openflow.discovery:Installing flow for 00-00-00-00-00-07
DEBUG:forwarding.l2_learning:Connection [00-00-00-00-00-07 10]
INFO:openflow.of_01:[00-00-00-00-00-04 11] connected
DEBUG:openflow.discovery:Installing flow for 00-00-00-00-00-04
DEBUG:forwarding.l2_learning:Connection [00-00-00-00-00-04 11]
INFO:openflow.of_01:[00-00-00-00-00-05 12] connected
DEBUG:openflow.discovery:Installing flow for 00-00-00-00-00-05
DEBUG:forwarding.l2_learning:Connection [00-00-00-00-00-05 12]
INFO:openflow.discovery:link detected: 00-00-00-00-00-01.2 -> 00-00-00-00-00-05.3
INFO:openflow.discovery:link detected: 00-00-00-00-00-06.3 -> 00-00-00-00-00-05.1
INFO:openflow.discovery:link detected: 00-00-00-00-00-03.3 -> 00-00-00-00-00-02.1
INFO:openflow.discovery:link detected: 00-00-00-00-00-02.3 -> 00-00-00-00-00-01.1
INFO:openflow.discovery:link detected: 00-00-00-00-00-05.3 -> 00-00-00-00-00-01.2
INFO:openflow.discovery:link detected: 00-00-00-00-00-05.1 -> 00-00-00-00-00-06.3
INFO:openflow.discovery:link detected: 00-00-00-00-00-02.1 -> 00-00-00-00-00-03.3
INFO:openflow.discovery:link detected: 00-00-00-00-00-04.3 -> 00-00-00-00-00-02.2
INFO:openflow.discovery:link detected: 00-00-00-00-00-05.2 -> 00-00-00-00-00-07.3
INFO:openflow.discovery:link detected: 00-00-00-00-00-02.2 -> 00-00-00-00-00-04.3
INFO:openflow.discovery:link detected: 00-00-00-00-00-07.3 -> 00-00-00-00-00-05.2
WARNING:openflow.of_01:Bad OpenFlow version (0x47) on connection [None 13]
DEBUG:openflow.of_01:1 connection aborted
INFO:openflow.discovery:link timeout: 00-00-00-00-00-01.1 -> 00-00-00-00-00-02.3
INFO:openflow.discovery:link timeout: 00-00-00-00-00-01.2 -> 00-00-00-00-00-05.3
INFO:openflow.discovery:link timeout: 00-00-00-00-00-06.3 -> 00-00-00-00-00-05.1
INFO:openflow.discovery:link timeout: 00-00-00-00-00-03.3 -> 00-00-00-00-00-02.1
INFO:openflow.discovery:link timeout: 00-00-00-00-00-02.3 -> 00-00-00-00-00-01.1
INFO:openflow.discovery:link timeout: 00-00-00-00-00-05.3 -> 00-00-00-00-00-01.2
INFO:openflow.discovery:link timeout: 00-00-00-00-00-05.1 -> 00-00-00-00-00-06.3
INFO:openflow.discovery:link timeout: 00-00-00-00-00-02.1 -> 00-00-00-00-00-03.3
INFO:openflow.discovery:link timeout: 00-00-00-00-00-04.3 -> 00-00-00-00-00-02.2
INFO:openflow.discovery:link timeout: 00-00-00-00-00-05.2 -> 00-00-00-00-00-07.3
INFO:openflow.discovery:link timeout: 00-00-00-00-00-02.2 -> 00-00-00-00-00-04.3
INFO:openflow.discovery:link timeout: 00-00-00-00-00-07.3 -> 00-00-00-00-00-05.2
INFO:openflow.discovery:link detected: 00-00-00-00-00-01.2 -> 00-00-00-00-00-05.3
INFO:openflow.discovery:link detected: 00-00-00-00-00-01.1 -> 00-00-00-00-00-02.3
INFO:openflow.discovery:link detected: 00-00-00-00-00-05.3 -> 00-00-00-00-00-01.2
INFO:openflow.discovery:link detected: 00-00-00-00-00-05.2 -> 00-00-00-00-00-07.3
INFO:openflow.discovery:link detected: 00-00-00-00-00-05.1 -> 00-00-00-00-00-06.3
INFO:openflow.discovery:link detected: 00-00-00-00-00-04.3 -> 00-00-00-00-00-02.2
INFO:openflow.discovery:link detected: 00-00-00-00-00-07.3 -> 00-00-00-00-00-05.2
INFO:openflow.discovery:link detected: 00-00-00-00-00-02.3 -> 00-00-00-00-00-01.1
INFO:openflow.discovery:link detected: 00-00-00-00-00-02.2 -> 00-00-00-00-00-04.3
INFO:openflow.discovery:link detected: 00-00-00-00-00-02.1 -> 00-00-00-00-00-03.3
INFO:openflow.discovery:link detected: 00-00-00-00-00-03.3 -> 00-00-00-00-00-02.1
INFO:openflow.discovery:link detected: 00-00-00-00-00-06.3 -> 00-00-00-00-00-05.1
WARNING:openflow.of_01:Bad OpenFlow version (0x47) on connection [None 15]
DEBUG:openflow.of_01:2 connections aborted
DEBUG:openflow.of_01:1 connection aborted
INFO:openflow.discovery:link timeout: 00-00-00-00-00-01.2 -> 00-00-00-00-00-05.3
INFO:openflow.discovery:link timeout: 00-00-00-00-00-01.1 -> 00-00-00-00-00-02.3
INFO:openflow.discovery:link timeout: 00-00-00-00-00-05.3 -> 00-00-00-00-00-01.2
INFO:openflow.discovery:link timeout: 00-00-00-00-00-05.2 -> 00-00-00-00-00-07.3
INFO:openflow.discovery:link timeout: 00-00-00-00-00-05.1 -> 00-00-00-00-00-06.3
INFO:openflow.discovery:link timeout: 00-00-00-00-00-04.3 -> 00-00-00-00-00-02.2
INFO:openflow.discovery:link timeout: 00-00-00-00-00-07.3 -> 00-00-00-00-00-05.2
INFO:openflow.discovery:link timeout: 00-00-00-00-00-02.3 -> 00-00-00-00-00-01.1
INFO:openflow.discovery:link timeout: 00-00-00-00-00-02.2 -> 00-00-00-00-00-04.3
INFO:openflow.discovery:link timeout: 00-00-00-00-00-02.1 -> 00-00-00-00-00-03.3
INFO:openflow.discovery:link timeout: 00-00-00-00-00-03.3 -> 00-00-00-00-00-02.1
INFO:openflow.discovery:link timeout: 00-00-00-00-00-06.3 -> 00-00-00-00-00-05.1
INFO:openflow.discovery:link detected: 00-00-00-00-00-05.3 -> 00-00-00-00-00-01.2
INFO:openflow.discovery:link detected: 00-00-00-00-00-05.2 -> 00-00-00-00-00-07.3
INFO:openflow.discovery:link detected: 00-00-00-00-00-05.1 -> 00-00-00-00-00-06.3
INFO:openflow.discovery:link detected: 00-00-00-00-00-04.3 -> 00-00-00-00-00-02.2
INFO:openflow.discovery:link detected: 00-00-00-00-00-07.3 -> 00-00-00-00-00-05.2
INFO:openflow.discovery:link detected: 00-00-00-00-00-02.3 -> 00-00-00-00-00-01.1
INFO:openflow.discovery:link detected: 00-00-00-00-00-02.2 -> 00-00-00-00-00-04.3
INFO:openflow.discovery:link detected: 00-00-00-00-00-02.1 -> 00-00-00-00-00-03.3
INFO:openflow.discovery:link detected: 00-00-00-00-00-03.3 -> 00-00-00-00-00-02.1
INFO:openflow.discovery:link detected: 00-00-00-00-00-06.3 -> 00-00-00-00-00-05.1
INFO:openflow.discovery:link detected: 00-00-00-00-00-01.2 -> 00-00-00-00-00-05.3
INFO:openflow.discovery:link detected: 00-00-00-00-00-01.1 -> 00-00-00-00-00-02.3
INFO:host_tracker:Learned 3 1 00:00:00:00:00:01
INFO:host_tracker:Learned 3 1 00:00:00:00:00:01 got IP 10.0.0.1
INFO:host_tracker:Learned 6 1 00:00:00:00:00:05
INFO:host_tracker:Learned 6 1 00:00:00:00:00:05 got IP 10.0.0.5

After initiating the ping commmand:


DEBUG:forwarding.l2_learning:installing flow for 00:00:00:00:00:05.1 -> 00:00:00:00:00:01.3
DEBUG:forwarding.l2_learning:installing flow for 00:00:00:00:00:05.1 -> 00:00:00:00:00:01.3
DEBUG:forwarding.l2_learning:installing flow for 00:00:00:00:00:05.2 -> 00:00:00:00:00:01.1
DEBUG:forwarding.l2_learning:installing flow for 00:00:00:00:00:05.3 -> 00:00:00:00:00:01.1
DEBUG:forwarding.l2_learning:installing flow for 00:00:00:00:00:05.3 -> 00:00:00:00:00:01.1
DEBUG:forwarding.l2_learning:installing flow for 00:00:00:00:00:01.1 -> 00:00:00:00:00:05.3
DEBUG:forwarding.l2_learning:installing flow for 00:00:00:00:00:01.1 -> 00:00:00:00:00:05.3
DEBUG:forwarding.l2_learning:installing flow for 00:00:00:00:00:01.1 -> 00:00:00:00:00:05.2
DEBUG:forwarding.l2_learning:installing flow for 00:00:00:00:00:01.1 -> 00:00:00:00:00:05.2
DEBUG:forwarding.l2_learning:installing flow for 00:00:00:00:00:01.3 -> 00:00:00:00:00:05.1
DEBUG:forwarding.l2_learning:installing flow for 00:00:00:00:00:01.3 -> 00:00:00:00:00:05.1
DEBUG:forwarding.l2_learning:installing flow for 00:00:00:00:00:01.3 -> 00:00:00:00:00:05.1
DEBUG:forwarding.l2_learning:installing flow for 00:00:00:00:00:01.3 -> 00:00:00:00:00:05.1
DEBUG:forwarding.l2_learning:installing flow for 00:00:00:00:00:01.3 -> 00:00:00:00:00:05.1
DEBUG:forwarding.l2_learning:installing flow for 00:00:00:00:00:01.3 -> 00:00:00:00:00:05.1