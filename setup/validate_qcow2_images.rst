Validate the content of Tendrl server qcow2 images
***************************************************

:author: - dahorak@redhat.com
         - mkudlej@redhat.com

Description
===========

Validate the content of qcow2 images with Tendrl server.

Setup
=====

Download prepared Tendrl server qcow2 image to ``_hostname_:/var/lib/libvirt/images``.

Test Steps
==========

.. test_action::
   :step:
       Validate the content of the image using the `iso-validator tool`_::

           ./iso-analysis.py \
           --old-iso OLD_IMAGE \
           --new-iso NEW_IMAGE \
           --repofrompath=rhel7-base,http://_hostname_/content/dist/rhel/server/7/7Server/x86_64/os \
           --repofrompath=rhel-7-server-rhscon-2-main-rpms,http://_hostname_/rcm-guest/ceph-drops/auto/rhscon-2-rhel-7-compose/latest-RHSCON-2-RHEL-7/compose/Main/x86_64/os/ \
           --repofrompath=rhel-7-server-rhscon-2-installer-rpms,http://_hostname_/rcm-guest/ceph-drops/auto/rhscon-2-rhel-7-compose/latest-RHSCON-2-RHEL-7/compose/Installer/x86_64/os/ \
           --repo-comparison \
           --arch=x86_64 \
           --key-id=_key_id_ > NEW_IMAGE-result.txt
   :result:
       NEW_IMAGE-result.txt file is generated.

.. test_action::
   :step:
       Check the result file.
   :result:
       * Package tests: packages added (new vs old iso)

       * Package tests: packages removed (new vs old iso)

       * Package tests: packages upgraded (new vs old iso)

       * Package tests: packages downgraded (new vs old iso)
         This should be probably empty.

       * Package tests: possibly unsigned (new iso only)
         Should be empty, all packages should be signed.

       * Unreleased version (newer on ISO, older in yum repos)
         Should be empty, only released packages and packages from relevant ET should be included.

       * Not updated packages (older on ISO, newer in yum repos)
         Should be empty, all available packages should be in latest available versions.
         (There might be exclusions for recently released packages from RHEL.)

       * Packages on ISO, missing in yum repos
         Should be empty probably with exception of cloud-init and dependencies.

.. _`iso-validator tool`: https://github.com/sgraf-pub/iso-validator

Teardown
========
