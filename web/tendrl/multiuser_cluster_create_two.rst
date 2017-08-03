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
       In both browsers input differen cluster name and click ``Next``
   :result:
       In both browsers Select Hosts subpage is open.

.. test_action::
   :step:
       In both browsers select desired number of nodes different for both clusters.
   :result:
       In both browsers desired number of nodes are selected.

.. test_action::
   :step:
       In both browsers select desired number of nodes as ``Monitor`` by clicking on ``TV like icon``
   :result:
       In both browsers ``TV like icon`` changes its colour into more dark one

.. test_action::
   :step:
       In both browsers click ``Next`` button
   :result:
       In both browsers Choose Networks subpage is open.

.. test_action::
   :step:
       In both browsers click ``Next`` button
   :result:
       In both browsers Provision storage subpage is open.

.. test_action::
   :step:
       In both browsers click ``Next`` button
   :result:
       Review summary subpage is open.

.. test_action::
   :step:
       In both browsers check if all information on page was input during wizard.
       Check also its correctness.
   :result:
       In both browsers all information is the same as input during wizard.
       There is no less or no more information as was input during wizard.

.. test_action::
   :step:
       In both browsers simultaneously click ``Create Cluster`` button.
   :result:
       In both browsers message about creating cluster appears.

.. test_action::
   :step:
       In both browsers click ``Close`` button.
   :result:
       In both browsers message closes.

.. test_action::
   :step:
       In both browsers check task list.
   :result:
       In both browsers cluster creation tasks should appear in taks list.

Teardown
========

#. Remove cluster

#. Log out

#. Close browser
