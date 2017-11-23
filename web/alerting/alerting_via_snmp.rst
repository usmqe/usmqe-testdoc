Alerting via SNMP
*****************

:author: mbukatov@redhat.com

Description
===========

Besides notifications shown in the UI, we need to check that the same
notifications are send via `SNMP`_ protocol.

Note that **Tendrl SNMP implementation is concerned with alterting via SNMPv3
traps only**, any other SNMP use cases are not supported.

Setup
=====

#. You need gluster volume, details differ based on particular test case.
#. Enable SNMP notifications via `test_setup.snmp.yml`_ playbook from
   ``usmqe-setup`` repo.

Test Steps
==========

.. test_action::
   :step:
       First of all, verify that setup of SNMPv3 notification was successful.

       On the Tendrl Server machine, try to send simple SNMPv3 trap
       message to the client:

       .. code-block:: console

           [root@usm1-server ~]# snmptrap -v 3 -a MD5 -A sL0pdokt4Y6FXc5XXp5KS0wuj6cWZPAEYfPv9z5NGH4= -x DES -X jHaJ6V2523gu1PfNu0FGa44lkx2yVOznaCpbbQDBew4= -l authPriv -u tendrlTrapUser -e 0x8000000001020304 10.37.169.25 0 linkUp.0

       Where ``10.37.169.25`` is ip address of the client machine, replace it
       with proper value.
       Also note that ``snmptrap`` is provided in ``net-snmp-utils`` package.

   :result:
       On the client machine (the one of ``usm_client`` role), start monitoring
       of ``snmptrapd`` logs. You should be able to see the message you just
       sent there:

       .. code-block:: console

           [root@usm1-client ~]# journalctl -u snmptrapd -fe
           Nov 14 03:47:12 usm1-client.example.com systemd[1]: Started Simple Network Management Protocol (SNMP) Trap Daemon..
           Nov 14 04:13:36 usm1-client.example.com snmptrapd[12122]: 2017-11-14 04:13:36 usm1-server.example.com [UDP: [10.37.169.90]:36197->[10.37.169.25]:162]:
                                                                                               DISMAN-EVENT-MIB::sysUpTimeInstance = Timeticks: (0) 0:00:00.00        SNMPv2-MIB::snmpTrapOID.0 = OID: IF-MIB::linkUp.0


.. test_action::
   :step:
       Perform all alerting test cases, while monitoring ``snmptrapd`` logs on
       the client machine.
   :result:
       On the client machine, you should be able to see all notifications
       Tendrl is sending as SNMPv3 trap messages.

       In case of Status and utilization alerts for which a clearing alert
       exists, snmp trap should be send repeatedly untill the clearing alert
       is generated.

       .. code-block:: console

           [root@usm1-client ~]# journalctl -u snmptrapd -fe

Teardown
========

#. Disable SNMP notifications via `test_teardown.snmp.yml`_ playbook from
   ``usmqe-setup`` repo.
