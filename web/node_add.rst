Add node - **this testcase should be break into variations**
*************************************************************************

:authors: 
          - mkudlej@redhat.com
          - ltrilety@redhat.com
          - dahorak@redhat.com

Description
===========

Add node - button next to node name

Related bugs: :RHBZ:`1338001`, :RHBZ:`1296571`, :RHBZ:`1312814`

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

#. There are configured nodes which can be accepted

Test Steps
==========

.. test_action::
   :step:
       Click on 2nd icon in right upper menu (*Discovered Hosts*).
   :result:
       Small windows *Discovered Hosts* is opened. There is at least one discovered node.

.. test_action::
   :step:
       Click to *Accept* button next to one node name.

       TODO: Accepting from the *Discovered Hosts* pop-up window (2nd icon in the right upper menu -> Seel All).
   :result:
       Button label changes. ``Accepting`` and ``Initialization node`` tasks are visible in task list (3nd icon in right upper menu->See all).
       After task is done, particular node disappear from the *Discovered Hosts* window.

.. test_action::
   :step:
       If there are additional unaccepted hosts, click on *Clusters* -> *Create Cluster* button.
   :result:
       Pop-up winodow *Unaccepted Hosts Detected* appear.

.. test_action::
   :step:
       Click to *View and Accept* button.
   :result:
       Page *View and Accept Hosts* with list of unaccepted hosts is displayed.

.. test_action::
   :step:
       Use the *Search* field and try to filter the list of unaccepted nodes by typing there common part of few (not all) unaccepted nodes.
       Try to seach also accordingly to the fingerprint listed under each node.
   :result:
       Only nodes suitable to the search pattern are listed.

.. test_action::
   :step:
       Click to *Accept* button next to one node name.
   :result:
       *Accept* button cahnges to *Details* button and there is also progress bar showing the process of node acceptance.

.. test_action::
   :step:
       Click to *Details* button for the accepting node.
   :result:
       Pop-up window *Task Details* appears. The window contain information about acepting task.

.. test_action::
   :step:
       Close the *Task Details* pop-up window and click to *Accept All* button to accept all the remaining nodes.

       TODO: what should happend when filter just some nodes (by filling the *Search* field) and then click to *Accept All* button?
       Should be accepted all nodes or only the filtered one?
   :result:
       *Accept node: ...* tasks are launched for all remaining unaccepted nodes.

.. test_action::
   :step:
       Go to the *Tasks* page (*Admin* -> *Tasks*, or 3rd icon in the upper right menu -> *See All*). 
       Check *Accept Node:...* and *Initialize Node:...* tasks for all accepted nodes.
   :result:
       All accepted nodes have appropriate *Accept Node:...* and *Initialize Node:...* task.

       TODO: Node reinitialization in case of some failure.

.. test_action::
   :step:
       Wait till the initialization task is finished and click on ``Hosts`` in left menu.
   :result:
       The node is in list of hosts with all host information available and correct.

Teardown
========

#. Log out

#. Close browser
