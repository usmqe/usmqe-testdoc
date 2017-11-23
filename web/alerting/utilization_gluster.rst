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
#. Run `journalctl -u snmptrapd -fe` on client machine to monitor snmp messages.
#. Open Web Admin UI to monitor alerts in web interface.
#. Ensure that there is set user with enabled notifications and valid email address in UI.

Test Steps
==========

.. test_action::
   :step:
        Try to fill volume:
        ``for i in {1..N-1}; do dd if=/dev/zero of=/[MOUNT]/testfile$i bs=1G count=1; done``
        where N is capacity in GiB and [MOUNT] is directory with mounted volume.
        Monitor changes in volume with:
        ``gluster volume status [VOLUME] detail``
        where [VOLUME] is name of volume.
   :result:
        When the volume is filled by 75% then the threshold is breached and there should be sent notification.
        Checks for messages in Web Admin UI, SMNP and mail.

.. test_action::
   :step:
        Try to fill bricks on volume:
        ``for i in {1..N-1}; do dd if=/dev/zero of=/[MOUNT]/testfile$i bs=1G count=1; done``
        where N is capacity in GiB and [MOUNT] is directory with mounted volume.
        Monitor changes on bricks with:
        ``gluster volume status [VOLUME] detail``
        or for concrete brick:
        ``gluster volume status [VOLUME] [HOST]:/[BRICK] detail``
        where [VOLUME] is name of volume, [HOST] is monitored machine and [BRICK] is brick path.
   :result:
        When the brick is filled by 75% then the threshold is breached and there should be sent notification.
        Checks for messages in Web Admin UI, SMNP and mail.

.. test_action::
   :step:
        Clear files in mounted volume with ``rm`` command on client machine.
        Monitor changes in volume with:
        ``gluster volume status [VOLUME] detail``
        where [VOLUME] is name of volume.
   :result:
        When the volume is cleared under the threshold 75%, there should be sent notifications about the event.
        Checks for messages in Web Admin UI, SMNP and mail.

.. test_action::
   :step:
        Clear files in mounted volume with ``rm`` command on client machine.
        Monitor changes in bricks with:
        ``gluster volume status [VOLUME] detail``
        where [VOLUME] is name of volume.
        or for concrete brick:
        ``gluster volume status [VOLUME] [HOST]:/[BRICK] detail``
        where [VOLUME] is name of volume, [HOST] is monitored machine and [BRICK] is brick path.
   :result:
        When the brick is cleared under the threshold 75%, there should be sent notifications about the event.
        Checks for messages in Web Admin UI, SMNP and mail.

Teardown
========

#. Remove files you created on gluster volume(s) during testing.
