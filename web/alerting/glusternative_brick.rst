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
   :result:
       Tendrl sends an alert for "Brick path resolution failed for brick"
       (``BRICKPATH_RESOLVE_FAILED``).

.. test_action::
   :step:
       TODO: figure out how to invoke ``POSIX_HEALTH_CHECK_FAILED`` event:

       * According to :rhbz:`1397681`, it has something to do with crashing
         a brick filesystem,
       * RHG3-12336 states: Unmount the brick forcefully (not sure how one
         can do that either).
   :result:
       Tendrl sends an alert for "Posix health check failed for brick"
       (``POSIX_HEALTH_CHECK_FAILED``).

Teardown
========

#. Make sure all machines and volume used during testing are up again.
