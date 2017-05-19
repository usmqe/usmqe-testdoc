Validate Tendrl server ISO images
**********************************

:author: - dahorak@redhat.com
         - mkudlej@redhat.com

Description
===========

Validate ISO images for Tendrl.

Setup
=====

* Download ISO image.
* install iso-validator https://github.com/sgraf-pub/iso-validator

Test Steps
==========

.. test_action::
   :step:
       Go to the iso-validator directory and run the validation e.g.:

       .. code-block:: bash

          # ./iso-analysis.py \
            --old-iso ./OLD_TENDRL.iso \
            --new-iso ./NEW_TENDRL.iso \
            --source-iso ./NEW_SOURCE_TENDRL.iso \
            --repofrompath=rhel7-base,http://_hostname_/content/dist/rhel/server/7/7Server/x86_64/os \
            --repofrompath=ADDITIONAL_REPOS,ADDITIONAL_REPOS_URL
            --arch=x86_64 \
            --repo-comparison > TENDRL-result.txt

   :result:
       Check that there are:

       * no Unreleased version (newer on ISO, older in yum repos)
       * no Not updated packages (older on ISO, newer in yum repos)
       * no Packages on ISO, missing in yum repos
       * ...

Teardown
========
