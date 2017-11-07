Tendrl Alerting Tests
=====================

System tests of Alerting features, which includes notifications via:

* `SNMP`_ (SNMPv3 traps only)
* `SMTP`_
* Tendrl web UI

Note that **Tendrl SNMP implementation is concerned with alterting via SNMPv3
traps only**, any other SNMP use cases are not supported.

.. I can't link the requirement here, because only downstream one is available.

The only upstream documentation related to alerting is a description of
alterting setup (for both `SNMP`_ and `SMTP`_) during `Tendrl Server
Installation`_ (search for step `Configure email/snmp source` there).

.. test_defaults::
   :casecomponent: web
   :casesubcomponent: alerting

.. toctree::
   :caption: Test Cases
   :maxdepth: 1
   :glob:

   *

.. _`SNMP`: https://en.wikipedia.org/wiki/Simple_Network_Management_Protocol
.. _`SMTP`: https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol
.. _`Tendrl Server Installation`: https://github.com/Tendrl/documentation/wiki/Tendrl-release-v1.5.4-(install-guide)#tendrl-server-installation
