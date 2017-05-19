Validate Tendrl server qcow2 images - in libvirt/KVM VM
*********************************************************

:author: - dahorak@redhat.com
         - mkudlej@redhat.com

Description
===========

Validate qcow2 images with Tendrl server in libvirt/KVM VM.

Setup
=====

Download prepared Tendrl server qcow2 image to ``_hostname_:/var/lib/libvirt/images``.

Prepare copy of the image for testing VM::

    cp /var/lib/libvirt/images/IMAGE /var/lib/libvirt/images/test-IMAGE

Test Steps
==========

.. test_step:: 1

    Configure root password for the image accordingly to the documentation::

        virt-customize -a test-IMAGE --root-password password:def_password

.. test_step:: 2

    Disable cloud-init service accordingly to the documentation::

        guestfish -a test-IMAGE -i ln-sf /dev/null /etc/systemd/system/cloud-init.service

.. test_step:: 3

    Create new VM (according to the documentation) and use the prepared
    test-IMAGE as existing disk.

.. test_step:: 4

    Login into the VM created in the previous step and check:

    * network configuration (IP address, hostname)

    .. * check security related configuration: SELinux, firewall,...

.. test_result:: 4

    Expected state:

    * the machine has a proper IP address and hostname

    .. * SELinux is in Enforcing mode, firewall is enabled,...

.. test_step:: 5

    Check that all Tendrl related services are running:

    * etcd
    * ceph-installer
    * ceph-installer-celery
    * httpd
    * tendrl-performance-monitoring
    * tendrl-apid

.. test_result:: 5

    All services are up running.

.. test_step:: 6

    Open the Tendrl web UI and graphite-web UI in browser.

.. test_result:: 6

    Tendrl web UI and graphite-web UI is accesible.

.. test_step:: 7

    Create cluster accordingly to :doc:`/setup/install_default`.

.. test_result:: 7

    It is possible to create cluster and perform additional tasks as with othe Tendrl server.

Teardown
========

