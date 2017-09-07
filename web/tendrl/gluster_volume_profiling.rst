Gluster Volume Profiling
************************

:authors: 
          - dahorak@redhat.com

Description
===========

Enable/disable cluster wide volume profiling 
(both on initial import and post import).


Setup
=====

Perform following Setup and Test Steps twice:

* firstly with enabling Volume Profiling during cluster import (default)
* secondly with disabling Volume Profiling during cluster import

TODO: both previous scenarios expects that Volume Profiling is
initially disabled on the Volume (which is the default), but it might be
worth to test the same again with also Volume with initially enabled Profiling.

Setup steps:

#. Login user into Tendrl, see :doc:`/web/tendrl/login_positive`
#. Import cluster into Tendrl, see :doc:`/web/tendrl/cluster_import`

Test Steps
==========

.. test_action::
   :step:
      Login to one of the gluster storage server via SSH and check
      if Volume Profiling is enabled or disabled.

      ``gluster volume profile <VOLUME-NAME> info``
   :result:
      Volume profiling should be in the state (enabled or disabled) accordingly to the configured state during cluster import.

.. test_action::
   :step:
      Go to ``Clusters`` page.
   :result:
      List of clusters page is shown.

.. test_action::
   :step:
      Change the state of Volume Profiling by clicking on the respective menu item.
   :result:
      Popup message appear with following text: *Volume profiling updated successfully.*

.. test_action::
   :step:
      Wait a minute and check the state in *Volume Profile* column.
   :result:
      Volume profiling should be in the correct state (enabled or disabled).

.. test_action::
   :step:
      Login to one of the gluster storage server via SSH and check
      if Volume Profiling is enabled or disabled.

      ``gluster volume profile <VOLUME-NAME> info``
       
   :result:
      Volume profiling should be in the correct state (enabled or disabled).

.. test_action::
   :step:
      Repeat the previous steps and change the Volume Profiling state (enabled/disabled) multiple times.
      
   :result:

.. test_action::
   :step:
      Login to one of the gluster storage server via SSH and change the
      Volume Profiling state (enable or disable).

      ``gluster volume profile <VOLUME-NAME> start``

      or

      ``gluster volume profile <VOLUME-NAME> stop``
       
   :result:

.. test_action::
   :step:
      Wait few minutes and check the state in Tendrl web UI on Clusters page (*Volume Profile* column).
   :result:
      Volume profiling should be in the correct state (enabled or disabled).

      Also correct menu item (Enable/Disable Profiling) is available.

.. test_action::
   :step:
      Repeat the previous two steps and change the Volume Profiling state (enable/disable)
      multiple times via ``gluster volume profile <VOLUME-NAME> start|stop`` command.
      
   :result:

Teardown
========
#. Log out

#. Close browser
