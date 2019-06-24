API
===

This section describes all the APIs of Feathers and its individual
modules.

-  **Core:** Feathers core functionality

   -  :doc:`application` - The main Feathers application
      API
   -  :doc:`services` - Service objects and their methods and
      Feathers specific functionality
   -  :doc:`hooks` - Pluggable middleware for service methods
   -  :doc:`events` - Events sent by Feathers service methods
   -  :doc:`channels` - Decide what events to send to
      connected real-time clients
   -  :doc:`errors` - A collection of error classes used
      throughout Feathers
   -  :doc:`configuration` - A node-config wrapper to
      initialize configuration of a server side application.

-  **Transports:** Expose a Feathers application as an API server

   -  :doc:`express` - Feathers Express framework bindings,
      REST API provider and error middleware.
   -  :doc:`socketio` - The Socket.io real-time transport
      provider
   -  :doc:`primus` - The Primus real-time transport provider

-  **Client:** More details on how to use Feathers on the client

   -  :doc:`client` - Feathers client usage in Node, React
      Native and the browser (also with Webpack and Browserify)
   -  :doc:`client/rest` - Feathers client and direct REST API
      server usage
   -  :doc:`client/socketio` - Feathers client and direct
      Socket.io API server usage
   -  :doc:`client/primus` - Feathers client and direct Primus
      API server usage

-  **Authentication:** Feathers authentication mechanism

   -  :doc:`authentication/server` - The main authentication
      server configuration
   -  :doc:`authentication/client` - A client for a Feathers
      authentication server
   -  :doc:`authentication/local` - Local email/password
      authentication
   -  :doc:`authentication/jwt` - JWT authentication
   -  :doc:`authentication/oauth1` - Obtain a JWT through
      oAuth1
   -  :doc:`authentication/oauth2` - Obtain a JWT through
      oAuth2

-  **Database:** Feathers common database adapter API and querying
   mechanism

   -  :doc:`databases/adapters` - A list of supported
      database adapters
   -  :doc:`databases/common` - Database adapter common
      initialization and configuration API
   -  :doc:`databases/querying` - The common querying
      mechanism
