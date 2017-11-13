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
#. Enable SNMP notifications via ``test_setup.snmp.yml`` playbook from
   ``usmqe-setup`` repo.

Teardown
========

#. Disable SNMP notifications via ``test_teardown.snmp.yml`` playbook from
   ``usmqe-setup`` repo.
