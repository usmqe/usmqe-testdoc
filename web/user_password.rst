Change user password
***********************************

:authors: 
          - mkudlej@redhat.com

Description
===========

Change user password.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

Test Steps
==========

.. test_step:: 1
  
    Click on most right icon in upper menu and click on ``change password``.
  
.. test_result:: 1
   
    Window for changing password is opened.

.. test_step:: 2
    
    Add to email and password number ``2`` at the end and click ``Save``.

.. test_result:: 2

    Window should be closed.

.. test_step:: 3

    Follow(*Log out* testcase)

.. test_result:: 3

    User is log out from Tendrl.

.. test_step:: 4

    *Positive login* testcase with new password.

.. test_result:: 4

    User is able to login with new password.
    
Teardown
========

#. Log out

#. Close browser
