Hosts IOPS
*******************************************************************************

:authors:
        - fbalak@redhat.com

Description
===========

Check correct values and layout of IOPS panel.

Setup
=====

#. Login as an admin user into Tendrl (:doc:`/web/tendrl/login_positive`)

#. Import cluster and open Grafana (:doc:`/web/tendrl/grafana_open`)

#. Click on button with name of the current dashboard (Tendrl-Gluster-at-a-Glance) and select ``Hosts``.


Test Steps
==========

.. test_action::
   :step:
       Log into monitored machine via ssh and try to generate I/O operations on mounted volume.

       Useful commands:

       * ``# dd if=/dev/zero of=/mnt/gluster/testfile bs=1G count=1 oflag=direct``
       * ``for i in {1..1000}; do echo "test" > /mnt/gluster/tf$i; done``
       * ``for i in {1..1000}; do cat /mnt/gluster/tf$i > /dev/null; done``

       Mark down time when the operation was held.
   :result:
       I/O operations should be increased on the machine and this should be reflected in IOPS chart on proper timestamp.

.. test_action::
   :step:
       Look at IOPS panel. Check for layout miscondunts as inconsistent list of legend items, missing labels for axes and extra lines in line chart.
   :result:
       There should be no misconducts and no errors.

.. test_action::
   :step:
       Log into monitored machine via ssh and try to generate I/O operations outside from the mounted volume.

       Useful commands:

       * ``# dd if=/dev/zero of=/nogluster/testfile bs=1G count=1 oflag=direct``
       * ``for i in {1..1000}; do echo "test" > /nogluster/tf$i; done``
       * ``for i in {1..1000}; do cat /nogluster/tf$i > /dev/null; done``

       Mark down time when the operation was held.
   :result:
       I/O operations should not be increased on the machine.

Teardown
========

#. Log out

#. Close browser

