Shrink Ceph cluster
*******************************

:authors: 
          - ltrilety@redhat.com
          - mkudlej@redhat.com

Description
===========

As an Admin, I want to be able to resize the overall cluster as desired by reducing the overall node count,
so I can add new HW (within improved capabilities, storage densities, etc. - swap 1 shiny new box for
2 crusty old boxes), or otherwise decommission / reprovision a node in the current cluster

Setup
=====
#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl UI, see :doc:`/web/login_positive`

#. Create Ceph cluster named Alpha

#. Create some pools/storages in cluster Alpha.

#. Create some data on the pools in cluster Alpha.

Test Steps
==========

.. test_step:: 1

    Find an option for shrink cluster created in set-up - remove node

.. test_result:: 1

    The option is available

.. test_step:: 2

    Choose some OSD node which is not part of any pool and follow required steps for node removal

.. test_result:: 2

    Verify that the node status is changed properly (to some state informing about the node removal)
    if it's not the last OSD node in cluster.
    If it is the last OSD node verify that the remove operation fails with some proper error message.

.. test_step:: 3

    wait until the node is removed

.. test_result:: 3

    Verify that the node is completely removed from the cluster.
    Verify that cluster size is reduced properly.
    Verify that storage profiles sizes are reduced properly.

.. test_step:: 4

    Choose some Monitor node and follow required steps for node removal

.. test_result:: 4

    Verify that firt the node status is changed properly and then it is removed from the cluster,
    if it's not the last Monitor node in cluster.
    If it is the last MON node verify that the remove operation fails with some proper error message.

.. test_step:: 5

    Choose some node with both Monitor and OSD role which is not part of any pool
    and follow required steps for node removal

.. test_result:: 5

    Verify that first the node status is changed properly (to some state informing about the node removal)
    and then it is removed from the cluster, if it's not the last Monitor or OSD node in cluster.
    If it is the last with MON or OSD role verify that the remove operation fails
    with some proper error message.
    Verify that cluster size is reduced properly.
    Verify that storage profiles sizes are reduced properly.

.. test_step:: 6

    If possible try to remove several nodes which are not part of any pool simultaneously

.. test_result:: 6

    Verify that first statuses of nodes are changed correcly and then they are removed from the cluster,
    if they are not the last Monitor or OSD nodes in cluster.
    Verify that cluster size is reduced properly.
    Verify that storage profiles sizes are reduced properly.
    If they are the last ones with some role (OSD or MON) verify the error message.
    Also verify that the operation is canceled correctly, there are two possiblities:

    * all nodes remain in cluster
    * the last one which has the required role remain in cluster

.. test_step:: 7

    Choose some OSD node which is part of some pool and follow required steps for node removal

.. test_result:: 7

    Verify that the node status is changed properly (to some state informing about the node removal)
    if it's not the last OSD node in cluster or pool.
    If it is the last OSD node verify that the remove operation fails with some proper error message.
    Verify that some rebalance/move data operations started.
    If there is not enough space on remaining nodes it should print some error message or
    tell that to user and let him/her decide if he/she wants to continue.

.. test_step:: 8

    wait until the node is removed

.. test_result:: 8

    Verify that the node is completely removed from the cluster and from the pool.
    Verify that cluster size is reduced properly.
    Verify that storage profiles sizes are reduced properly.
    Verify that pool size is reduced properly.
    Verify that all data are still available on the pool.

.. test_step:: 9

    If possible try to remove several nodes simultaneously.
    Some of them or all of them are part of some pools.

.. test_result:: 9

    Verify that first statuses of nodes are changed correcly.
    Verify that some operation for transfer/rebalance data is started.
    If there is not enough space on remaining nodes for some pool UI should print some error message
    and fails the operation or tell that to user and let him/her decide if he/she wants to continue.
    Verify that later they are removed from the cluster and related pools,
    if they are not the last Monitor on cluster or OSD in cluster or some pool.
    Verify that cluster size is reduced properly.
    Verify that storage profiles sizes are reduced properly.
    Verify that pools sizes are reduced properly.
    Verify that all data are still available on all related pools.
    If they are the last ones with some role (OSD or MON) verify the error message.
    Also verify that the operation is canceled correctly, there are two possiblities:

    * all nodes remain in cluster
    * the last one which has the required role remain in cluster

Teardown
========
#. Log out

#. Close browser
