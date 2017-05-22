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

.. test_action::
   :step:
       Click on ``Clusters`` in left menu
   :result:
       Page with list of clusters is open.

.. test_action::
   :step:
       Click on ``Create`` button.
   :result:
       Wizzard for creating cluster is open - Configure Cluster subpage.

.. test_action::
   :step:
       Input cluster name and click ``Next``
   :result:
       Select Hosts subpage is open.

.. test_action::
   :step:
       Click on ``Select All`` or select desired number of nodes.
   :result:
       All or desired number of nodes are selected.

.. test_action::
   :step:
       Select desired number of nodes as ``Monitor`` by clicking on ``TV like icon``
   :result:
       ``TV like icon`` changes its colour into more dark one

.. test_action::
   :step:
       Click ``Next`` button
   :result:
       Choose Networks subpage is open.

.. test_action::
   :step:
       Click ``Next`` button
   :result:
       Provision storage subpage is open.

.. test_action::
   :step:
       Click ``Add`` button.
   :result:
       Form for adding pool is open.

.. test_action::
   :step:
       Input pool name, number of PGs in form and click on ``Ok`` button.
   :result:
       Input pool configuration appears in table below input form.

.. test_action::
   :step:
       Click ``Next`` button
   :result:
       Review summary subpage is open.

.. test_action::
   :step:
       Check if all information on page was input during wizard.
       Check also its correctness.
   :result:
       All information is the same as input during wizard.
       There is no less or no more information as was input during wizard.

.. test_action::
   :step:
       Click ``Create Cluster`` button.
   :result:
       Message about creating cluster appears.

.. test_action::
   :step:
       Click ``Close`` button.
   :result:
       Message closes.

.. test_action::
   :step:
       open clusters tab
   :result:
       Cluster is present in the clusters list with correct status

.. test_action::
   :step:
       Check task list.
   :result:
       Cluster creation task should appear in taks list.

.. test_action::
   :step:
       wait until task is finished
   :result:
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
