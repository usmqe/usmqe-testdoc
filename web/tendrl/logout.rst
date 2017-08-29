Log out
********

:authors: 
          - mkudlej@redhat.com

Description
===========

Log out user from Tendrl.

Setup
=====

Test Steps
==========

.. test_action::
   :step:
       Login as in *Positive login* testcase.
   :result:
       User is succesful logged in Tendrl.

.. test_action::
   :step:
       Click on most right icon in upper menu and click on ``signout``.
   :result:
      User is logged out and main login page is loaded. After input address plus "/#" into address bar of browser user still see login page.
       
    
Teardown
========

#. Close browser
