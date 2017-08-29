Elementary checks of tendrl-apid service
*****************************************

:author: - mbukatov@redhat.com
         - mkudlej@redhat.com

Description
===========

Elementary check of tendrl-apid systemd service unit file. This test case
doesn't change any state in any way.

Checks are based on:

* fedora `systemd packaging policy`_
* systemd upstream `daemon(7)`_ manpage

Setup
=====

Follow TODO to install Tendrl. No particular
cluster configuration is required for this test case, so we use the default
one.

All test steps are performed on the api server, where the ``tendrl-apid`` and
``tendrl-performance-monitoring`` service are running.

Test Steps
==========

.. test_action::
   :step:
       Check that the tendrl-apid systemd service file is available:

       .. code-block:: bash

           # rpm -qa | grep tendrl | xargs rpm -ql | grep systemd
   :result:
       Tendrl systemd service files are shown in the output, like this::

           /usr/lib/systemd/system/tendrl-performance-monitoring.service
           /usr/lib/systemd/system/tendrl-apid.service

       Note: we don't expect any other systemd unit files here now. When other
       systemd units are added, we need to update this test case to do the
       initial validation of these files as well.

.. test_action::
   :step:
       Run the following commands on the tendrl service files:

       .. code-block:: bash

           # systemd-analyze verify /usr/lib/systemd/system/tendrl-performance-monitoring.service
           # systemd-analyze verify /usr/lib/systemd/system/tendrl-apid.service
   :result:
       Commands produce no output and return zero.

.. test_action::
   :step:
       Show the content of tendrl systemd unit files:

       .. code-block:: bash

           # systemctl cat tendrl-performance-monitoring.service
           # systemctl cat tendrl-apid.service
   :result:
       The content of the service unit files are shown and they contain:

       * A good human-readable description string with ``Description=``.
       * Reference to documentation/manpage is available in ``Documentation=``
         and this manpage is availabe on the system.
       * There is an ``[Install]`` section including installation information
         for the unit file which contains ``WantedBy=multi-user.target``.

       Based on suggestions from `daemon(7)`_ manpage and `systemd packaging
       policy`_.

.. test_action::
   :step:
       List dependencies of the services:

       .. code-block:: bash

           # systemctl list-dependencies tendrl-performance-monitoring
           # systemctl list-dependencies tendrl-apid
   :result:
       Dependency tree is shown.

.. test_action::
   :step:
       Check status of the service:

       .. code-block:: bash

           # systemctl status tendrl-performance-monitoring
           # systemctl status tendrl-apid
   :result:
       Status is shown, systemctl returns zero return code.

Teardown
========

Teardown is not needed.
