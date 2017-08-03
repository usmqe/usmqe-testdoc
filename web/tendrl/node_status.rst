Node status - **this testcase have more variations depended on node info placement**
*************************************************************************************

:authors: 
          - mkudlej@redhat.com

Description
===========

Check node status

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

#. There are available Tendrl nodes.

Test Steps
==========

.. test_action::
   :step:
       Click on ``Hosts`` in left menu.
   :result:
       Node is in list of hosts with proper host information.
    
.. test_action::
   :step:
       Input name of one of nodes into search input.
   :result:
       Searched node is visible with proper host information.


Teardown
========

#. Log out

#. Close browser
