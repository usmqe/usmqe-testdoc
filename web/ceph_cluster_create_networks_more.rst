Create Ceph cluster with more than 2 networks
**********************************************

:authors:
          - dahorak@redhat.com
          - mkudlej@redhat.com

Description
===========

Create cluster (accordingly to *Create Ceph cluster* testcase) with specific network configuration:
use more than 2 separated networks and allocate one as *Cluster Network*, one another as *Access Network*.

See also:

    - :RHBZ:`1360643` [UI] Skyring doesn't properly configure more networks

Setup
=====

Configure all storage nodes to use more than 2 separated networks.

For configuration of second and third network use following ansible commands (it apply only when the additional networks have configured DHCP server):
::

    ansible -i inventory.hosts ceph_osd -m shell -a 'nmcli connection add ifname eth1 type ethernet'
    ansible -i inventory.hosts ceph_osd -m shell -a 'nmcli connection add ifname eth2 type ethernet'

And then check the configuration:
::

    ansible -i inventory.hosts usm_nodes -m shell -a 'ip addr'

All interfaces (eth0, eth1 and eth2) should have IPv4 address.

Test Steps
==========

.. test_step:: 1

    Follow test steps from *Create Ceph cluster* testcase and allocate the available networks between *Cluster Network* and *Access Network* (one for each).

.. test_result:: 1

    Follow test results from *Create Ceph cluster* testcase.

.. test_step:: 2

    Check ``/etc/ceph/<CLUSTERNAME>.conf`` configuratin file on all Ceph nodes.

.. test_result:: 2

    Check, that *Cluster Network* (``cluster_network``) and *Access Network* (``public_network``) are properly configured.

Teardown
========


