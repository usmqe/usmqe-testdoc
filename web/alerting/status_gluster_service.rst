Status of Gluster Service
*************************

:author: mbukatov@redhat.com

         ltrilety@redhat.com

Description
===========

Alerts covered in this test case:

* svc connected (cluster)
* svc disconnected (cluster)

Based on:

* `List of Alerts and Notifications in Tendrl`_

Setup
=====

#. You need a gluster trusted pool.

Test Steps
==========

.. test_action::
    :step:
        On some of gluster nodes stop *glusterd* service

        .. code-block:: console

            # systemctl stop glusterd
    :result:
        A *glusterd* service is stopped. Verify that after some time **Tendrl**
        generates an (warning) alert for this event.

.. test_action::
    :step:
        Start *glusterd* service again

        .. code-block:: console

            # systemctl start glusterd
    :result:
        Service is started. Verify that **Tendrl** generates a clearing (info)
        alert and the previous (warning) one is not displayed on UI anymore.

Teardown
========

#. Make sure all machines and volumes used during testing are up again.
