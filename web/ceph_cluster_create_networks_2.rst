Create Ceph cluster with 2 networks
************************************

:authors:
          - dahorak@redhat.com
          - mkudlej@redhat.com

Description
===========

Create cluster (accordingly to *Create Ceph cluster* testcase) with specific network configuration:
use 2 separated networks - first as *Cluster Network*, second as *Access Network*.

See also:

    - :RHBZ:`1360643` [UI] Skyring doesn't properly configure more networks

Setup
=====

Configure all storage nodes to use 2 separated networks - first as *Cluster Network*, second as *Access Network*.

For configuration of second network use following ansible command (it apply only when the additional network have configured DHCP server):
::

    ansible -i inventory.hosts ceph_osd -m shell -a 'nmcli connection add ifname eth1 type ethernet'

And then check the configuration:
::

    ansible -i inventory.hosts usm_nodes -m shell -a 'ip addr'

All interfaces (eth0, eth1 and eth2) should have IPv4 address.

Test Steps
==========

.. test_action::
   :step:
       Follow test steps from *Create Ceph cluster* testcase and chose one network as *Cluster Network* and second as *Access Network*.
   :result:
       Follow test results from *Create Ceph cluster* testcase.
    
.. test_action::
   :step:
       Check ``/etc/ceph/<CLUSTERNAME>.conf`` configuratin file on all Ceph nodes.
   :result:
       Check, that *Cluster Network* (``cluster_network``) and *Access Network* (``public_network``) is properly configured.

Teardown
========

