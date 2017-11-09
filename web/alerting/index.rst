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

Upstream information related to alerting:

* `Gluster Events APIs`_
* https://github.com/Tendrl/node-agent/issues/665
* https://github.com/Tendrl/specifications/issues/185
* https://github.com/Tendrl/ui/issues/663
* `Description of Gluster Native Events handling in Tendrl`_
* `Alert Types supported in Tendrl`_

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
.. _`Gluster Events APIs`: http://docs.gluster.org/en/latest/Administrator%20Guide/Events%20APIs/
.. _`Description of Gluster Native Events handling in Tendrl`: https://docs.google.com/document/d/1GFZyq3V-xBqMfAO_1Akjr-NORGwqLJOQSFkDc7WtMR8
.. _`Alert Types supported in Tendrl`: https://docs.google.com/document/d/1vUHep-jc2oSg7bJ2oU57DcC8JiZ33ofqPLBZ9A5pPt8
