Hosts CPU
*******************************************************************************

:authors:
        - fbalak@redhat.com

Description
===========

Check correct values and layout of CPU Utilization panel.

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
       ``stress --cpu ${N} --vm 1 --vm-bytes ${M}G``
       where N is the number of cpu of particular machine and M is roughly half of the total memory of the machine (in GB).
   :result:
       CPU usage of the machine should be increased and this should be reflected in grafana dashboard.

.. test_action::
   :step:
       Look at CPU Utilization panel. Check for layout miscondunts as inconsistent list of legend items, missing labels for axes and extra or missing lines in line chart. There should be visible values for User, System, Nice and Wait-IO memory.
   :result:
       There should be no misconducts and no errors.

.. test_action::
   :step:
       On monitored machine get information about CPU usage with command:
       ``# top``
       Compute and compare reported values with values currently shown in CPU Utilization chart.
   :result:
       Values gotten from cli should correspond with values shown in Grafana.

Teardown
========

#. Stop ``stress`` command.

#. Log out

#. Close browser

