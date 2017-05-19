Log out
********

:authors: 
          - mkudlej@redhat.com

Description
===========

Log out user from Tendrl.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

Test Steps
==========

.. test_step:: 1

    Login as in *Positive login* testcase.

.. test_result:: 1

    User is succesful logged in Tendrl.

.. test_step:: 2
  
    Click on most right icon in upper menu and click on ``signout``.
  
.. test_result:: 2
   
   User is logged out and main login page is loaded. After input address plus "/#" into address bar of browser user still see login page.
    
    
Teardown
========

#. Close browser
