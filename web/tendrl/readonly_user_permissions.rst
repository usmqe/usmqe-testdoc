Read-Only user permissions
**************************

:authors:
          - ltrilety@redhat.com

Description
===========

**UNDER CONSTRUCTION - NEED UPDATE**

Check that all features what should be available really are and vice versa.

Setup
=====

#. Log as Read-Only user

Test Steps
==========

.. test_action::
    :step:
        Look at UI landing page.
    :result:
        There should be available links to:

        * 'Clusters' list
        * 'Hosts' list
        * 'Alerts' list
        * 'Notifications'
        * 'Tasks' list

        Verify that 'Users' list/menu is not available.
        User should be able to change its password.

.. test_action::
    :step:
        Open Hosts list.
    :result:
        Filter and order fields should be available and working.

.. test_action::
    :step:
        Open Alerts list
    :result:
        Filter and order fields should be available and working.

.. test_action::
    :step:
        Open Notifications list
    :result:
        Filter and order fields should be available and working.

.. test_action::
    :step:
        Open Tasks list
    :result:
        Filter and order fields should be available and working.
        It should be possible to open task details.

.. test_action::
    :step:
        Open Clusters list page
    :result:
        Filter and order fields should be available and working.
        There should be functional link to Grafana for imported clusters.
        It should not be possible to import cluster.
        It should not be allowed to enable or disable volume profiling.

.. test_action::
    :step:
        Choose some cluster
    :result:
        There should be cluster Hosts list, Bricks list, Volumes list,
        Configuration, Events list and Tasks list available.

.. test_action::
    :step:
        Open cluster hosts list
    :result:
        Filter and order fields should be available and working.
        There should be functional link to Grafana global and for any host.

.. test_action::
    :step:
        Open cluster volumes list
    :result:
        Filter and order fields should be available and working.
        There should be functional link to Grafana global and for any volume.
        It should not be allowed to enable or disable volume profiling.
        It should be possible to open volume details.

.. test_action::
    :step:
        Open cluster bricks list
    :result:
        Filter and order fields should be available and working.
        There should be functional link to Grafana.


.. test_action::
    :step:
        Open cluster configuration
    :result:
        There should be listed all configuration details.


.. test_action::
    :step:
        Open cluster events list
    :result:
        Filter and order fields should be available and working.
        It should be possible to open event details.

.. test_action::
    :step:
        Open cluster tasks list
    :result:
        Filter and order fields should be available and working.
        It should be possible to open task details.

Teardown
========

#. Log out

#. Close browser
