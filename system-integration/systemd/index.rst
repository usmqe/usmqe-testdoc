Systemd Integration Tests
=========================

These test cases validates systemd units provided with the product such
as service files.

.. test_defaults::
   :casesubcomponent: systemd

.. toctree::
   :caption: Test Cases
   :maxdepth: 1
   :glob:

   service.tendrl_server.elementary_check.rst
   service.tendrl_server.service_control.rst
   service.tendrl_server.service_control_crash.rst
   service.tendrl_server.service_enable.rst
