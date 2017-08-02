Tendrl server services control test
************************************

:author: - mbukatov@redhat.com
         - mkudlej@redhat.com
:caseposneg: positive

Description
===========

Check that Tendrl services on server can be properly managed via systemd, this
test checks basic use cases for:

* start
* stop
* restart
* reload

There are other actions (such as ``try-restart``, ...) which we don't check so
far.

Setup
=====

Follow :doc:`/setup/install_default` to install Tendrl. No particular
cluster configuration is required for this test case, so we use the default
one.

All test steps are performed on the master server, where the Tendrl services 
is running.

Test Steps
==========

.. test_action::
   :step:
       Check status of the service::

           # systemctl status tendrl-performance-monitoring
           # systemctl status tendrp-apid
   :result:
       Status of the services are shown. Based on the setup section, services
       are expected to be both *running* and *enabled*.

.. test_action::
   :step:
       Stop the services::

           # systemctl stop tendrl-performance-monitoring
           # systemctl stop tendrl-apid
   :result:
       Services are stopped. Verify by::

           # systemctl status tendrl-performance-monitoring
           # systemctl is-active tendrl-performance-monitoring
           # systemctl status tendrl-apid
           # systemctl is-active tendrl-apid

.. test_action::
   :step:
       Start the services again::

           # systemctl start tendrl-performance-monitoring
           # systemctl start tendrl-apid
   :result:
       Services are running. Verify by::

           # systemctl status tendrl-performance-monitoring
           # systemctl status tendrl-apid
           # systemctl is-active tendrl-performance-monitoring
           # systemctl is-active tendrl-apid

.. test_action::
   :step:
       Restart services (from the running state)::

           # systemctl restart tendrl-performance-monitoring
           # systemctl restart tendrl-apid
   :result:
       Services have been restarted and are running now. Verify by::

           # systemctl status tendrl-performance-monitoring
           # systemctl status tendrl-apid
           # systemctl is-active tendrl-performance-monitoring
           # systemctl is-active tendrl-apid

       Check that `Active since` date has been updated.

.. test_action::
   :step:
       Stop services (again)::

           # systemctl stop tendrl-performance-monitoring
           # systemctl stop tendrl-apid
   :result:
       Services are stopped. Verify by::

           # systemctl status tendrl-performance-monitoring
           # systemctl status tendrl-apid
           # systemctl is-active tendrl-performance-monitoring
           # systemctl is-active tendrl-apid

.. test_action::
   :step:
       Restart services (from the stopped state)::

           # systemctl restart tendrl-performance-monitoring
           # systemctl restart tendrl-apid
   :result:
       Services have been restarted and are running now. Verify by::

           # systemctl status tendrl-performance-monitoring
           # systemctl status tendrl-apid
           # systemctl is-active tendrl-performance-monitoring
           # systemctl is-active tendrl-apid

       Check that `Active since` date has been updated.

.. test_action::
   :step:
       Reload configuration of services::

           # systemctl reload tendrl-performance-monitoring
           # systemctl reload tendrl-apid
   :result:
       Commands return zero return code and tendrl-apid and tendrl-performance-monitoring
       configurations have been reloaded. Check that configuration files have been accessed::

           # find /etc/tendrl/ -type f | xargs stat | grep '^Access: 2'

       All config files have a new (recent, silimar to each other) access
       timestamp.

Teardown
========

Teardown is not needed.
