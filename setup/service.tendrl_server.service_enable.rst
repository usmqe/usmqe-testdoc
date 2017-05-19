Tendrl server services enable/disable test
*******************************************

:author: - mbukatov@redhat.com
         - mkudlej@redhat.com
:caseposneg: positive

Description
===========

Check that Tendrl services can be properly enabled and disabled.

Setup
=====

Follow :doc:`/setup/install_default` to install Tendrl. No particular
cluster configuration is required for this test case, so we use the default
one.

All test steps are performed on the master server, where the Tendrl service
is running.

Test Steps
==========

.. test_step:: 1

    Enable Tendrl services::

        # systemctl enable tendrl-performance-monitoring
        # systemctl enable tendrl-apid

.. test_result:: 1

    Check that services has been enabled::

        # systemctl is-enabled tendrl-performance-monitoring
        # systemctl is-enabled tendrl-apid

    Moreover this are also visible in the status::

        # systemctl status tendrl-performance-monitoring
        # systemctl status tendrl-apid

.. test_step:: 2

    Reboot the machine::

        # shutdown -r now

    And then wait for the machine to boot again.

.. test_result:: 2

    The machine is rebooted without any errors.

    After the machine is up again, check Tendrl services::

        # systemctl status tendrl-performance-monitoring
        # systemctl status tendrl-apid

    Services are running. There are no errors in any Tendrl log.

.. test_step:: 3

    Disable Tendrl services::

        # systemctl disable tendrl-performance-monitoring
        # systemctl disable tendrl-apid

.. test_result:: 3

    Check that services have been disabled::

        # systemctl is-enabled tendrl-performance-monitoring
        # systemctl is-enabled tendrl-apid

    Moreover this is also visible in the status::

        # systemctl status tendrl-performance-monitoring
        # systemctl status tendrl-apid

.. test_step:: 4

    Reboot the machine::

        # shutdown -r now

    And then wait for the machine to boot again.

.. test_result:: 4

    The machine is rebooted without any errors.

    After the magging is up again, check Tendrl services::

        # systemctl status tendrl-performance-monitoring
        # systemctl status tendrl-apid

    Services are not running.

Teardown
========

Make sure that Tendrl services are enabled and running::

    # systemctl enable tendrl-performance-monitoring
    # systemctl enable tendrl-apid
    # systemctl start tendrl-performance-monitoring
    # systemctl start tendrl-apid
