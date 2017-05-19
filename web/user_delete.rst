Delete user
********************

:authors: 
          - mkudlej@redhat.com

Description
===========

Delete user.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

#. Create test user(*Create user* testcase)

Test Steps
==========

.. test_step:: 1
  
    Click on ``Admin`` button in left menu.
  
.. test_result:: 1
   
    List of users is shown.

.. test_step:: 2

   Click on checkbox in line with test user

.. test_result:: 2

   Checkbox is checked

.. test_step:: 3

    Click on ``remove`` button

.. test_result:: 3

    User is removed from list.

.. test_step:: 4

   Logout as in *Logout* testcase

.. test_result:: 4

   Admin user is logged out.

.. test_step:: 5

   Try to login as deleted user as in *Negative Login* testcase.

.. test_result:: 5

  User is not logged in.

Teardown
========
#. Close browser
