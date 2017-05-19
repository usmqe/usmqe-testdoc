Create user - **this testcase should be break into subtestcases**
*******************************************************************************

:authors: 
          - mkudlej@redhat.com

Description
===========

Create user.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

Test Steps
==========

.. test_step:: 1
  
    Click on ``Admin`` button in left menu.
  
.. test_result:: 1
   
    List of users is shown.

.. test_step:: 2

    Click on ``Add`` button

.. test_result:: 2

    Form for adding user is shown.

.. test_step:: 3

   Input ``User Id``, ``First Name``, ``Last Name``, ``Email``, ``Password`` and click on button ``Save``

.. test_result:: 3

   List of users is shown. New added user is in list with all values input in this step.

.. test_step:: 4

   Try to login as new user as in *Positive Login* testcase.

.. test_result:: 4

  User is logged in.
    
Teardown
========
#. Remove new added user(*Delete user* testcase)

#. Log out

#. Close browser
