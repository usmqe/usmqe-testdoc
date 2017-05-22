Elementary check of Hosts Langing Page
**************************************

:authors: 
          - mbukatov@redhat.com
          - mkudlej@redhat.com

.. _`Design document for hosts list`: https://redhat.invisionapp.com/share/BR8JDCGSQ#/screens/212034116

Description
===========

This test case is concerned with *Hosts landing page* and verifies the
core features as described in `Design document for hosts list`_.

This test case is not concerned with all possible states of information
reported there, see other test cases which deals with information and
features related to this page in more detail.

Setup
=====

#. Install Tendrl according installation instruction written in the *Test Plan*

#. Login as an admin user into Tendrl (:doc:`/web/login_positive`)

#. Do nothing else (no cluster created, ...) so
   that there is nothing configured. Just make sure that you have few
   hosts configured properly so that they will be shown as *discovered*.

Test Steps
==========

.. test_action::
   :step:
       Click on *Hosts* link in the left menu bar.
   :result:
       The *Hosts Landing Page* is shown. The title reads "Hosts" and the page
       contains all hosts prepared during testcase setup.

.. test_action::
   :step:
       See information in all host items in the list on *Hosts Langing Page*.
   :result:
       For each host item in the list, there are the following details provided:

       * Assignment status in the left collumn is **FREE**.
       * Hostname (fqdn)
       * IP address (TODO: what if there are multiple interfaces?)
       * Cluster type (Ceph or Gluster) - not reported yet
       * Cluster name reported as **Unassigned**
       * Cluster role (eg. monitor, OSD, ...) - not reported yet
       * Version of OS (distro), kernel and storage software (ceph or gluster)
       * Total number of **Alerts** (TODO: add details)
       * Menu icon which provides pop up menu with operations which could be
         performed for this node
         TODO: list all host actions (eg. Unmanage, Remove, ...) or maybe just
         left it to other test cases 
       * TODO: daemon actions (Start, Stop, ...)
       * TODO: something else?

       Note that no all actions and/or information are applicable to the current
       state of the nodes (available Tendrl nodes, without any cluster).

Teardown
========

#. Undefine storage items (TODO: add more details go here).

#. Log out

#. Close browser
