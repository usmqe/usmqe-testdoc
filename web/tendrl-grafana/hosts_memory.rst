Hosts memory
*******************************************************************************

:authors:
        - fbalak@redhat.com

Description
===========

Check correct values and layout of memory related Grafana dashboards.

Setup
=====

#. Login as an admin user into Tendrl (:doc:`/web/tendrl/login_positive`)

#. Import cluster and open Grafana (:doc:`/web/tendrl/grafana_open`)

#. Click on button with name of the current dashboard (Tendrl-Gluster-at-a-Glance) and select ``Hosts``.


Test Steps
==========

.. test_action::
   :step:
       Log into monitored machine via ssh and stress the machine with ``stress`` command. For example:
       ``stress --vm-bytes $(awk '/MemFree/{printf "%d\n", $2 * 2.2;}' < /proc/meminfo)k --vm-keep -m 1``
   :result:
       RAM and CPU usage of the machine should be increased and this should be reflected in grafana dashboards.

.. test_action::
   :step:
       Look at Memory Utilization panel. Check for layout miscondunts as inconsistent list of legend items, missing labels for axes and extra lines in line chart.
   :result:
       There should be no misconducts and no errors.

.. test_action::
   :step:
       On monitored machine get information about memory usage with commands:

       * ``# free``
       * ``# cat /proc/meminfo``

       Compute and compare these values with values currently shown in Memory Utilization chart.
   :result:
       Values gotten from cli should correspond with values shown in Grafana.

.. test_action::
   :step:
       With ``# free`` command check swap utilization. Compare the values from cli with values in Swap Free and Swap Utilization panels. Try to stress machine to use a lot of swap.  Swap should be used at least 80% usage.
   :result:
       Values gotten from cli should correspond with values shown in Grafana. Swap Free should show correctly percentage and the graph should be properly displayed - gauge chart should have correct proportions.

Teardown
========

#. Stop ``stress`` command.

#. Log out

#. Close browser

