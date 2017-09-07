Multiuser - Positive login
**************************

:authors:
          - ltrilety@redhat.com

Description
===========

**UNDER CONSTRUCTION - NEED UPDATE**

Login as user with 'Admin' role.
Check that all features what should be available really are and vice versa.

Setup
=====


Test Steps
==========

.. test_action::
    :step:
        Log as Admin user
    :result:
        User should be logged on. There should be availalble 'Clusters' list,
          'Hosts' list, 'Alerts' list, 'Notifications' and 'Tasks' list.
        Users list/menu should be available.

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
        It should be possible to import, manage, unmanage and forget cluster.
        It should be possible to enable or disable volume profiling.

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
        It should be possible to enable or disable volume profiling.
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

.. test_action::
    :step:
        Open Users list
    :result:
        Filter fields should be available and working.
        It should be possible to add new user.
        It should be possible to edit any existing user except removing
          admin rights to itself.
        It should be possible to remove any user except itself.

Teardown
========

#. Log out

#. Close browser
