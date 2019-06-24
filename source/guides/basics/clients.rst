Client use
==========

So far, we have seen that Feathers with its services, events and hooks
can also be used in the browser, which is a very unique feature. By
implementing custom services that talk to an API in the browser,
Feathers allows us to structure any client-side application with any
framework.

This is exactly what Feathers client-side services do. In order to
connect to a Feathers server, a client creates Services that use a REST
or websocket connection to relay method calls and allow listening to
events from the server. This means that we can use a client-side
Feathers application to transparently talk to a Feathers server the same
way we’d use it locally (as we’ve done in previous examples)!

.. note:: The following examples demonstrate using the Feathers
   client through a ``<script>`` tag. For more information on using a
   module loader like Webpack or Browserify and loading individual
   modules see the :doc:`../api/client`.

Real-time client
----------------

In the :doc:`./real-time` we saw an example of how
to directly use a websocket connection to make service calls and listen
to events. We can also use a browser Feathers application and client
services that use this connection. Let’s update ``public/client.js`` to:

.. code:: js

   // Create a websocket connecting to our Feathers server
   const socket = io('http://localhost:3030');
   // Create a Feathers application
   const app = feathers();
   // Configure Socket.io client services to use that socket
   app.configure(feathers.socketio(socket));

   app.service('messages').on('created', message => {
     console.log('Someone created a message', message);
   });

   async function createAndList() {
     await app.service('messages').create({
       text: 'Hello from Feathers browser client'
     });

     const messages = await app.service('messages').find();

     console.log('Messages', messages);
   }

   createAndList();

REST client
-----------

We can also create services that communicate via REST using many
different Ajax libraries like `jQuery <https://jquery.com>`_ or
`Axios <https://github.com/axios/axios>`_. For this example, we will
use
`fetch <https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API>`_
since it’s built-in modern browsers.

.. important:: REST services can only emit real-time events locally,
   to themselves. REST does not support real-time updates from the
   server.

Since we are making a cross-domain request, we first have to enable
`Cross-Origin Resource sharing
(CORS) <https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS>`_ on
the server. Update ``app.js`` to:

.. code:: js

   const feathers = require('@feathersjs/feathers');
   const express = require('@feathersjs/express');
   const socketio = require('@feathersjs/socketio');
   const memory = require('feathers-memory');

   // This creates an app that's both an Express and Feathers app
   const app = express(feathers());

   // Enable CORS
   app.use(function(req, res, next) {
     res.header('Access-Control-Allow-Origin', '*');
     res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
     next();
   });

   // Turn on JSON body parsing for REST services
   app.use(express.json())
   // Turn on URL-encoded body parsing for REST services
   app.use(express.urlencoded({ extended: true }));
   // Set up REST transport using Express
   app.configure(express.rest());

   // Configure the Socket.io transport
   app.configure(socketio());

   // On any real-time connection, add it to the 'everybody' channel
   app.on('connection', connection => app.channel('everybody').join(connection));

   // Publish all events to the 'everybody' channel
   app.publish(() => app.channel('everybody'));

   // Initialize the messages service
   app.use('messages', memory({
     paginate: {
       default: 10,
       max: 25
     }
   }));

   // Set up an error handler that gives us nicer errors
   app.use(express.errorHandler());

   // Start the server on port 3030
   const server = app.listen(3030);

   server.on('listening', () => console.log('Feathers API started at localhost:3030'));

..

.. note:: This is just a basic middleware setting the headers. In
   production (and applications created by the Feathers generator) we
   will use the `cors <https://github.com/expressjs/cors>`_ module.

Then we can update ``public/client.js`` to:

.. code:: js

   // Create a Feathers application
   const app = feathers();
   // Initialize a REST connection
   const rest = feathers.rest('http://localhost:3030');
   // Configure the REST client to use 'window.fetch'
   app.configure(rest.fetch(window.fetch));

   app.service('messages').on('created', message => {
     console.log('Created a new message locally', message);
   });

   async function createAndList() {
     await app.service('messages').create({
       text: 'Hello from Feathers browser client'
     });

     const messages = await app.service('messages').find();

     console.log('Messages', messages);
   }

   createAndList();

What’s next?
------------

In this chapter we learned how to transparently connect to another
Feathers server and use its services as we previously did when accessing
them server-side. In the :doc:`./generator` we’ll
briefly look at the Feathers generator (CLI) and the patterns it uses to
structure an application before jumping into :doc:`../chat/readme`.
