=======================================
 USM QE Tests Documentation Repository
=======================================

This is a Sphinx_/Pylatest_ project with test case documents and other system
testing related documentation for Tendrl_ upstream project, written in
`reStructuredText syntax`_.

This **repository was switched into read only mode** on 2018-06-15, and it's
keep here for achival purposes only.

Maintained by `USM QE Team`_.


Contributing
============

Make sure that you don't introduce any sphinx-build error or warning in your
changes, both will make TravisCI check to fail.


How to build html
=================

Install sphinx from rpm package and then install pylatest via pip into user
wide site packages only::

    $ pip install --user pylatest

Then, in the root directory of this repository, just run::

    $ make html


.. _Tendrl: http://tendrl.org/
.. _Sphinx: http://www.sphinx-doc.org/en/stable/index.html
.. _`reStructuredText syntax`: http://www.sphinx-doc.org/en/stable/rest.html
.. _`Pylatest`: https://pylatest.readthedocs.io/en/latest/
.. _`USM QE Team`: https://usmqe-tests.readthedocs.io/en/latest/usmqe_team.html
