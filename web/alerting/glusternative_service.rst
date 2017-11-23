Gluster Native Alerting for Services
************************************

:author: mbukatov@redhat.com

Description
===========

Alerts covered in this test case:

* Scv reconfigure failed for service (``SVC_RECONFIGURE_FAILED``)

Based on:

* `List of Alerts and Notifications in Tendrl`_
* `Gluster Events APIs`_
* RHG3-12335

Setup
=====

#. You need a gluster volume.

Test Steps
==========

.. test_action::
   :step:
       Manage or try to reconfigure a service, in those conditions that it
       fails.

       TODO: reproducer based on RHG3-12335, figure out details
   :result:
       Moreover Tendrl sends an alert for "Scv reconfigure failed for service"
       (``SVC_RECONFIGURE_FAILED``).

Teardown
========

#. Make sure all machines and volumes used during testing are up again.
