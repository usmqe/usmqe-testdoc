Status of Gluster Automatic File Replicaiton
********************************************

:author: mbukatov@redhat.com

         ltrilety@redhat.com

Description
===========

Alerts covered in this test case:

* AFR quorum met for subvolume (volume, cluster)
* AFR quorum fail for subvolume (volume, cluster)
* AFR subvolume up (volume, cluster)
* AFR subvolume down (volume, cluster)

Based on:

* `List of Alerts and Notifications in Tendrl`_
* AFR stands for `Automatic File Replication`_

Setup
=====

#. You need a gluster arbiter volume.
   (distributed, distributed-replicate) volumes uses AFR translator
   to this categories falls also arbiter - distributed-replicate volume

Test Steps
==========

.. test_action::
    :step:
        List *replica sets* - *subvolumes* of present arbiter volume

        .. code-block:: console

            # gluster volume info
    :result:
        all bricks are printed

.. test_action::
    :step:
        Choose some replica set (subvolume) and stop *glusterd* service
        on machine, where arbiter brick from the subvolume is located.
        Stop the *glusterd* service on the machine where one of the
        subvolume data bricks is located too.

        .. code-block:: console

            # systemctl stop glusterd
    :result:
        A *glusterd* service is stopped on both machines.
        **Tendrl** generates an (warning) alert for this event.

.. test_action::
    :step:
        Kill the *glusterfsd* processes related to the chosen subvolume bricks
        on machines where *glusterd* service is stopped.

        .. code-block:: console

            # ps -eaf " grep glusterfs
            # kill <pid>
    :result:
        Processes killed. Verify that after some time an *afr quorum fail* 
        alert is generated in **Tendrl**

        NOTE: To be sure the alert is hit load some data to the arbiter volume
        empty files could be used

        .. code-block:: console

            # for I in `seq 10`; do touch file_$I; done

.. test_action::
    :step:
        Start *glusterd* service on both machines

        .. code-block:: console

            # systemctl start glusterd
    :result:
        *glusterd* service is started. All brick processes are running again.
        Verify that a *afr quorum met* clearing alert is generated
        in **Tendrl**.
        Verify that the previous (warning) one is not displayed on UI anymore.

.. test_action::
    :step:
        Choose some replica set (subvolume) and stop *glusterd* service
        on all machines, where a brick from the subvolume is located.

        .. code-block:: console

            # systemctl stop glusterd
    :result:
        Service is stopped on all three machines.
        **Tendrl** generates an alert.

.. test_action::
    :step:
        Kill the *glusterfsd* processes related to the chosen subvolume bricks.

        .. code-block:: console

            # ps -eaf " grep glusterfs
            # kill <pid>
    :result:
        Processes killed. Verify that after some time an *afr subvolume down*
        alert is generated in **Tendrl**

.. test_action::
    :step:
      Start *glusterd* service on all gluster machines.

      .. code-block:: console

          # systemctl start glusterd
    :result:
      *glusterd* service is started. All brick processes are running again.
      Verify that a *afr subvolume up* clearing alert is generated
      in **Tendrl**.
      Verify that the previous (warning) one is not displayed on UI anymore.


Teardown
========

#. Make sure all machines and volumes used during testing are up again.
