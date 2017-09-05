User list
**********

:authors: 
          - mkudlej@redhat.com

Description
===========

Check user list testcase and compare it with `https://redhat.invisionapp.com/share/8QCOEVEY9#/screens/244738633`.

Setup
=====

#. Login user into Tendrl, see :doc:`/web/tendrl/login_positive`

Test Steps
==========

.. test_action::
   :step:
       Click on ``Admin`` and ``Users`` button in left menu.
   :result:
       List of users is shown.

.. test_action::
   :step:
       Compare user list with design document.
   :result:
       All components at design document are implemented.

.. test_action::
   :step:
      Search users according:
        * User ID
        * Last name
        * Role
        * Status
   :result:
      Users can be found by these 4 attributes.

Teardown
========
#. Log out

#. Close browser
