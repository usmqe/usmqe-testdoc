Minimal Acceptance Tests
========================

These test cases are based on **minimal acceptance tests** listed in test plan
document which will be fully automated and run by CI system on every build
before qe team starts further system testing.

In upstream, the tests cases listed here are executed by `CentOS CI`_
jenkins instance, see `Tendrl CentOS CI Dashboard`_ (note that out of all
minimal acceptance tests as listed below, only *rpm* and *minimal install*
cases are executed and shown on this dashboard and that there are also other
types of tests on the dashboard).

For source code of upstream jenkins jobs, see `usmqe-centos-ci`_ repository.

.. _`CentOS CI`: https://wiki.centos.org/QaWiki/CI
.. _`usmqe-centos-ci`: https://github.com/usmqe/usmqe-centos-ci
.. _`Tendrl CentOS CI Dashboard`: https://ci.centos.org/view/Tendrl/

.. toctree::
   :caption: Subcomponents:
   :maxdepth: 2
   :glob:
