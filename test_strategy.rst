Testing Strategy for Tendrl project
######################################

:authors: 
          - mkudlej@redhat.com

Test Strategy Identifier
***************************************************
This is master strategy for testing `Tendrl`_.
In case of any questions please contact `USMQE group`_.

References
***************************************************
- IEEE 829 Test Plan Outline
- `ISTQB syllabus`_ 
- `Requirements defined by developers`_
- `Tendrl documentation`_
- `Tendrl wiki documentation`_
- `UI designs`_
- :doc:`QE team references <references>`

Introduction
***************************************************
This document describes testing strategy for Tendrl.


Test Items
***************************************************

Install documentation
======================
`Tendrl Install Documentation`_

Packages
========
`Tendrl package repository`_

Features to be Tested
***************************************************
Tested features are described in testcases including tested Gluster configurations.
List of test case categories:

  * :doc:`api/index`
  * :doc:`installation/index`
  * :doc:`minimal-acceptance/index`
  * :doc:`system-integration/index`
  * :doc:`web/index`

Features not to be Tested
***************************************************
All Tendrl package dependencies and Grafana packages are not directly tested.

Approach
***************************************************

Tools used
===========

 * Selenium + `Webstr`_ - for automated `UI tests`_
 * Ansible - for provisioning and configuration machines - `USMQE Setup`_, `Tendrl Ansible`_
 * Jenkins - for CI - Tendrl jobs at `Centos CI`_
 * KVM, Libvirt, Duffy - infrastructure for deploying VMs - `Centos CI wiki`_
 * GDeploy - for setting up Gluster clusters

How to test
============

Manual testing
---------------

 #. Install clean machines for every testcase (if 2 testcases are completely independent, orthogonal and they are not influenced each other, they can be tested one after another)
 #. Read testcase description and related issues.
 #. Test it
 #. Think about enhancing testcase, make it more general, try to write semi-automated script for testing
 #. Change testcase if there are any changes
 #. If testcase is related to any issue, please close issue(s) in case of pass. Otherwise file new issue, add it to testcase, add testcase link to that issue.

Automated testing (CI)
-----------------------
There are Jenkins builds which periodically install all required machines, install Tendrl and run automated tests. It is our priority to create automated tests.

Tested configurations
----------------------
All testcases are tested with basic configuration installed by `USMQE Setup`_ playbooks which will use roles from `Tendrl Ansible`_. In addition, Gluster clusters are created and configured by Gdeploy.

Basic configuration for Gluster: 4 nodes with Gluster installed by Gdeploy

All tested configurations are included in related test cases.

Found Issues
-------------
If tester finds any issue, it should be documented in issue in related repository.
It should include relevant information, see `How to file bugs against the Tendrl stack`_

Responsibilities
***************************************************

Testers:
=========

 * Build infrastructure
 * Create test cases
 * Write automated test cases
 * Resolve technical issues
 * Track the defects created and make sure they are complete and correct

.. _Tendrl: https://github.com/Tendrl
.. _USMQE group: https://github.com/orgs/usmqe/people
.. _ISTQB syllabus: http://www.istqb.org/downloads/syllabi/foundation-level-syllabus.html
.. _Requirements defined by developers: https://github.com/Tendrl/specifications
.. _Tendrl documentation: https://github.com/Tendrl/documentation
.. _Tendrl wiki documentation: https://github.com/Tendrl/documentation/wiki
.. _UI designs: https://github.com/Tendrl/documentation/wiki/Tendrl-UI-designs
.. _Tendrl Install Documentation: https://github.com/Tendrl/documentation/wiki/Tendrl-Package-Installation-Reference(Revised)
.. _Tendrl package repository: https://copr.fedorainfracloud.org/coprs/tendrl/release/repo/epel-7/tendrl-release-epel-7.repo
.. _Webstr: https://github.com/Webstr-framework/webstr
.. _UI tests: https://github.com/usmqe/usmqe-tests
.. _USMQE Setup: https://github.com/usmqe/usmqe-setup
.. _Tendrl Ansible: https://github.com/Tendrl/tendrl-ansible
.. _How to file bugs against the Tendrl stack: https://github.com/Tendrl/documentation/wiki/How-to-file-bugs-against-the-Tendrl-stack
.. _Centos CI: https://ci.centos.org/
.. _Centos CI wiki: https://wiki.centos.org/QaWiki/CI/GettingStarted
