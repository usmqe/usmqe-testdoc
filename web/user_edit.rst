Edit user - **this testcase should be break into subtestcases**
*******************************************************************************

:authors: 
          - mkudlej@redhat.com

Description
===========

Edit user.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

#. Create test user as in *Create user* testcase

Test Steps
==========

.. test_step:: 1
  
    Click on ``Admin`` button in left menu.
  
.. test_result:: 1
   
    List of users is shown.

.. test_step:: 2

    Click on ``Edit`` button

.. test_result:: 2

    Form for edit user is shown.

.. test_step:: 3

   Change ``User Id``, ``First Name``, ``Last Name``, ``Email``, ``Password`` and other and click on button ``Save``

.. test_result:: 3

   List of users is shown. Changed user is in list with all values input in this step.

Teardown
========
#. Remove new added user(*Delete user* testcase)

#. Log out

#. Close browser
