��    3      �              L     M  R   `  �   �     �  \   �  7   �     )     :  e   S     �    �      �         0  �   E  &   		  2   0	     c	     t	     �	     �	     �	  �   �	     W
  >  `
  '   �     �  �   �     c  h   w  �   �     �  �  �     7  @   T  7   �  :   �  +     `   4  H   �  5   �          )     C     ]     w     �     �     �  E   �  ~       �  @   �  �   �     �  L   �  3   �     -     @  U   Y  '   �    �     �  $        %  �   2  "   �                2     ?     L     Y  �   f                    3  �   @     �  U   �  �   B     �  _  �     R  7   o  4   �  :   �  !     R   9  H   �  4   �     
            9      S      m      �      �      �   =   �    A messages service A service does not have to implement all those methods but must have at least one. A service object can be registered on a Feathers application by calling ``app.use(path, service)``. ``path`` will be the name of the service (and the URL if it is exposed as an API which we will learn later). And run it with Below is an example of Feathers service interface as a normal object and a JavaScript class: Below is the complete updated ``app.js`` with comments: Call another API Call other services like For more information about service, service methods and parameters see the :doc:`../../api/services`. If we now run the file via In this chapter we learned about services as Feathers core concept for abstracting data operations. We also saw how a service sends events which we will use later to create real-time applications. First, we will look at :doc:`./hooks` which is the other key part of how Feathers works. Interacting with the file system Now that we know how service methods look like we can implement our own chat message service that allows us to find, create, remove and update messages in-memory. Here we will use a JavaScript class to work with our messages but as we’ve seen above it could also be a normal object. Processing a payment Protocol independent means that to a Feathers service it does not matter if it has been called internally, through a REST API or websockets (both of which we will look at later) or any other way. Reading and/or writing from a database Returning the current weather for a location, etc. Sending an email Service event Service events Service method Service methods Service methods are `CRUD <https://en.wikipedia.org/wiki/Create,_read,_update_and_delete>`_ methods that a service object can implement. Feathers service methods are: Services Services are the heart of every Feathers application and are JavaScript objects or instances of `a class <https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Classes>`_ that implement certain methods. Services provide a uniform, protocol independent interface for how to interact with any kind of data like: The parameters for service methods are: Using services We can retrieve that service via ``app.service(path)`` and then call any of its service methods. Add the following to the end of ``app.js``: We should see this: We will see how the event handlers are logging the information of created and deleted message like this: We will see later that this is the key to how Feathers enables real-time functionality. For now, let’s update the ``processMessages`` function in ``app.js`` as follows: What’s next? When you register a service it will automatically become a `NodeJS EventEmitter <https://nodejs.org/api/events.html>`_ that sends events with the new data when a service method that modifies data (``create``,``update``, ``patch`` and ``remove``) returns. Events can be listened to with ``app.service('messages').on('eventName', data => {})``. Here is a list of the service methods and their corresponding events: ``create`` - Create new data ``data`` - The data sent by the user (for creating and updating) ``find`` - Find all data (potentially matching a query) ``get`` - Get a single data entry by its unique identifier ``id`` - The unique identifier for the data ``params`` (*optional*) - Additional parameters, for example the authenticated user or the query ``patch`` - Update one or more data entries by merging with the new data ``remove`` - Remove one or more existing data entries ``service.create()`` ``service.on('created')`` ``service.on('patched')`` ``service.on('removed')`` ``service.on('updated')`` ``service.patch()`` ``service.remove()`` ``service.update()`` ``update`` - Update an existing data entry by completely replacing it Project-Id-Version: feathers docs 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-06-21 16:15+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 消息服务 服务不必实现所有这些方法, 但必须至少有一个.  可以通过调用 ``app.use(path, service)`` 在Feathers应用程序上注册服务对象.  ``path`` 将是服务的名称(以及URL, 如果它作为API公开, 我们将在后面介绍).  并运行它 下面是作为普通对象和JavaScript类的Feathers服务接口的示例: 下面是带有注释的完整更新的 ``app.js``: 调用另一个API 调用其它其他服务 有关服务, 服务方法和参数的详细信息, 请参阅 :doc:`../api/services`. 如果我们现在通过运行该文件 在本章中, 我们了解了作为Feathers核心概念的服务, 用于抽象数据操作. 我们还了解了服务如何发送我们稍后将用于创建实时应用程序的事件. 首先, 我们将看看 :doc:`hooks`, 这是Feathers如何工作的另一个关键部分.  与文件系统交互 现在我们知道了服务方法的样子, 我们可以实现自己的聊天消息服务, 允许我们在内存中查找, 创建, 删除和更新消息. 在这里, 我们将使用JavaScript类来处理我们的消息, 但正如我们在上面看到的, 它也可能是一个普通的对象.  处理付款 独立于协议意味着对于Feathers服务而言, 如果它是通过REST API或websockets(我们将在稍后讨论)或其他任何方式在内部调用它并不重要.  从数据库中读取和/或写入 返回当前天气的位置等 发送电子邮件 服务事件 服务事件 服务方式 服务方式 服务方法是服务对象可以实现的 `CRUD <https://en.wikipedia.org/wiki/Create,_read,_update_and_delete>`_ 方法. Feathers服务方​​法有: 服务 服务是每个Feathers应用程序的核心, 是JavaScript对象或实现某些 `方法的类 <https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Classes>`_ 的实例. 服务提供统一的, 独立于协议的界面, 用于如何与任何类型的数据交互: 服务方法的参数是: 使用服务 我们可以通过 ``app.service(path)`` 检索该服务, 然后调用它的任何服务方法. 将以下内容添加到 ``app.js`` 的末尾: 我们应该看到这一点: 我们将看到事件处理程序如何记录这样创建和删除的消息的信息: 我们稍后会看到, 这是Feathers如何实现实时功能的关键. 现在, 让我们更新 ``app.js`` 中的 ``processMessages`` 函数, 如下所示: 下一步是什么? 注册服务时, 它将自动成为 `NodeJS EventEmitter <https://nodejs.org/api/events.html>`_, 当修改数据的服务方法时, 它会发送带有新数据的事件, (``update``, ``patch`` 和 ``remove``)返回. 可以使用 ``app.service('messages').on('eventName', data => {})`` 来监听事件. 以下是服务方法及其相应事件的列表: ``create`` - 创建新数据 ``data`` - 用户发送的数据(用于创建和更新) ``find`` - 查找所有数据(可能与查询匹配) ``get`` - 通过其唯一标识符获取单个数据条目 ``id`` - 数据的唯一标识符 ``params`` (*optional*) - 其他参数, 例如经过身份验证的用户或查询 ``patch`` - 通过与新数据合并来更新一个或多个数据条目 ``remove`` - 删除一个或多个现有数据条目 ``service.create()`` ``service.on('created')`` ``service.on('patched')`` ``service.on('removed')`` ``service.on('updated')`` ``service.patch()`` ``service.remove()`` ``service.update()`` ``update`` - 通过完全替换现有数据条目来更新它 