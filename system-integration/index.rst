System Integration Tests
========================

These test cases check particular properties related to *operating system
integration* (such as systemd units, logging configuration, iso file static
validation) which doesn't require full end user scenarios to be performed
during testing.

In other words, the test cases here are not based on planned end user features
as tracked by requirements, but rather sheer target platform (Red Hat Linux 7)
and related shipping and integration requirements.

These tests are both out of scope of *initial validation* and doesn't fit into
*full system testing* as done in test cases of web or api components.

.. test_defaults::
   :caselevel: integration
   :casecomponent: system-integration

.. toctree::
   :caption: Subcomponents:
   :maxdepth: 2
   :glob:

   systemd/index.rst
