Hosts network
*******************************************************************************

:authors:
        - fbalak@redhat.com

Description
===========

Check correct values and layout of network related Grafana dashboards.

Setup
=====

#. Login as an admin user into Tendrl (:doc:`/web/tendrl/login_positive`)

#. Mount Gluster volume on some machine. (add record in format ``[HOST]:/[VOLUME] /[MOUNT] glusterfs defaults,_netdev 0 0`` into ``/etc/fstab`` and run command ``mount -a``)

#. Import cluster and open Grafana (:doc:`/web/tendrl/grafana_open`)

#. Click on button with name of the current dashboard (Tendrl-Gluster-at-a-Glance) and select ``Hosts``.


Test Steps
==========

.. test_action::
   :step:
       Create files on mounted volume. This command can be used:
       ``for i in {1..N-1}; do dd if=/dev/zero of=/[MOUNT]/testfile$i bs=1G count=1; done``
       where N is capacity in GiB and [MOUNT] is directory with mounted volume.
   :result:
       Throughput of the machine should be increased and this should be reflected in grafana dashboard.

.. test_action::
   :step:
       Delete a few files directly from monitored brick.
   :result:
       This should create errors for collectd service and these errors should be reflected in Errors Per Second Chart.

.. test_action::
   :step:
       Try to destabilize connection to monitered host by running:
       ``iptables -A INPUT -m statistic --mode random --probability 0.01 -j DROP``
   :result:
       This should cause 1% of packets to be dropped and this should be reflected in Dropped Packets Per Second panel.

.. test_action::
   :step:
       Look at Throughput, Errors Per Second, Dropped Packets Per Second panels. Check for layout miscondunts as inconsistent list of legend items, missing labels for axes and extra lines in line chart.
   :result:
       There should be no misconducts and no errors.

Teardown
========

#. Log out

#. Close browser

