Context switcher
****************

:authors: 
          - fbalak@redhat.com

Description
===========

Change context of tendrl UI - show items in UI related to selected cluster. Context switcher is the dropdown menu rendered in masthead for each page except ``Clusters`` in UI.

Setup
=====

#. Prepare multiple Gluster clusters (more than three) with created volumes.

#. Login user into Tendrl, see :doc:`/web/tendrl/login_positive`

#. Import all clusters, see :doc:`/web/tendrl/cluster_import`

Test Steps
==========

.. test_action::
   :step:
       Go to ``Hosts``
   :result:
       List of hosts page is shown.

.. test_action::
   :step:
       Check that all hosts from cluster that is currently selected are present in list of hosts.
   :result:
       All hosts are listed and no host is missing or is extra.

.. test_action::
   :step:
       | Click on ``Context switcher`` menu and select different cluster.
       | Repeat with all clusters.
   :result:
       Current page should be rendered again with hosts for currently selected cluster.

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
       Current page should be redirected to ``Hosts`` page for given cluster.

.. test_action::
   :step:
       Go to ``Volumes``
   :result:
       List of volumes page is shown.

.. test_action::
   :step:
       Check that all volumes from cluster that is currently selected are present in list of volumes.
   :result:
       All volumes are listed and no volume is missing or is extra.

.. test_action::
   :step:
       | Click on ``Context switcher`` menu and select different cluster.
       | Repeat with all clusters.
   :result:
       Current page should be rendered again with volumes for currently selected cluster.

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
       Current page should be redirected to ``Volumes`` page for given cluster.

.. test_action::
   :step:
       Go to ``Tasks``
   :result:
       List of tasks page is shown.

.. test_action::
   :step:
       Check that all tasks from cluster that is currently selected are present in list of tasks.
   :result:
       All tasks are listed and no task is missing or is extra.

.. test_action::
   :step:
       | Click on ``Context switcher`` menu and select different cluster.
       | Repeat with all clusters.
   :result:
       Current page should be rendered again with tasks for currently selected cluster.

.. test_action::
   :step:
       Go to ``Events``
   :result:
       List of events page is shown.

.. test_action::
   :step:
       Check that all events from cluster that is currently selected are present in list of events.
   :result:
       All events are listed and no event is missing or is extra.

.. test_action::
   :step:
       | Click on ``Context switcher`` menu and select different cluster.
       | Repeat with all clusters.
   :result:
       Current page should be rendered again with events for currently selected cluster.

Teardown
========
#. Log out

#. Close browser
