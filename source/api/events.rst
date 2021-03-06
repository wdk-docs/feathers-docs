Events
======

Events are the key part of Feathers real-time functionality. All events
in Feathers are provided through the `NodeJS EventEmitter <https://nodejs.org/api/events.html>`_ interface. This
section describes

-  A quick overview of the `NodeJS EventEmitter interface <#eventemitters>`_
-  The standard `service events <#service-events>`_
-  How to allow sending `custom events <#custom-events>`_ from the
   server to the client

..

.. important:: For more information on how to send real-time events
   to clients, see the :doc:`./channels`.

EventEmitters
-------------

Once registered, any :doc:`./services` gets turned into a
standard `NodeJS EventEmitter <https://nodejs.org/api/events.html>`_
and can be used accordingly.

.. code:: js

   const messages = app.service('messages');

   // Listen to a normal service event
   messages.on('patched', message => console.log('message patched', message));

   // Only listen to an event once
   messsages.once('removed', message =>
     console.log('First time a message has been removed', message)
   );

   // A reference to a handler
   const onCreatedListener = message => console.log('New message created', message);

   // Listen `created` with a handler reference
   messages.on('created', onCreatedListener);

   // Unbind the `created` event listener
   messages.removeListener('created', onCreatedListener);

   // Send a custom event
   messages.emit('customEvent', {
     type: 'customEvent',
     data: 'can be anything'
   });

.. _events_service-events:

Service Events
--------------

Any service automaticaly emits ``created``, ``updated``, ``patched`` and
``removed`` events when the respective service method returns
successfully. This works on the client as well as on the server. When
the client is using :doc:`socketio` or
:doc:`primus`, events will be pushed automatically from the
server to all connected clients. This is essentially how Feathers does
real-time.

.. tip:: Events are not fired until all of your
   :doc:`./hooks` have executed.

.. raw:: html

   <!-- -->

..

.. important:: For information on how those events are published for
   real-time updates to connected clients, see the :doc:`./channels`.

Additionally to the event ``data``, all events also get the `hook context <./hooks>`_ from their method call passed as the second
parameter.

created
~~~~~~~

The ``created`` event will fire with the result data when a service
``create`` returns successfully.

.. code:: js

   const feathers = require('@feathersjs/feathers');
   const app = feathers();

   app.use('/messages', {
     create(data, params) {
       return Promise.resolve(data);
     }
   });

   // Retrieve the wrapped service object which will be an event emitter
   const messages = app.service('messages');

   messages.on('created', (message, context) => console.log('created', message));

   messages.create({
     text: 'We have to do something!'
   });

updated, patched
~~~~~~~~~~~~~~~~

The ``updated`` and ``patched`` events will fire with the callback data
when a service ``update`` or ``patch`` method calls back successfully.

.. code:: js

   const feathers = require('@feathersjs/feathers');
   const app = feathers();

   app.use('/my/messages/', {
     update(id, data) {
       return Promise.resolve(data);
     },

     patch(id, data) {
       return Promise.resolve(data);
     }
   });

   const messages = app.service('my/messages');

   messages.on('updated', (message, context) => console.log('updated', message));
   messages.on('patched', message => console.log('patched', message));

   messages.update(0, {
     text: 'updated message'
   });

   messages.patch(0, {
     text: 'patched message'
   });

removed
~~~~~~~

The ``removed`` event will fire with the callback data when a service
``remove`` calls back successfully.

.. code:: js

   const feathers = require('@feathersjs/feathers');
   const app = feathers();

   app.use('/messages', {
     remove(id, params) {
       return Promise.resolve({ id });
     }
   });

   const messages = app.service('messages');

   messages.on('removed', (message, context) => console.log('removed', message));
   messages.remove(1);

.. _events_custom-events:

Custom events
-------------

By default, real-time clients will only receive the `standard events <#service-events>`_. However, it is possible to define a list of
custom events on a service as ``service.events`` that should also be
passed when ``service.emit('customevent', data)`` is called on the
server. The ``context`` for custom events won’t be a full hook context
but just an object containing ``{ app, service, path, result }``.

.. important:: Custom events can only be sent from the server to the
   client, not the other way (client to server). :ref:`faq_how-do-i-create-custom-methods`

For example, a payment service that sends status events to the client
while processing a payment could look like this:

.. code:: js

   class PaymentService {
     constructor() {
       this.events = ['status'];
     },

     create(data, params) {
       createStripeCustomer(params.user).then(customer => {
         this.emit('status', { status: 'created' });
         return createPayment(data).then(result => {
           this.emit('status', { status: 'completed' });
         });
       });
     }
   }

The :doc:`./databases/common` also take a list of custom events as an :ref:`databases_common_serviceoptions`.

.. code:: js

   const service = require('feathers-<adaptername>'); // e.g. `feathers-mongodb`

   app.use('/payments', service({
     events: [ 'status' ],
     Model
   });

Using ``service.emit`` custom events can also be sent in a hook:

.. code:: js

   app.service('payments').hooks({
     after: {
       create(context) {
         context.service.emit('status', { status: 'completed' });
       }
     }
   });

Custom events can be :ref:`channels_publishing` just like standard events and
listened to it in a :ref:`client_socketio_listening-to-events`.

.. code:: js

   client.service('payments').on('status', data => {});

   socket.on('payments status', data => {});
