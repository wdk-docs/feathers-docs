Primus
======

|npm version| |Changelog|

::

   $ npm install @feathersjs/primus --save

The [@feathersjs/primus](https://github.com/feathersjs/primus) module
allows to call :doc:`./services` and receive
:doc:`./events` via
`Primus <https://github.com/primus/primus>`_, a universal wrapper for
real-time frameworks that supports Engine.IO, WebSockets, Faye,
BrowserChannel, SockJS and Socket.IO.

.. important:: This page describes how to set up Primus server. The
   :doc:`./client/primus` shows how to connect
   to this server on the client and the message format for service calls
   and real-time events.

Configuration
-------------

Additionally to ``@feathersjs/primus`` your websocket library of choice
also has to be installed.

::

   $ npm install ws --save

app.configure(primus(options))
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Sets up the Primus transport with the given `Primus
options <https://github.com/primus/primus>`_.

.. tip::  Once the server has been started with ``app.listen()``
   or ``app.setup(server)`` the Primus server object is available as
   ``app.primus``.

.. code:: js

   const feathers = require('@feathersjs/feathers');
   const primus = require('@feathersjs/primus');

   const app = feathers();

   // Set up Primus with SockJS
   app.configure(primus({ transformer: 'ws' }));

   app.listen(3030);

app.configure(primus(options, callback))
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Sets up the Primus transport with the given `Primus
options <https://github.com/primus/primus>`_ and calls the callback
with the Primus server instance.

.. code:: js

   const feathers = require('@feathersjs/feathers');
   const primus = require('@feathersjs/primus');

   const app = feathers();

   // Set up Primus with SockJS
   app.configure(primus({
     transformer: 'ws'
   }, function(primus) {
     // Do something with primus object
   }));

   app.listen(3030);

params
------

The Primus request object has a ``feathers`` property that can be
extended with additional service ``params`` during authorization:

.. code:: js

   app.configure(primus({
     transformer: 'ws'
   }, function(primus) {
     // Do something with primus
     primus.use('feathers-referrer', function(req, res){
       // Exposing a request property to services and hooks
       req.feathers.referrer = request.referrer;
     });
   }));

   app.use('messages', {
     create(data, params, callback) {
       // When called via Primus:
       params.referrer // referrer from request
     }
   });

``params.provider``
~~~~~~~~~~~~~~~~~~~

For any :doc:`./services` made through a Primus
socket ``params.provider`` will be set to ``primus``. In a
:doc:`./hooks` this can for example be used to prevent external
users from making a service method call:

.. code:: js

   app.service('users').hooks({
     before: {
       remove(context) {
         // check for if(context.params.provider) to prevent any external call
         if(context.params.provider === 'primus') {
           throw new Error('You can not delete a user via Primus');
         }
       }
     }
   });

``params.query``
~~~~~~~~~~~~~~~~

``params.query`` will contain the query parameters sent from the client.

.. important:: Only ``params.query`` is passed between the server and
   the client, other parts of ``params`` are not. This is for security
   reasons so that a client can’t set things like ``params.user`` or the
   database options. You can always map from ``params.query`` to
   :doc:`./hooks`.

params.connection
~~~~~~~~~~~~~~~~~

``params.connection`` is the connection object that can be used with
:doc:`./channels`. It is the same object as ``req.feathers``
in a Primus middleware as `shown in the ``params`` section <#params>`_.

.. |npm version| image:: https://img.shields.io/npm/v/@feathersjs/primus.png?style=flat-square
   :target: https://www.npmjs.com/package/@feathersjs/primus
.. |Changelog| image:: https://img.shields.io/badge/changelog-.md-blue.png?style=flat-square
   :target: https://github.com/feathersjs/feathers/blob/master/packages/primus/CHANGELOG.md
