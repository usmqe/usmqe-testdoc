Tendrl Alerting Tests
=====================

System tests of Alerting features, which includes notifications via:

* `SNMP`_ (SNMPv3 traps only)
* `SMTP`_
* Tendrl web UI

Tendrl supports these 3 alert types:

* **Status alerts**: change of status as detected by Tendrl during periodic
  sync
* **Utilization alerts**: sent when a value crossess predefined treshold, comes
  from Grafana
* **Gluster native events**: `Gluster Events APIs`_ notifications which comes
  from ``glustereventsd`` daemon, Tendrl just is resending a subset of
  them, while others are used for internal purposes and are not resend
  (see `Description of Gluster Native Events handling in Tendrl`_ )

Note that **Tendrl SNMP implementation is concerned with alterting via SNMPv3
traps only**, any other SNMP use cases are not supported.

The main upstream documentation related to alerting is:

* `List of Alerts and Notifications in Tendrl`_ from Tendrl wiki
* a description of alerting setup (for both `SNMP`_ and `SMTP`_) during
  `Tendrl Server Installation`_ (search for step `Configure email/snmp source`
  there)

Other upstream information related to alerting:

* `Description of Gluster Native Events handling in Tendrl`_ (more details
  about handling of Gluster events in Tendrl)
* `Gluster Events APIs`_ (see full list of Gluster events there)
* https://github.com/Tendrl/node-agent/issues/665 (alert lifecycle
  documentation is missing)
* https://github.com/Tendrl/specifications/issues/185 (specification for SNMP
  alerting implementation)
* https://github.com/Tendrl/ui/issues/663 (alerts vs notifications in Tednrl
  UI)

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
.. _`List of Alerts and Notifications in Tendrl`: https://github.com/Tendrl/documentation/wiki/List-of-Alerts-and-Notifications-in-Tendrl
