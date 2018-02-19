Context switcher
****************

:authors: 
          - fbalak@redhat.com

Description
===========

Change context of tendrl UI - show items in UI related to selected cluster.
Context switcher is the dropdown menu rendered in masthead for each page
except ``Clusters`` in UI.

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
       Click on the name of first imported cluster in the cluster list.
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
       | Click on ``Context switcher`` menu and select different cluster.
       | Repeat with all clusters.
   :result:
       Current page is rendered again with hosts for currently selected
       cluster.

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
       Click on ``Context switcher`` menu and select different cluster.
   :result:
       Current page is redirected to ``Hosts`` page for given cluster.

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
       | Click on ``Context switcher`` menu and select different cluster.
       | Repeat with all clusters.
   :result:
       Current page is redirected to ``Hosts`` page for given cluster.

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
       Click on ``Context switcher`` menu and select different cluster.
   :result:
       Current page is redirected to ``Hosts`` page for given cluster.

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
       | Click on ``Context switcher`` menu and select different cluster.
       | Repeat with all clusters.
   :result:
       Current page is redirected to ``Hosts`` page for given cluster.

.. test_action::
   :step:
       Click on ``Events`` button in left panel.
   :result:
       List of events page is shown.

.. test_action::
   :step:
       Check that all events from cluster that is currently selected are presen
       t in list of events.
   :result:
       All events are listed and no event is missing or is extra.

.. test_action::
   :step:
       | Click on ``Context switcher`` menu and select different cluster.
       | 
       | Repeat with all clusters.
   :result:
       Current page is redirected to ``Hosts`` page for given cluster.

Teardown
========
#. Log out

#. Close browser
