Gluster Native Alerting for Services
************************************

:author: mbukatov@redhat.com

Description
===========

Alerts covered in this test case:

* Scv reconfigure failed for service

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
       * TODO: figure out how to invoke ``SVC_MANAGER_FAILED`` event
       * TODO: verify that ``SVC_MANAGER_FAILED`` is the right event here
   :result:

Teardown
========

#. Make sure all machines and volumes used during testing are up again.
