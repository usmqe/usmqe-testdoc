Context switcher
****************

:authors: 
          - fbalak@redhat.com

Description
===========

Change context of tendrl UI - show items in UI related to selected cluster.
Context switcher is the dropdown menu rendered in masthead for each page
except ``Clusters`` in UI. Features and behaviour are described in 
`Design document for Context Selector navigation`_

Setup
=====

#. Prepare multiple Gluster clusters (more than three) with created volumes.

#. Login user into Tendrl, see :doc:`/web/tendrl/login_positive`

#. Import all clusters, see :doc:`/web/tendrl/cluster_import`

Test Steps
==========

.. test_action::
   :step:
       Check that there is no left panel shown after imports.
   :result:
       There is no left panel with menu visible on left side and context
       switcher is set to ``All clusters``.

.. test_action::
   :step:
       Click on the name of first imported cluster in the cluster list rendered
       on ``All clusters`` page. Not from ``Context switcher`` drop down menu.
   :result:
       Page is redirected to ``Hosts`` page and list of hosts is shown.

.. test_action::
   :step:
       Check that all hosts from cluster that is currently selected are present
       in list of hosts.
   :result:
       All hosts are listed and no host is missing or is extra.

.. test_action::
   :step:
       Click on listed hostname.
   :result:
       ``Brick Details`` page is shown.

.. test_action::
   :step:
       Check that correct cluster is still selected.
   :result:
       Correct ``cluster id`` is shown in context switcher.

.. test_action::
   :step:
       Click on ``Volumes`` button in left panel.
   :result:
       List of volumes page is shown.

.. test_action::
   :step:
       Check that all volumes from cluster that is currently selected are 
       present in list of volumes.
   :result:
       All volumes are listed and no volume is missing or is extra.

.. test_action::
   :step:
       Click on listed volume.
   :result:
       ``Brick Details`` page is shown.

.. test_action::
   :step:
       Check that correct cluster is still selected.
   :result:
       Correct ``cluster id`` is shown in context switcher.

.. test_action::
   :step:
       Click on ``Tasks`` button in left panel.
   :result:
       List of tasks page is shown.

.. test_action::
   :step:
       Check that all tasks from cluster that is currently selected are present
       in list of tasks.
   :result:
       All tasks are listed and no task is missing or is extra.

.. test_action::
   :step:
       Click on ``Events`` button in left panel.
   :result:
       List of events page is shown.

.. test_action::
   :step:
       Check that all events from cluster that is currently selected are
       present in list of events.
   :result:
       All events are listed and no event is missing or is extra.

.. test_action::
   :step:
       Click on ``Context switcher`` menu and select ``All clusters`` item.
   :result:
       No cluster is selected and user is redirected on page with list of
       clusters.

.. test_action::
   :step:
       Repeat all previous test actions with all other clusters. Select them
       from list rendered on page that is redirected from previous step. Not
       from ``Context switcher`` drop down menu.
   :result:
       UI behaves as is expected and shows items related to selected context.

.. test_action::
   :step:
       | Click on ``Context switcher`` menu and select different cluster.
       | Repeat with all clusters and from all locations in UI:
       | ``Hosts``, ``Volumes``, ``Tasks`` and ``Events``.
   :result:
       Current page is redirected to ``Hosts`` page for given cluster.

Teardown
========
#. Log out

#. Close browser
