Unit Test Retun
===============

Since python tendrl packages bundles unit test code into main python module of
the package, it should be possible to rerun unit tests of such rpm installed
package.

Rerunning unit tests on target platform could reveal significant problems with
packaging or differences between unit test and production environment.

.. test_defaults::
   :caselevel: integration
   :casecomponent: rpm
   :testtype: nonfunctional
