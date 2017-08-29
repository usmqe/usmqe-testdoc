Change user password
***********************************

:authors: 
          - mkudlej@redhat.com

Description
===========

Change user password.

Setup
=====

#. Login user into Tendrl, see :doc:`/web/tendrl/login_positive`

Test Steps
==========

.. test_action::
   :step:
       Click on most right icon in upper menu and click on ``change password``.
   :result:
       Window for changing password is opened.

.. test_action::
   :step:
       Add to email and password number ``2`` at the end and click ``Save``.
   :result:
       Window should be closed.

.. test_action::
   :step:
       Follow(*Log out* testcase)
   :result:
       User is log out from Tendrl.

.. test_action::
   :step:
       *Positive login* testcase with new password.
   :result:
       User is able to login with new password.
    
Teardown
========

#. Log out

#. Close browser
