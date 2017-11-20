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

Setup
=====

#. You need a gluster volume.

Test Steps
==========

.. test_action::
   :step:
       TODO: figure out how to invoke ``BRICKPATH_RESOLVE_FAILED`` event,
       according to :rhbz:`1397430`, it's related to *glusterd failing to
       restore bricks*
   :result:

.. test_action::
   :step:
       TODO: figure out how to invoke ``POSIX_HEALTH_CHECK_FAILED`` event,
       according to :rhbz:`1397681`, it has something to do with crashing
       a brick filesystem
   :result:

Teardown
========

#. Make sure all machines and volume used during testing are up again.
