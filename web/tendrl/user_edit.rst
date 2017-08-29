Edit user - **this testcase should be break into subtestcases**
*******************************************************************************

:authors: 
          - mkudlej@redhat.com

Description
===========

Edit user.

Setup
=====

#. Login user into Tendrl, see :doc:`/web/tendrl/login_positive`

#. Create test user as in *Create user* testcase

Test Steps
==========

.. test_action::
   :step:
       Click on ``Admin`` button in left menu.
   :result:
       List of users is shown.

.. test_action::
   :step:
       Click on ``Edit`` button
   :result:
       Form for edit user is shown.

.. test_action::
   :step:
      Change ``User Id``, ``First Name``, ``Last Name``, ``Email``, ``Password`` and other and click on button ``Save``
   :result:
      List of users is shown. Changed user is in list with all values input in this step.

Teardown
========
#. Remove new added user(*Delete user* testcase)

#. Log out

#. Close browser
