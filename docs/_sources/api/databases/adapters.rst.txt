Database adapters
=================

Feathers database adapters are modules that provide
:doc:`services` that implement standard
`CRUD <https://en.wikipedia.org/wiki/Create,_read,_update_and_delete>`_
functionality for a specific database using a :doc:`./common` for initialization and settings and providing a
:doc:`./querying`.

.. important:: :doc:`../services` allow to implement
   access to *any* database, the database adapters listed here are just
   convenience wrappers with a common API. You can still get Feathers
   functionality for databases that are not listed here. Also have a
   look at the list of `community database adapters <https://github.com/feathersjs/awesome-feathersjs#database>`_

The following databases are supported:

+-----------------------------------+-----------------------------------+
| Database                          | Adapter                           |
+===================================+===================================+
| In memory                         | `feathers-memory <https://github. |
|                                   | com/feathersjs-ecosystem/feathers |
|                                   | -memory>`_,                      |
|                                   | `feathers-nedb <https://github.co |
|                                   | m/feathersjs-ecosystem/feathers-n |
|                                   | edb>`_                           |
+-----------------------------------+-----------------------------------+
| Localstorage, AsyncStorage        | `feathers-localstorage <https://g |
|                                   | ithub.com/feathersjs-ecosystem/fe |
|                                   | athers-localstorage>`_           |
+-----------------------------------+-----------------------------------+
| Filesystem                        | `feathers-nedb <https://github.co |
|                                   | m/feathersjs-ecosystem/feathers-n |
|                                   | edb>`_                           |
+-----------------------------------+-----------------------------------+
| MongoDB                           | `feathers-mongodb <https://github |
|                                   | .com/feathersjs-ecosystem/feather |
|                                   | s-mongodb>`_,                    |
|                                   | `feathers-mongoose <https://githu |
|                                   | b.com/feathersjs-ecosystem/feathe |
|                                   | rs-mongoose>`_                   |
+-----------------------------------+-----------------------------------+
| MySQL, PostgreSQL, MariaDB,       | `feathers-knex <https://github.co |
| SQLite, MSSQL                     | m/feathersjs-ecosystem/feathers-k |
|                                   | nex>`_,                          |
|                                   | `feathers-sequelize <https://gith |
|                                   | ub.com/feathersjs-ecosystem/feath |
|                                   | ers-sequelize>`_                 |
+-----------------------------------+-----------------------------------+
| Elasticsearch                     | `feathers-elasticsearch <https:// |
|                                   | github.com/feathersjs-ecosystem/f |
|                                   | eathers-elasticsearch>`_         |
+-----------------------------------+-----------------------------------+
| RethinkDB                         | `feathers-rethinkdb <https://gith |
|                                   | ub.com/feathersjs-ecosystem/feath |
|                                   | ers-rethinkdb>`_                 |
+-----------------------------------+-----------------------------------+

Memory/Filesystem
-----------------

-  `feathers-memory <https://github.com/feathersjs-ecosystem/feathers-memory>`_
   - An in-memory database adapter
-  `feathers-localstorage <https://github.com/feathersjs-ecosystem/feathers-localstorage>`_
   - An adapter for :doc:`../authentication/client` that can use
   the browsers `LocalStorage <https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage>`_
   or ReactNative’s `AsyncStorage <https://facebook.github.io/react-native/docs/asyncstorage.html>`_.
-  `feathers-nedb <https://github.com/feathersjs-ecosystem/feathers-nedb>`_
   - A database adapter for `NeDB <https://github.com/louischatriot/nedb>`_ an in-memory or file
   system based standalone database.

SQL
---

-  `feathers-knex <https://github.com/feathersjs-ecosystem/feathers-knex>`_
   - An adapter for `KnexJS <http://knexjs.org/>`_, an SQL query builder for NodeJS supporting PostgreSQL, MySQL, SQLite and MSSQL
-  `feathers-sequelize <https://github.com/feathersjs-ecosystem/feathers-sequelize>`_
   - An adapter for `Sequelize <http://docs.sequelizejs.com/>`_ an ORM for NodeJS supporting PostgreSQL, MySQL, SQLite and MSSQL
-  `feathers-objection <https://github.com/feathersjs-ecosystem/feathers-objection>`_
   - A service adapter for `Objection.js <https://vincit.github.io/objection.js>`_ - A minimal SQL ORM built on top of Knex.

NoSQL
-----

-  `feathers-mongoose <https://github.com/feathersjs-ecosystem/feathers-mongoose>`_
   - A database adapter for `Mongoose <http://mongoosejs.com/>`_ an Object Modelling library for NodeJS and MongoDB
-  `feathers-mongodb <https://github.com/feathersjs-ecosystem/feathers-mongodb>`_
   - A database adapter for `MongoDB <https://www.mongodb.com/>`_ using the official NodeJS database driver
-  `feathers-elasticsearch <https://github.com/feathersjs-ecosystem/feathers-elasticsearch>`_
   - A database adapter for `Elasticsearch <https://github.com/elastic/elasticsearch>`_
-  `feathers-rethinkdb <https://github.com/feathersjs-ecosystem/feathers-rethinkdb>`_
   - A database adapter for `RethinkDB <https://www.rethinkdb.com/>`_ a real-time database.
