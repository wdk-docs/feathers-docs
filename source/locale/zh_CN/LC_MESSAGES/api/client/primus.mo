��    <      �              �     �     �       2     ?   N     �  8   �  |   �    V  J   n  H   �       !     P   8     �     �    �  &   �  ,   �  ;   	  g   M	  �  �	  �   A  �   &  n   �  q   $  �   �  1   -  k   _  �   �  d   �  J     b   i  X   �  ?   %  �   e  �   �  �   �  �   E  �   �  u        �     �       �   -  $   �     �               $     (     .     5     =     D  +   U  �   �     l  (     ~  �     '     A     P  2   l  ?   �     �  ?   �  t   1  �   �  ?   �  H   �     #     7  P   P     �     �  �   �  &   �  ,   �  ;   �  g   :  @  �  �   �  7   �   n    !  q   o!  �   �!  1   x"  T   �"  �   �"  d   �#  J   G$  b   �$  X   �$  ?   N%  �   �%  �    &  �   �&  �   n'  �   �'  u   �(     )     ')     :)  �   V)  $   *     &*     >*     E*     M*     Q*     W*     ^*     f*     m*  +   ~*  �   �*     �+  (   �+   @feathersjs/primus-client Authentication Client use in NodeJS Completely replace a single or multiple resources. Create a new resource with ``data`` which may also be an array. Direct connection In NodeJS a Primus client can be initialized as follows: In the browser the Primus client library (usually at ``primus/primus.js``) always has to be loaded using a ``<script>`` tag: In the browser, the connection can be established by loading the client from ``primus/primus.js`` and instantiating a new ``Primus`` instance. Unlike HTTP calls, websockets do not have a cross-origin restriction in the browser so it is possible to connect to any Feathers server. Initialize the Primus client using a given socket and the default options. Initialize the Primus client using a given socket and the given options. Listening to events Loading the Primus client library Merge the existing data of a single or multiple resources with the new ``data``. Options can be: Primus Client Primus sockets are also used to *call* service methods. Using sockets for both, calling methods and receiving real-time events is generally faster than using :doc:`./express` and there is no need to use both, REST and websockets in the same client application at the same time. Remove a single or multiple resources: Retrieve a single resource from the service. Retrieves a list of all matching resources from the service See the `Primus docs <https://github.com/primus/primus#connecting-from-the-browser>`_ for more details. Service methods can be called by emitting a ``<servicepath>::<methodname>`` event with the method parameters. ``servicepath`` is the name the service has been registered with (in ``app.use``) without leading or trailing slashes. An optional callback following the ``function(error, data)`` Node convention will be called with the result of the method call or any errors that might have occurred. Sockets can be authenticated by sending the ``authenticate`` event with the ``strategy`` and the payload. For specific examples see the “Direct Connection” section in the :doc:`../authentication/jwt` authentication chapters. The ``@feathersjs/primus-client`` module allows to connect to services exposed through the :doc:`primus` via the configured websocket library. The ``created`` event will be published with the callback data when a service ``create`` returns successfully. The ``removed`` event will be published with the callback data when a service ``remove`` calls back successfully. The ``updated`` and ``patched`` events will be published with the callback data when a service ``update`` or ``patch`` method calls back successfully. The timeout per service can be changed like this: This will make the ``Primus`` object globally available. Module loader options are currently not available. We recommend using Feathers and the ``@feathersjs/primus-client`` module on the client if possible. To use a direct Primus connection without using Feathers on the client however see the `Direct connection <#direct-connection>`_ section. Will call ``app.service('messages').create({ "text": "I really have to iron" }, {})`` on the server. Will call ``app.service('messages').create`` on the server with the array. Will call ``app.service('messages').find({ query: { status: 'read', user: 10 } })`` on the server. Will call ``app.service('messages').get(1, { query: { fetch: 'all' } })`` on the server. Will call ``app.service('messages').get(1, {})`` on the server. Will call ``app.service('messages').patch(2, { "read": true }, {})`` on the server. The ``id`` can also be ``null`` to update multiple resources: Will call ``app.service('messages').patch(null, { complete: true }, { query: { complete: false } })`` on the server to change the status for all read app.service(‘messages’). Will call ``app.service('messages').remove(2, { query: { cascade: true } })`` on the server. The ``id`` can also be ``null`` to remove multiple resources: Will call ``app.service('messages').remove(null, { query: { read: 'true' } })`` on the server to delete all read app.service(‘messages’). Will call ``app.service('messages').update(2, { "text": "I really have to do laundry" }, {})`` on the server. The ``id`` can also be ``null`` to update multiple resources: Will call ``app.service('messages').update(null, { complete: true }, { query: { complete: false } })`` on the server. ``find`` ``primus(socket)`` ``primus(socket, options)`` ``timeout`` (default: 5000ms) - The time after which a method call fails and times out. This usually happens when calling a service or service method that does not exist. app.configure(primusClient(socket)); const app = feathers(); create created get patch remove removed update updated, patched which is where Feathers will set up Primus. {% codetabs name=“Modular”, type=“js” -%} const feathers = require(‘@feathersjs/feathers’); const primusClient = require(‘@feathersjs/primus-client’); const socket = new Primus(‘http://api.my-feathers-server.com’); {%- endcodetabs %} |GitHub stars| |npm version| |Changelog| Project-Id-Version: feathers docs 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-06-22 19:18+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 @feathersjs/primus-client Authentication 客户端在NodeJS中使用 Completely replace a single or multiple resources. Create a new resource with ``data`` which may also be an array. Direct connection 在NodeJS中，可以按如下方式初始化Primus客户端： 在浏览器中，Primus客户端库(通常位于 ``primus/primus.js``)总是必须使用 ``<script>`` 标签加载: 在浏览器中，可以通过从``primus / primus.js``加载客户端并实例化一个新的``Primus``实例来建立连接。与HTTP调用不同，websockets在浏览器中没有跨源限制，因此可以连接到任何Feathers服务器。 使用给定套接字和默认选项初始化Primus客户端。 Initialize the Primus client using a given socket and the given options. Listening to events 加载Primus客户端库 Merge the existing data of a single or multiple resources with the new ``data``. Options can be: Primus 客户端 Primus套接字也用于* call *服务方法。使用套接字，调用方法和接收实时事件通常比使用：doc：`。/ express`更快，并且不需要同时在同一客户端应用程序中同时使用REST和websockets。 Remove a single or multiple resources: Retrieve a single resource from the service. Retrieves a list of all matching resources from the service See the `Primus docs <https://github.com/primus/primus#connecting-from-the-browser>`_ for more details. 可以通过使用方法参数发出``<servicepath> :: <methodname>``事件来调用服务方法。 ``servicepath``是服务已注册的名称(在``app.use``中)，没有前导或尾随斜杠。将使用方法调用的结果或可能发生的任何错误调用``function(error，data)``Node约定之后的可选回调。 Sockets can be authenticated by sending the ``authenticate`` event with the ``strategy`` and the payload. For specific examples see the “Direct Connection” section in the :doc:`../authentication/jwt` authentication chapters. The :doc:`primus` via the configured websocket library. The ``created`` event will be published with the callback data when a service ``create`` returns successfully. The ``removed`` event will be published with the callback data when a service ``remove`` calls back successfully. The ``updated`` and ``patched`` events will be published with the callback data when a service ``update`` or ``patch`` method calls back successfully. The timeout per service can be changed like this: 这将使 ``Primus`` 对象全局可用。模块加载程序选项目前不可用。 如果可能的话，我们建议在客户端上使用Feathers和 ``feathersress/primus-client``模块。要在客户端上不使用Feathers而直接使用Primus连接，请参阅 `直接连接 <#direct-connection>`_ 部分。 Will call ``app.service('messages').create({ "text": "I really have to iron" }, {})`` on the server. Will call ``app.service('messages').create`` on the server with the array. Will call ``app.service('messages').find({ query: { status: 'read', user: 10 } })`` on the server. Will call ``app.service('messages').get(1, { query: { fetch: 'all' } })`` on the server. Will call ``app.service('messages').get(1, {})`` on the server. Will call ``app.service('messages').patch(2, { "read": true }, {})`` on the server. The ``id`` can also be ``null`` to update multiple resources: Will call ``app.service('messages').patch(null, { complete: true }, { query: { complete: false } })`` on the server to change the status for all read app.service(‘messages’). Will call ``app.service('messages').remove(2, { query: { cascade: true } })`` on the server. The ``id`` can also be ``null`` to remove multiple resources: Will call ``app.service('messages').remove(null, { query: { read: 'true' } })`` on the server to delete all read app.service(‘messages’). Will call ``app.service('messages').update(2, { "text": "I really have to do laundry" }, {})`` on the server. The ``id`` can also be ``null`` to update multiple resources: Will call ``app.service('messages').update(null, { complete: true }, { query: { complete: false } })`` on the server. ``find`` ``primus(socket)`` ``primus(socket, options)`` ``timeout`` (default: 5000ms) - The time after which a method call fails and times out. This usually happens when calling a service or service method that does not exist. app.configure(primusClient(socket)); const app = feathers(); create created get patch remove removed update updated, patched which is where Feathers will set up Primus. {% codetabs name=“Modular”, type=“js” -%} const feathers = require(‘@feathersjs/feathers’); const primusClient = require(‘@feathersjs/primus-client’); const socket = new Primus(‘http://api.my-feathers-server.com’); {%- endcodetabs %} |GitHub stars| |npm version| |Changelog| 