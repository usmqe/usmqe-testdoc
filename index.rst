.. USMQE Test Documentation documentation master file, created by
   sphinx-quickstart on Thu May 18 18:56:24 2017.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

============================
 Tendrl Tests Documentation
============================

This is qe documentation for `Tendrl Project`_ maintained by `USM QE team`_,
covering testing environment (eg. cluster configuration) and test cases.

While this description is concerned with **upstream testing only**, it's
**driven by downstream plans** and downstream test cases will be based on it
later on.

Upstream source code of this project is available on github in `usmqe-testdoc
repository`_.

.. _`usmqe-testdoc repository`: https://github.com/usmqe/usmqe-testdoc

.. toctree::
   :maxdepth: 1
   :caption: Testing Approach:

   configurations/index.rst
   test_strategy.rst

.. toctree::
   :maxdepth: 2
   :caption: Test Case Structure:

   minimal-acceptance/index.rst
   system-integration/index.rst
   installation/index.rst
   api/index.rst
   web/index.rst
