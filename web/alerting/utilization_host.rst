Utilization Alerts Related to Host
**********************************

:author:
        - mbukatov@redhat.com
        - fbalak@redhat.com

Description
===========

Alerts covered in this test case:

* cpu utilization (host)
* memory utilization (host)
* swap utilization (host)

Based on:

* `List of Alerts and Notifications in Tendrl`_

Setup
=====

#. You need a gluster volume.
#. Install stress tool on all Tendrl Nodes (Storage Servers)
#. Mount volume on a client machine.
#. Run `journalctl -u snmptrapd -fe` on client machine to monitor snmp messages.
#. Open Web Admin UI to monitor alerts in web interface.
#. Ensure that there is set user with enabled notifications and valid email address in UI.

Test Steps
==========

.. test_action::
   :step:
        Try to fill CPU on hosts:
        ``stress --cpu ${N} --vm 1 --vm-bytes ${M}G``
        where N is the number of cpu of particular machine and M is roughly half of the total memory of the machine (in GB).
        This should stress system and user CPU, if not enough then increase M.
        Monitor changes on hosts with:
        ``top``
   :result:
        When the CPU utilization is filled by 80% then the threshold is breached and there should be sent notification.
        Checks for messages in Web Admin UI, SMNP and mail.

.. test_action::
   :step:
        Stop ``stress`` tool from previous test step.
   :result:
        When the CPU utilization is lesser than 80% which is memory utilization threshold then there should be sent notification.
        Checks for messages in Web Admin UI, SMNP and mail.

.. test_action::
   :step:
        Try to fill memory on hosts:
        ``stress --vm 1 --vm-bytes [M]G``
        where M is memory that fills memory and swap of hosts.
        Monitor changes on hosts with:
        ``top``
   :result:
        When the memory utilization is filled by 80% then the threshold is breached and there should be sent notification.
        Checks for messages in Web Admin UI, SMNP and mail.
        When the swap utilization is filled by 50% then the threshold is breached and there should be sent notification.
        Check for messages in Web Admin UI, SMNP and mail.

.. test_action::
   :step:
        Stop ``stress`` tool from previous test step.
   :result:
        When the memory utilization is lesser than 80% which is memory utilization threshold then there should be sent notification.
        Checks for messages in Web Admin UI, SMNP and mail.
        When the swap utilization is lesser than 80% which is swap utilization threshold then there should be sent notification.
        Check for messages in Web Admin UI, SMNP and mail.

Teardown
========

#. Stop and remove stress tool from afected machines.
