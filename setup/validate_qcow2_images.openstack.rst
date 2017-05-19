Validate Tendrl server qcow2 images - in OpenStack
***************************************************

:author: - dahorak@redhat.com
         - mkudlej@redhat.com

Description
===========

Validate qcow2 images with Tendrl server in OpenStack.

Setup
=====

Download prepared Tendrl server qcow2 image to ``_hostname_:/var/lib/libvirt/images``.

Further replace the IMAGE by the real image name.

Test Steps
==========

.. test_step:: 1

    Upload the image to OpenStack::

        . ~/nova/openrc.sh
        glance image-create --name IMAGE --disk-format=qcow2 --container-format=bare --is-public=False --file /var/lib/libvirt/images/IMAGE  --min-disk 20 --min-ram 1024 --progress

.. test_result:: 1

    Image is properly uploaded and summary table is printed.

.. test_step:: 2

    Create new VM and use the uploaded image::

        nova boot --flavor 30 --image IMAGE_ID --key-name ansible_rsa test_IMAGE

.. test_result:: 2

    New VM is properly launched.

.. test_step:: 3

    Log in to the OpenStack web UI and assign floatin IP address to the new launched VM.

    Tab ``Instances``, ``Associate floating IP`` from the dropdown menu for the new VM.

    Note: at this point, one can create an ansible inventory file to work
    with the machine further, eg::

        $ cat qcow-testing.openstack.hosts
        [usm_server]
        _IP_ ansible_connection=ssh ansible_user=cloud-user ansible_ssh_private_key_file=~/.ssh/id_rsa.ansible_rsa ansible_become=yes ansible_su_user=root ansible_su_pass=def_password

.. test_result:: 3

    The machine is up and accessible::

        $ ansible -i qcow-testing.openstack.hosts -m ping usm_server
        _IP_ | SUCCESS => {
            "changed": false,
            "ping": "pong"
        }

.. test_step:: 4

    Login into the VM created in the previous step and check:

    * network configuration (IP, hostname)
    * running services: 
        * etcd
        * ceph-installer
        * ceph-installer-celery
        * httpd
        * tendrl-performance-monitoring
        * tendrl-apid
    * check security related configuration: SELinux, firewall,...

.. test_result:: 4

    Expected state:

    * it should have proper IP and hostname
    * all services are running
    * SELinux is in Enforcing mode, firewall is enabled,...

.. test_step:: 5

    Open the Tendrl web UI and graphite-web UI in browser.

.. test_result:: 5

    Tendrl web UI and graphite-web UI is accesible.

.. test_step:: 6

    Create cluster accordingly to :doc:`/setup/install_default`.

.. test_result:: 6

    It is possible to create cluster and perform additional tasks as with othe Tendrl server.

Teardown
========


