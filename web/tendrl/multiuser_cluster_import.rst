Multiuser - Cluster import
****************************

:authors:
          - mkudlej@redhat.com
:caseposneg: positive


Description
============

Try to import cluster twice. Testcase is tested with one (or two users) and
with 2 different browser sessions (two different session IDs). Goal is to try to import
cluster from *Import wizard*. User(s) should have permission to import cluster.

Setup
======

#. Prepare environment as described in :doc:`/configurations/multiuser_initial_setup`.

#. Prepare cluster ready for import.

Test Steps
===========

.. test_action::
   :step:
       In both browsers click on *Import Cluster* button.
   :result:
       In both browsers *Cluster Import* wizard starts.

.. test_action::
   :step:
       In first browser click on *Import* button.
   :result:
       There is page for new task opened with message: *Import Cluster Task Submitted*

.. test_action::
   :step:
       In first browsers click on *View Task Progress*.
   :result:
       Task in first browser should pass.

.. test_action::
   :step:
       If import cluster task pass in second browser click on *Import* button.
   :result:
       There is page for new task opened with message: *Import Cluster Task Submitted*

.. test_action::
   :step:
       In second browser click on *View Task Progress*.
   :result:
       Task in second browser should fail.

