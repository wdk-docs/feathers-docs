How JSON Web Tokens Work
========================

This guide is a work in progress. There’s some useful information here
while we make it more user friendly in the context of Feathers. In the
meantime, here are a couple of resources on JWT to get more familiar
with how it works, in general:

-  `The Auth0 JWT Documentation <https://auth0.com/docs/jwt>`_ - If you want a good high-level overview.
-  `The IETF JWT Specification <https://tools.ietf.org/html/rfc7519>`_ - If you want to get really technical.

Customizing the JWT Claims
--------------------------

``feathers-authentication@1.x`` allows you to customize the data stored
inside the JWT. We refer to the data in the JWT as the ``payload``.
There are a few reserved attributes, which in the `Official JWT Spec <https://tools.ietf.org/html/rfc7519>`_ are called ``claims``.
You can customize some of these claims in the :ref:`api_auth_server-otions`.
To get more familiar with the purpose of each ``claim``,
please refer to `Section 4 of the Official JWT Specification <https://tools.ietf.org/html/rfc7519#section-4>`_.
