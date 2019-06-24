Services
========

“Services” are the heart of every Feathers application. Services are
JavaScript objects (or instances of `ES6 classes <https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Classes>`_)
that implement :ref:`services_service-method`. Feathers itself
will also add some :ref:`services_feathers-functionality` to its services.

.. _services_service-methods:

Service methods
---------------

Service methods are pre-defined
`CRUD <https://en.wikipedia.org/wiki/Create,_read,_update_and_delete>`_
methods that your service object can implement (or that have already
been implemented by one of the :doc:`./databases/common`.. Below is a complete example of the
Feathers *service interface* as a normal JavaScript object either
returning a `Promise <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise>`_
or using
`async/await <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/async_function>`_:

.. code-block:: js

  const myService = {
    find(params) {
      return Promise.resolve([]);
    },
    get(id, params) {},
    create(data, params) {},
    update(id, data, params) {},
    patch(id, data, params) {},
    remove(id, params) {},
    setup(app, path) {}
  }

  app.use(‘/my-service’, myService);

.. code-block:: js

  const myService = {
    async find(params) { return []; },
    async get(id, params) {},
    async create(data, params) {},
    async update(id, data, params) {},
    async patch(id, data, params) {},
    async remove(id, params) {},
    setup(app, path) {}
  }

  app.use(‘/my-service’, myService);


Services can also be an instance of an `ES6 class <https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Classes>`_:

.. code-block:: js

  class MyService {
    find(params) { return Promise.resolve([]); }
    get(id, params) {}
    create(data, params) {}
    update(id, data, params) {}
    patch(id, data,params) {}
    remove(id, params) {}
    setup(app, path) {}
  }

  app.use(‘/my-service’, new MyService());

.. code-block:: js

  class MyService {
    async find(params) { return []; }
    async get(id, params) {}
    async create(data, params) {}
    async update(id, data, params) {}
    async patch(id, data, params) {}
    async remove(id, params) {}
    setup(app, path) {}
  }

  app.use(‘/my-service’, new MyService()); {%- endcodetabs %}

.. tip::
   Methods are optional, and if a method is not implemented
   Feathers will automatically emit a ``NotImplemented`` error.

..

.. important::
   Always use the service returned by
   ``app.service(path)`` not the service object (the ``myService``
   object above) directly. See the `app.service documentation <./application.md#servicepath>`_ for more information.

Service methods must return a `Promise <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise>`_
or be declared as ``async`` and have the following parameters:

-  ``id`` — The identifier for the resource. A resource is the data identified by a unique id.
-  ``data`` — The resource data.
-  ``params`` - Additional parameters for the method call, see :ref:`services-params`

Once registered, the service can be retrieved and used via :ref:`application_servicepath`.

.. code:: js

   const myService = app.service('my-service');

   myService.find().then(items => console.log('.find()', items));
   myService.get(1).then(item => console.log('.get(1)', item));

Keep in mind that services don’t have to use databases. You could easily
replace the database in the example with a package that uses some API
to, for example, pull in GitHub stars or stock ticker data.

.. important:: This section describes the general usage of service
   methods and how to implement them. They are already implemented by
   the official Feathers database adapters. For specifics on how to use
   the database adapters, see the :doc:`./databases/common`.

.. _services-params:

params
~~~~~~

``params`` contain additional information for the service method call.
Some properties in ``params`` can be set by Feathers already. Commonly
used are:

-  ``params.query`` - the query parameters from the client, either
   passed as URL query parameters (see the :doc:`./express`
   chapter) or through websockets (see :doc:`./socketio` or
   :doc:`./primus`).
-  ``params.provider`` - The transport (``rest``, ``socketio`` or
   ``primus``) used for this service call. Will be ``undefined`` for
   internal calls from the server (unless passed explicitly).
-  :doc:`./authentication/server` or passed explicitly.
-  ``params.connection`` - If the service call has been made by a
   real-time transport (e.g. through websockets), ``params.connection``
   is the connection object that can be used with
   :doc:`./channels`.

..

.. important:: For external calls only ``params.query`` will be sent
   between the client and server. If not passed, ``params.query`` will
   be ``undefined`` for internal calls.

.find(params)
~~~~~~~~~~~~~

``service.find(params) -> Promise`` - Retrieves a list of all resources
from the service. Provider parameters will be passed as
``params.query``.

.. code:: js

   app.use('/messages', {
     find(params) {
       return Promise.resolve([
         {
           id: 1,
           text: 'Message 1'
         }, {
           id: 2,
           text: 'Message 2'
         }
       ]);
     }
   });

..

.. note:: ``find`` does not have to return an array; it can also
   return an object. The database adapters already do this for
   :ref:`databases/common_pagination`.

.get(id, params)
~~~~~~~~~~~~~~~~

``service.get(id, params) -> Promise`` - Retrieves a single resource
with the given ``id`` from the service.

.. code:: js

   app.use('/messages', {
     get(id, params) {
       return Promise.resolve({
         id,
         text: `You have to do ${id}!`
       });
     }
   });

.create(data, params)
~~~~~~~~~~~~~~~~~~~~~

``service.create(data, params) -> Promise`` - Creates a new resource
with ``data``. The method should return a ``Promise`` with the newly
created data. ``data`` may also be an array.

.. code:: js

   app.use('/messages', {
     messages: [],

     create(data, params) {
       this.messages.push(data);

       return Promise.resolve(data);
     }
   });

..

.. important:: A successful ``create`` method call emits the
   :ref:`events_created`.

.update(id, data, params)
~~~~~~~~~~~~~~~~~~~~~~~~~

``service.update(id, data, params) -> Promise`` - Replaces the resource
identified by ``id`` with ``data``. The method should return a
``Promise`` with the complete, updated resource data. ``id`` can also be
``null`` when updating multiple records, with ``params.query``
containing the query criteria.

.. important:: A successful ``update`` method call emits the
   :ref:`events_updated`.

.patch(id, data, params)
~~~~~~~~~~~~~~~~~~~~~~~~

``patch(id, data, params) -> Promise`` - Merges the existing data of the
resource identified by ``id`` with the new ``data``. ``id`` can also be
``null`` indicating that multiple resources should be patched with
``params.query`` containing the query criteria.

The method should return with the complete, updated resource data.
Implement ``patch`` additionally (or instead of) ``update`` if you want
to distinguish between partial and full updates and support the
``PATCH`` HTTP method.

.. important:: A successful ``patch`` method call emits the
   :ref:`events_patched`.

.remove(id, params)
~~~~~~~~~~~~~~~~~~~

``service.remove(id, params) -> Promise`` - Removes the resource with
``id``. The method should return a ``Promise`` with the removed
resource. ``id`` can also be ``null``, which indicates the deletion of
multiple resources, with ``params.query`` containing the query criteria.

.. important:: A successful ``remove`` method call emits the
   :ref:`events_remove`.

.setup(app, path)
~~~~~~~~~~~~~~~~~

``service.setup(app, path) -> Promise`` is a special method that
initializes the service, passing an instance of the Feathers application
and the path it has been registered on.

For services registered before ``app.listen`` is invoked, the ``setup``
function of each registered service is called on invoking
``app.listen``. For services registered after ``app.listen`` is invoked,
``setup`` is called automatically by Feathers when a service is
registered.

``setup`` is a great place to initialize your service with any special
configuration or if connecting services that are very tightly coupled
(see below), as opposed to using :doc:`hooks/readme`.

.. code:: js

   // app.js
   'use strict';

   const feathers = require('@feathersjs/feathers');
   const rest = require('@feathersjs/express/rest');

   class MessageService {
     get(id, params) {
       return Promise.resolve({
         id,
         read: false,
         text: `Feathers is great!`,
         createdAt: new Date.getTime()
       });
     }
   }

   class MyService {
     setup(app) {
       this.app = app;
     }

     get(name, params) {
       const messages = this.app.service('messages');

       return messages.get(1)
         .then(message => {
           return { name, message };
         });
     }
   }

   const app = feathers()
     .configure(rest())
     .use('/messages', new MessageService())
     .use('/my-service', new MyService())

   app.listen(3030);

.. _services_feathers-functionality:

Feathers functionality
----------------------

When registering a service, Feathers (or its plugins) can also add its
own methods to a service. Most notably, every service will automatically
become an instance of a `NodeJS
EventEmitter <https://nodejs.org/api/events.html#events_class_eventemitter>`_.

.hooks(hooks)
~~~~~~~~~~~~~

Register :doc:`./hooks` for this service.

.publish([event, ] publisher)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Register an event publishing callback. For more information, see the
:doc:`./channels`.

.mixin(mixin)
~~~~~~~~~~~~~

``service.mixin(mixin) -> service`` extends the functionality of a
service. For more information see the
`Uberproto <https://github.com/daffl/uberproto>`_ project page.

.on(eventname, listener)
~~~~~~~~~~~~~~~~~~~~~~~~

Provided by the core `NodeJS EventEmitter
.on <https://nodejs.org/api/events.html#events_emitter_on_eventname_listener>`_.
Registers a ``listener`` method (``function(data) {}``) for the given
``eventname``.

.. important:: For more information about service events, see the
   :doc:`./events`.

.emit(eventname, data)
~~~~~~~~~~~~~~~~~~~~~~

Provided by the core `NodeJS EventEmitter
.emit <https://nodejs.org/api/events.html#events_emitter_emit_eventname_args>`_.
Emits the event ``eventname`` to all event listeners.

.. important:: For more information about service events, see the
   :doc:`./events`.

.removeListener(eventname, [ listener ])
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Provided by the core `NodeJS EventEmitter
.removeListener <https://nodejs.org/api/events.html#events_emitter_removelistener_eventname_listener>`_.
Removes all listeners, or the given listener, for ``eventname``.

.. important:: For more information about service events, see the
   :doc:`./events`.
