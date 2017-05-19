Import cluster
********************

:authors: 
          - mkudlej@redhat.com

.. _Design document for import: https://redhat.invisionapp.com/share/R88EUSGJK#/screens/193145496

Description
===========

Import existing cluster.

.. note:: TODO according list of supported variants

   There are variants of this test case:

   * import of cluster created by RHSC 2.0
   * import of cluster created by ceph-ansible of Ceph 2.0
   * import of cluster created by ceph-ansible of Ceph 2.1
   * import of cluster created by ceph-ansible of Ceph 2.2
   * import of cluster created by gdeploy from RHGS 3.2
   * import of cluster created by heketi from RHGS 3.2
   * import of cluster created by Console 1 from RHGS 3.2

During testing `Design document for import`_ should be considered.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

Test Steps
==========

.. test_step:: 1
  
    Go to ``Clusters``
  
.. test_result:: 1
   
    List of clusters page is shown.

.. test_step:: 2

    Click on ``Import Cluster`` button

.. test_result:: 2

    Wizard for importing cluster is shown.

.. test_step:: 3

   Follow wizard for importing cluster.

.. test_result:: 3

   Cluster is successfully imported.

Teardown
========
#. Remove added cluster(*Forget cluster* testcase)

#. Log out

#. Close browser
