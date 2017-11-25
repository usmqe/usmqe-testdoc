Utilization Alerts Related to Gluster
*************************************

:author:
        - mbukatov@redhat.com
        - fbalak@redhat.com

Description
===========

Alerts covered in this test case:

* volume utilization (volume, cluster)
* brick utilization (volume, cluster)

Based on:

* `List of Alerts and Notifications in Tendrl`_

Setup
=====

#. You need a gluster volume.
#. Mount volume on a client machine.

Test Steps
==========

.. test_action::
   :step:
        Try to fill volume:
        ``for i in {1..N-1}; do dd if=/dev/zero of=/[MOUNT]/testfile$i bs=1G count=1; done``
        where ``N`` is capacity in GiB and ``[MOUNT]`` is directory with
        mounted volume.

        While ``dd`` process is filling the volume, monitor changes:

        * for volume: ``gluster volume status [VOLUME] detail``
        * for particular brick:
          ``gluster volume status [VOLUME] [HOST]:/[BRICK] detail``

        where:

        * ``[VOLUME]`` is name of volume,
        * ``[HOST]`` is monitored machine,
        * ``[BRICK]`` is brick path.
   :result:
        When the volume is filled by 75%, the threshold is breached and
        Tendrl should sent alert about this.

        When the brick is filled by 75%, the threshold is breached and
        Tendrl should sent alert about this.

.. test_action::
   :step:
        Clear files in mounted volume with ``rm`` command on client machine.
        Monitor changes in volume with:
        ``gluster volume status [VOLUME] detail``
        where ``[VOLUME]`` is name of volume.

        While removing files from volume, monitor changes in bricks with:
        ``gluster volume status [VOLUME] detail``
        where ``[VOLUME]`` is name of volume.

        or for concrete brick:
        ``gluster volume status [VOLUME] [HOST]:/[BRICK] detail``
        where:

        * ``[VOLUME]`` is name of volume, 
        * ``[HOST]`` is monitored machine,
        * ``[BRICK]`` is brick path.
   :result:
        When the volume is cleared under 75%, the threshold is breached.
        Tendrl should sent alerts about this.

        When the brick is cleared under 75%, the threshold is breached.
        Tendrl should sent alerts about this.


Teardown
========

#. Remove files you created on gluster volume(s) during testing.
