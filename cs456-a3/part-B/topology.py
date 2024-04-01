#!/usr/bin/python

"""Topology with 10 switches and 10 hosts
"""

from mininet.cli import CLI
from mininet.topo import Topo
from mininet.net import Mininet
from mininet.link import TCLink
from mininet.log import setLogLevel

class CSLRTopo( Topo ):

        def __init__( self ):
                "Create Topology"

                # Initialize topology
                Topo.__init__( self )

                # Add hosts with specified MAC addresses
                Alice = self.addHost('Alice')
                Bob = self.addHost('Bob')
                Carlo = self.addHost( 'Carlo')


                # Add switches
                R1 = self.addSwitch( 'R1', listenPort=6634 )
                R2 = self.addSwitch( 'R2', listenPort=6635 )
                R3 = self.addSwitch( 'R3', listenPort=6636 )

                # Add links between hosts and switches
                self.addLink( Alice, R1 ) # Alice-eth0 <-> R1-eth1
                self.addLink( Bob, R2 ) # Bob-eth0 <-> R2-eth1
                self.addLink( Carlo, R3 ) # Carlo-eth0 <-> R3-eth1

                # Add links between switches, with bandwidth 100Mbps
                self.addLink( R1, R2, bw=100 ) # R1-eth2 <-> R2-eth2, Bandwidth = 100Mbps
                self.addLink( R1, R3, bw=100 ) # R1-eth3 <-> R3-eth2, Bandwidth = 100Mbps
                self.addLink( R2, R3, bw=100 ) # R2-eth3 <-> R3-eth3, Bandwidth = 100Mbps
def run():
        "Create and configure network"
        topo = CSLRTopo()
        net = Mininet( topo=topo, link=TCLink, controller=None )

        # Set interface IP and MAC addresses for hosts
        Alice = net.get( 'Alice' )
        Alice.intf( 'Alice-eth0' ).setIP( '10.1.1.17', 24 )
        Alice.intf( 'Alice-eth0' ).setMAC( 'aa:aa:aa:aa:aa:aa' )

        Bob = net.get( 'Bob' )
        Bob.intf( 'Bob-eth0' ).setIP( '10.4.4.48', 24 )
        Bob.intf( 'Bob-eth0' ).setMAC( 'b0:b0:b0:b0:b0:b0' )

        Carlo = net.get( 'Carlo' )
        Carlo.intf( 'Carlo-eth0' ).setIP( '10.6.6.69', 24 )
        Carlo.intf( 'Carlo-eth0' ).setMAC( 'cc:cc:cc:cc:cc:cc' )
        
        # Set interface MAC address for switches (NOTE: IP
        # addresses are not assigned to switch interfaces)
        '''
        R1 = net.get( 'R1' )
        R1.intf( 'R1-eth1' ).setMAC( '0A:0A:0A:0A:0A:0A' )
        R1.intf( 'R1-eth2' ).setMAC( '0A:0B:0A:0B:0A:0B' )
        R1.intf( 'R1-eth3' ).setMAC( '0A:0C:0A:0C:0A:0C' )

        R2 = net.get( 'R2' )
        R2.intf( 'R2-eth1' ).setMAC( '1B:1B:1B:1B:1B:1B' )
        R2.intf( 'R2-eth2' ).setMAC( '0B:0A:0B:0A:0B:0A' )
        R2.intf( 'R2-eth3' ).setMAC( '0B:0C:0B:0C:0B:0C' )

        R3 = net.get( 'R3' )
        R3.intf( 'R3-eth1' ).setMAC( '0C:0C:0C:0C:0C:0C' )
        R3.intf( 'R3-eth2' ).setMAC( '0C:0A:0C:0A:0C:0A' )
        R3.intf( 'R3-eth3' ).setMAC( '0C:0B:0C:0B:0C:0B' )
        '''
        net.start()

        # Add routing table entries for hosts (NOTE: The gateway
		# IPs 10.0.X.1 are not assigned to switch interfaces)
        Alice.cmd( 'route add default gw 10.1.1.14 dev Alice-eth0' )
        Bob.cmd( 'route add default gw 10.4.4.14 dev Bob-eth0' )
        Carlo.cmd( 'route add default gw 10.6.6.46 dev Carlo-eth0' )


        # Add arp cache entries for hosts
        Alice.cmd( 'arp -s 10.1.1.14 0A:0A:0A:0A:0A:0A -i Alice-eth0' )
        Bob.cmd( 'arp -s 10.4.4.14 1B:1B:1B:1B:1B:1B -i Bob-eth0' )
        Carlo.cmd( 'arp -s 10.6.6.46  0C:0C:0C:0C:0C:0C -i Carlo-eth0' )

        # Open Mininet Command Line Interface
        CLI(net)

        # Teardown and cleanup
        net.stop()

if __name__ == '__main__':
    setLogLevel('info')
    run()
