An Overview of Feathers Authentication
======================================

The Auk release of FeathersJS includes a powerful new :doc:`../../api/authentication/server` built on top of
`PassportJS <http://www.passportjs.org/>`_. The new plugins are very
flexible, allowing you to customize nearly everything.

A Single Auth Endpoint
----------------------

In the previous ``feathers-authentication`` plugin, there were two auth
endpoints: ``/auth/local`` was for username and password login.
``/auth/token`` was for JWT-based login. In making the latest version,
we decided that auth could be more like the rest of Feathers. We created
an ``/authentication`` service. This single endpoint handles both
``local``, and ``jwt`` logins, and more.

Here are a couple of examples that show what this single
``/authentication`` endpoint looks like in practice. This first one
shows the payload for ``local`` auth in the new version.

.. code:: js

   {
     strategy: 'local',
     email: 'my@email.com',
     password: '***************'
   }
