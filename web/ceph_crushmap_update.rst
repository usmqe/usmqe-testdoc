Update crushmap for Ceph cluster
*********************************

:authors: 
          - mkudlej@redhat.com

Description
===========

Update crushmap testcase.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

Test Steps
==========

.. test_action::
   :step:
       Go to Crushmap update page.
   :result:
       Check Crushmap update page.

.. test_action::
   :step:
       Update Crushmap.
   :result:
       Check if update of Crushmap correctly ends.

Teardown
========
#. Log out

#. Close browser
