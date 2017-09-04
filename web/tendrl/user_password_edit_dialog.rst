Change user password at user "Edit" page
*****************************************

:authors: 
          - mkudlej@redhat.com

Description
===========

Change user password at user "Edit" page for these user types:
 1. *Admin* user
 2. *Power User* user
 3. *Read-only* user

Design describing "Edit" page `https://redhat.invisionapp.com/share/KNB25OEQT#/screens/226063805`

Setup
=====

#. Login user into Tendrl, see :doc:`/web/tendrl/login_positive`
#. Create 3 users mentioned in Description, see :doc:`/web/tendrl/user_create`

Test Steps
==========

.. test_action::
   :step:
       Click on *Admin* -> *Users* in left menu.
   :result:
       Page with user list is open.

.. test_action::
   :step:
       Click on *Edit* button for user.
   :result:
       "Edit" page should be open.

.. test_action::
   :step:
       Input password to *Change Password* and same string to *Confirm Password*.
   :result:
       Password in both inputs are not visible and instead of them are dots.

.. test_action::
   :step:
       Click on icon next to *Change Password* and *Confirm Password* input.
   :result:
       Both password strings are readable.

.. test_action::
   :step:
       Click on *Save* button.
   :result:
       User is saved and there is no error.

.. test_action::
   :step:
       *Positive login* testcase with new password.
   :result:
       User is able to login with new password.
    
Teardown
========

#. Log out

#. Close browser
