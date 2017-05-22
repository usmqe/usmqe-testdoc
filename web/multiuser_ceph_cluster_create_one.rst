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

.. test_action::
   :step:
       In both browsers click on ``Clusters`` in left menu
   :result:
       In both browsers page with list of clusters is open.

.. test_action::
   :step:
       In both browsers click on ``Create`` button.
   :result:
       In both browsers Wizzard for creating cluster is open - Configure Cluster subpage.

.. test_action::
   :step:
       In both browsers input same cluster name and click ``Next``
   :result:
       In both browsers Select Hosts subpage is open.

.. test_action::
   :step:
       In both browsers click on ``Select All`` or select desired number of the same nodes.
   :result:
       In both browsers all or desired number of nodes are selected.

.. test_action::
   :step:
       In both browsers click ``Next`` button
   :result:
       In both browsers Choose Networks subpage is open.

.. test_action::
   :step:
       In both browsers click ``Next`` button
   :result:
       In both browsers Storage Profiles subpage is open.

.. test_action::
   :step:
       In both browsers click ``Create Cluster`` button
   :result:
       Cluster creation task is open.

.. test_action::
   :step:
       In both browsers check task list.
   :result:
       In both browsers cluster creation task should appear in taks list.

Teardown
========

#. Remove cluster

#. Log out

#. Close browser

Prepare following steps also for different cluster name (with the same nodes.
