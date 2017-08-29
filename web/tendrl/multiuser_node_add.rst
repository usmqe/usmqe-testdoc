Multiuser - Add node
********************

:authors: 
          - mkudlej@redhat.com
          - dahorak@redhat.com

Description
===========

**UNDER CONSTRUCTION - NEEDS UPDATE**

Add node - button next to node name

Setup
=====

#. Prepare environment as described in :doc:`/configurations/multiuser_initial_setup`.

#. There are configured nodes which can be added

Test Steps
==========

.. test_action::
   :step:
       In both browsers click on 3rd icon in right upper menu.
   :result:
       In both browsers small windows is opened. There is at least one discovered node.

.. test_action::
   :step:
       In both browsers simultaneously click ``Accept`` button next to one node name (the same on both browsers).
   :result:
       In one browser button label changes. ``Accepting`` task is visible in task list(2nd icon in right upper menu->See all). After task is done alert message appears with task result.

       In second browser, error message is shown about already accepted node.

.. test_action::
   :step:
       In both browsers simultaneously click ``Accept`` button next to one node name (different on both browsers).
   :result:
       In both browsers button label changes. ``Accepting`` task is visible in task list(2nd icon in right upper menu->See all). After task is done alert message appears with task result.

.. test_action::
   :step:
       In both browsers click on ``Hosts`` in left menu.
   :result:
       In both browsers accepted node is in list of hosts with proper host information.

Teardown
========

#. Log out

#. Close browser
