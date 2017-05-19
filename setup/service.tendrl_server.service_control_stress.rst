Tendrl server services control stress test
*******************************************

:author: - mbukatov@redhat.com
         - mkudlej@redhat.com
:caseposneg: negative

Description
===========

Check that Tendrl services can be properly managed via systemd, this test
checks (re)starting after crash.

This test case assumes that ``Restart=on-failure`` is not used in Tendrl
systemd services file.

Setup
=====

Follow :doc:`/setup/install_default` to install Tendrl. No particular
cluster configuration is required for this test case, so we use the default
one.

All test steps are performed on the master server, where the Tendrl services
are running.

Test Steps
==========

.. test_step:: 1

    Make sure that Tendrl services are running::

        # systemctl start tendrl-performance-monitoring
        # systemctl start tendrp-apid
        # systemctl status tendrl-performance-monitoring
        # systemctl status tendrp-apid

.. test_result:: 1

    Status of services is shown as running without any problems reported.

.. test_step:: 2

    Manually kill Tendrl process. Use PID of ``/usr/bin/puma`` process
    from the ``systemctl status tendrp-apid`` output (done in the previous step)
    and PID of ``/usr/bin/tendrl-performance-monitoring``::

        # kill -9 123
        # systemctl status tendrp-apid

        # kill -9 124
        # systemctl status tendrl-performance-monitoring

.. test_result:: 2

    Tendrl services are not running.

.. test_step:: 3

    Restart Tendrl services.

        # systemctl restart tendrl-performance-monitoring
        # systemctl restart tendrl-apid

.. test_result:: 3
    
    Tendrl services are running.

.. test_step:: 4

    Kill Tendrl processes via systemd:: 

        # systemctl kill -s 9 tendrl-apid
        # systemctl status tendrl-apid
        # systemctl kill -s 9 tendrl-performance-monitoring
        # systemctl status tendrl-performance-monitoring

.. test_result:: 4

    Tendrl services are not running.

Teardown
========

Teardown is not needed.
