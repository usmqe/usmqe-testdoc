Gluster Native Alerting for Bricks
**********************************

:author: mbukatov@redhat.com

Description
===========

Alerts covered in this test case:

* Brick path resolution failed for brick (``BRICKPATH_RESOLVE_FAILED``)
* Posix health check failed for brick (``POSIX_HEALTH_CHECK_FAILED``)

Based on:

* `List of Alerts and Notifications in Tendrl`_
* `Gluster Events APIs`_
* RHG3-12335 (for ``BRICKPATH_RESOLVE_FAILED``)
* RHG3-12336 (for ``POSIX_HEALTH_CHECK_FAILED``)
* :rhbz:`1397430` (``BRICKPATH_RESOLVE_FAILED`` has been fixed)
* :rhbz:`1397681` (``POSIX_HEALTH_CHECK_FAILED`` has been fixed)

Setup
=====

#. You need a gluster volume.

Test Steps
==========

.. test_action::
   :step:
       TODO: figure out how to invoke ``BRICKPATH_RESOLVE_FAILED`` event:

       * According to :rhbz:`1397430`, it's related to *glusterd failing to
         restore bricks*.
       * Atin provided additional info:
         You can simulate this by changing the info file of a particular brick
         (file from ``/var/lib/glusterd/vols/VOLNAME/bricks/`` directory)
         with a different IP (which is not there in trusted storage pool) and
         restarting glusterd service on the same node.
   :result:
       Tendrl sends an alert for "Brick path resolution failed for brick"
       (``BRICKPATH_RESOLVE_FAILED``).

.. test_action::
   :step:
       On one storage node, locate all brick mount points, pick one and
       run lazy unmount on it, eg:

       .. code-block:: console

            [root@usm1-gl1 ~]# umount -l /mnt/brick_VOLNAME_1
   :result:
       The brick mountpoint has been unmounted no matter that there was
       some gluster process accesing data there.

       Moreover Tendrl sends an alert for "Posix health check failed for brick"
       (``POSIX_HEALTH_CHECK_FAILED``).

.. test_action::
   :step:
       Perform additional check for previous test step. This is necessary only
       to figure out where to file BZ when the previous test step failes.

       Grep for the health check event on the machine where you just unmounted
       the brick:

       .. code-block:: console

           [root@usm1-gl1 ~]# grep POSIX_HEALTH_CHECK_FAILED /var/log/glusterfs/events.log
   :result:
       You should see the event along with information about pushing it to
       listeners there.

       If you don't see the event there, it's a bug on GlusterFS side.
       If you see the event there and you havent seen Tendrl alert when
       checking presious test step, it's a bug on Tendrl side.

Teardown
========

#. Make sure all machines and volume used during testing are up again.
