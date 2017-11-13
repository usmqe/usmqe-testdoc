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

The main upstream documentation related to alerting is:

* `List of Alerts and Notifications in Tendrl`_ from Tendrl wiki
* a description of alerting setup (for both `SNMP`_ and `SMTP`_) during
  `Tendrl Server Installation`_ (search for step `Configure email/snmp source`
  there)

Other upstream information related to alerting:

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

.. _`Tendrl Server Installation`: https://github.com/Tendrl/documentation/wiki/Tendrl-release-v1.5.4-(install-guide)#tendrl-server-installation
