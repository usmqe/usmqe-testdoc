Multiuser - Create two clusters
********************************

:author: 
          - mkudlej@redhat.com
          - dahorak@redhat.com

Description
===========

**UNDER CONSTRUCTION - NEED UPDATE**

Simultaneously create two clusters.

Setup
=====

#. Prepare environment as described in :doc:`/web/multiuser_initial_setup`.

#. There are available Tendrl nodes which can be used for creating clusters

Test Steps
==========

.. test_step:: 1

    In both browsers click on ``Clusters`` in left menu

.. test_result:: 1

    In both browsers page with list of clusters is open.

.. test_step:: 2

    In both browsers click on ``Create`` button.

.. test_result:: 2

    In both browsers Wizzard for creating cluster is open - Configure Cluster subpage.

.. test_step:: 3

    In both browsers input differen cluster name and click ``Next``
 
.. test_result:: 3

    In both browsers Select Hosts subpage is open.

.. test_step:: 4

    In both browsers select desired number of nodes different for both clusters.

.. test_result:: 4

    In both browsers desired number of nodes are selected.

.. test_step:: 5

    In both browsers select desired number of nodes as ``Monitor`` by clicking on ``TV like icon``

.. test_result:: 5

    In both browsers ``TV like icon`` changes its colour into more dark one

.. test_step:: 6

    In both browsers click ``Next`` button

.. test_result:: 6

    In both browsers Choose Networks subpage is open.

.. test_step:: 7

    In both browsers click ``Next`` button

.. test_result:: 7

    In both browsers Provision storage subpage is open.

.. test_step:: 8

    In both browsers click ``Next`` button

.. test_result:: 8

    Review summary subpage is open.

.. test_step:: 9

    In both browsers check if all information on page was input during wizard.
    Check also its correctness.

.. test_result:: 9

    In both browsers all information is the same as input during wizard.
    There is no less or no more information as was input during wizard.

.. test_step:: 10

    In both browsers simultaneously click ``Create Cluster`` button.

.. test_result:: 10

    In both browsers message about creating cluster appears.

.. test_step:: 11

    In both browsers click ``Close`` button.

.. test_result:: 11

    In both browsers message closes.

.. test_step:: 12

    In both browsers check task list.

.. test_result:: 12

    In both browsers cluster creation tasks should appear in taks list.

Teardown
========

#. Remove cluster

#. Log out

#. Close browser
