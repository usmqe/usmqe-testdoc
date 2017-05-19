Multiuser - Create one Ceph cluster
************************************

:authors: 
          - mkudlej@redhat.com
          - dahorak@redhat.com

Description
===========

**UNDER CONSTRUCTION - NEED UPDATE**

Simultaneously create one cluster from available Tendrl nodes.

Setup
=====

#. Prepare environment as described in :doc:`/web/multiuser_initial_setup`.

#. There are available Tendrl nodes which can be used for creating Ceph cluster

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

    In both browsers input same cluster name and click ``Next``
 
.. test_result:: 3

    In both browsers Select Hosts subpage is open.

.. test_step:: 4

    In both browsers click on ``Select All`` or select desired number of the same nodes.

.. test_result:: 4

    In both browsers all or desired number of nodes are selected.

.. test_step:: 5

    In both browsers click ``Next`` button

.. test_result:: 5

    In both browsers Choose Networks subpage is open.

.. test_step:: 6

    In both browsers click ``Next`` button

.. test_result:: 6

    In both browsers Storage Profiles subpage is open.

.. test_step:: 7

    In both browsers click ``Create Cluster`` button

.. test_result:: 7

    Cluster creation task is open.

.. test_step:: 8

    In both browsers check task list.

.. test_result:: 8

    In both browsers cluster creation task should appear in taks list.

Teardown
========

#. Remove cluster

#. Log out

#. Close browser

Prepare following steps also for different cluster name (with the same nodes.
