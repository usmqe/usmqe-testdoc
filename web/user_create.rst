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

.. test_action::
   :step:
       Click on ``Admin`` button in left menu.
   :result:
       List of users is shown.

.. test_action::
   :step:
       Click on ``Add`` button
   :result:
       Form for adding user is shown.

.. test_action::
   :step:
      Input ``User Id``, ``First Name``, ``Last Name``, ``Email``, ``Password`` and click on button ``Save``
   :result:
      List of users is shown. New added user is in list with all values input in this step.

.. test_action::
   :step:
      Try to login as new user as in *Positive Login* testcase.
   :result:
     User is logged in.
    
Teardown
========
#. Remove new added user(*Delete user* testcase)

#. Log out

#. Close browser
