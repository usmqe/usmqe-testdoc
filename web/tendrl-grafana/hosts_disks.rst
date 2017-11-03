Hosts disks
*******************************************************************************

:authors:
        - fbalak@redhat.com

Description
===========

Check correct values and layout of capacity and disk IO related Grafana dashboards.

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
       Monitor changes with:
       ``gluster volume status [VOLUME] [HOST]:/[BRICK] detail``
       where [VOLUME] is name of volume, [HOST] is monitored machine and [BRICK] is brick path.
   :result:
       Panels Brick Utilization, Brick Capacity, Brick Capacity Used, Disk Load, Disk Operation and Disk IO should reflect the changes of capacity and number of disk operations.

.. test_action::
   :step:
       Look at Disk Load, Disk Operation and Disk IO panels. Check for layout miscondunts as inconsistent list of legend items, missing labels for axes and extra lines in line chart.
   :result:
       There should be no misconducts and no errors.

Teardown
========

#. Log out

#. Close browser

