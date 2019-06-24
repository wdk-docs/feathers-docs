Creating a Chat Application
===========================

Well alright! Let’s build our first Feathers app! We’re going to build a
real-time chat app with `NeDB <https://github.com/louischatriot/nedb>`_
as the database. It’s a great way to cover all the things that you’d
need to do in a real world application and how Feathers can help. It
also makes a lot more sense to have a real-time component than a Todo
list. :wink:

In this tutorial, you go from nothing to a real-time chat app complete
with signup, login, token based authentication and authorization all
with a RESTful and real-time API. You can go through this guide right
away, but we recommend you first get a basic understanding of Feathers
in the :doc:`basics/readme`.

.. figure:: ./assets/chat.gif
   :alt: Chat app screenshot

   Chat app screenshot

You can find a complete working example
`here <https://github.com/feathersjs/feathers-chat>`_.

:doc:`./creating`

Create a new application using the generator.

:doc:`./service`

Add an API endpoint to store messages.

:doc:`./authentication`

Add user registration and login.

:doc:`./processing`

Sanitize and process user data.

:doc:`./frontend`

Learn how to use Feathers in the browser by creating a small real-time
chat frontend.

:doc:`./testing`

Write automated unit tests and add code coverage to our chat
application.
