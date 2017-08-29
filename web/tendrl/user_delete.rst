Delete user
********************

:authors: 
          - mkudlej@redhat.com

Description
===========

Delete user.

Setup
=====

#. Login user into Tendrl, see :doc:`/web/login_positive`

#. Create test user(*Create user* testcase)

Test Steps
==========

.. test_action::
   :step:
       Click on ``Admin`` button in left menu.
   :result:
       List of users is shown.

.. test_action::
   :step:
      Click on checkbox in line with test user
   :result:
      Checkbox is checked

.. test_action::
   :step:
       Click on ``remove`` button
   :result:
       User is removed from list.

.. test_action::
   :step:
      Logout as in *Logout* testcase
   :result:
      Admin user is logged out.

.. test_action::
   :step:
      Try to login as deleted user as in *Negative Login* testcase.
   :result:
     User is not logged in.

Teardown
========
#. Close browser
