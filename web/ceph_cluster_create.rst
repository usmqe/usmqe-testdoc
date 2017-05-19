Create Ceph cluster
*************************************************************************

:authors:
          - mkudlej@redhat.com
          - dahorak@redhat.com
          - ltrilety@redhat.com

.. _`Design document for create Ceph cluster`: https://redhat.invisionapp.com/share/2K8M4PQYZ#/screens/205496801 

Description
===========

Testcase contains also pool creation because it is part of wizard.
During testing `Design document for create Ceph cluster`_ should be considered.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

#. There are available nodes which can be used for creating Ceph cluster

Test Steps
==========

.. test_step:: 1

    Click on ``Clusters`` in left menu

.. test_result:: 1

    Page with list of clusters is open.

.. test_step:: 2

    Click on ``Create`` button.

.. test_result:: 2

    Wizzard for creating cluster is open - Configure Cluster subpage.

.. test_step:: 3

    Input cluster name and click ``Next``

.. test_result:: 3

    Select Hosts subpage is open.

.. test_step:: 4

    Click on ``Select All`` or select desired number of nodes.

.. test_result:: 4

    All or desired number of nodes are selected.

.. test_step:: 5

    Select desired number of nodes as ``Monitor`` by clicking on ``TV like icon``

.. test_result:: 5

    ``TV like icon`` changes its colour into more dark one

.. test_step:: 6

    Click ``Next`` button

.. test_result:: 6

    Choose Networks subpage is open.

.. test_step:: 7

    Click ``Next`` button

.. test_result:: 7

    Provision storage subpage is open.

.. test_step:: 8

    Click ``Add`` button.

.. test_result:: 8

    Form for adding pool is open.

.. test_step:: 9

    Input pool name, number of PGs in form and click on ``Ok`` button.

.. test_result:: 9

    Input pool configuration appears in table below input form.

.. test_step:: 10

    Click ``Next`` button

.. test_result:: 10

    Review summary subpage is open.

.. test_step:: 11

    Check if all information on page was input during wizard.
    Check also its correctness.

.. test_result:: 11

    All information is the same as input during wizard.
    There is no less or no more information as was input during wizard.

.. test_step:: 12

    Click ``Create Cluster`` button.

.. test_result:: 12

    Message about creating cluster appears.

.. test_step:: 13

    Click ``Close`` button.

.. test_result:: 13

    Message closes.

.. test_step:: 14

    open clusters tab

.. test_result:: 14

    Cluster is present in the clusters list with correct status

.. test_step:: 15

    Check task list.

.. test_result:: 15

    Cluster creation task should appear in taks list.

.. test_step:: 16

    wait until task is finished

.. test_result:: 16

    Verify that the cluster is created properly:

    * It is present in clusters list.
    * Has a correct status
    * All nodes are present and ON (they have correct state)
    * Has a correct size
    * ...

Teardown
========

#. Remove Ceph cluster

#. Log out

#. Close browser
