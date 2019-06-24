��    .      �              �     �          +     A     T     f     �     �     �     �     �     �               0     D  �   Y     E     S     b     i     r  -   �  *   �  A   �  �    �   �     �  (  	  Z   +
  �   �
  �   x       0   �  Z   �       2   8  i   k  �   �     �  &   �  /   �  O   �  !   O     q  ~  �     
          8     N     a     s     �     �     �     �     �     �          %     =     Q  �   f     "     2     ?     F     M  !   Z  "   |  G   �  �  �  �   n     Y    l  H     �   �  �   �  m     "   �  Z   �       /   $  Z   T  �   �     I  #   d  )   �  K   �  $   �     #   400: ``BadRequest`` 401: ``NotAuthenticated`` 402: ``PaymentError`` 403: ``Forbidden`` 404: ``NotFound`` 405: ``MethodNotAllowed`` 406: ``NotAcceptable`` 408: ``Timeout`` 409: ``Conflict`` 411: ``LengthRequired`` 422: ``Unprocessable`` 429: ``TooManyRequests`` 500: ``GeneralError`` 501: ``NotImplemented`` 502: ``BadGateway`` 503: ``Unavailable`` All of the Feathers plugins will automatically emit the appropriate Feathers errors for you. For example, most of the database adapters will already send ``Conflict`` or ``Unprocessable`` errors with the validation errors from the ORM. Custom errors Error Handling Errors Examples Feathers errors Feathers errors contain the following fields: Here are a few ways that you can use them: Here is an example error handler you can add to app.hooks errors. It is important to make sure that errors get cleaned up before they go back to the client. `Express error handling middlware <https://docs.feathersjs.com/api/express.html#expresserrorhandler>`_ works only for REST calls. If you want to make sure that ws errors are handled as well, you need to use `App Hooks <https://docs.feathersjs.com/guides/basics/hooks.html#application-hooks>`_. App Error Hooks get called on an error to every service call regardless of transport. Promises swallow errors if you forget to add a ``catch()`` statement. Therefore, you should make sure that you **always** call ``.catch()`` on your promises. To catch uncaught errors at a global level you can add the code below to your top-most file. Server Side Errors The ``@feathersjs/errors`` module contains a set of standard error classes used by all other Feathers modules as well as an `Express error handler <https://expressjs.com/en/guide/error-handling.html>`_ to format those - and other - errors and setting the correct HTTP status codes for REST calls. The following error types, all of which are instances of ``FeathersError``, are available: To convert a Feathers error back to an object call ``error.toJSON()``. A normal ``console.log`` of a JavaScript Error object will not automatically show those additional properties described above (even though they can be accessed directly). You can create custom errors by extending from the ``FeathersError`` class and calling its constructor with ``(msg, name, code, className, data)``: ``className`` - A CSS class name that can be handy for styling errors based on the error type. (e.g. “bad-request” , etc.) ``className`` - The full name of the error class ``code`` - An `HTTP error code <https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html>`_ ``code`` - The HTTP status code ``data`` - Additional data to include in the error ``data`` - An object containing anything you passed to a Feathers error except for the ``errors`` object. ``errors`` - An object containing whatever was passed to a Feathers error inside ``errors``. This is typically validation errors or if you want to group multiple errors together. ``message`` - The error message ``message`` - The error message string ``name`` - The error name (e.g. ``my-errror``) ``name`` - The error name (e.g. “BadRequest”, “ValidationError”, etc.) then add it to the error.all hook |npm version| |Changelog| Project-Id-Version: feathers docs 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-06-22 18:54+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 400: ``BadRequest`` 401: ``NotAuthenticated`` 402: ``PaymentError`` 403: ``Forbidden`` 404: ``NotFound`` 405: ``MethodNotAllowed`` 406: ``NotAcceptable`` 408: ``Timeout`` 409: ``Conflict`` 411: ``LengthRequired`` 422: ``Unprocessable`` 429: ``TooManyRequests`` 500: ``GeneralError`` 501: ``NotImplemented`` 502: ``BadGateway`` 503: ``Unavailable`` 所有Feathers插件都会自动为您发出相应的Feathers错误.例如,大多数数据库适配器已经发送了来自ORM的验证错误的 ``Conflict`` 或 ``Unprocessable`` 错误. 自定义错误 错误处理 错误 例子 羽毛错误 Feathers错误包含以下字段: 您可以使用以下几种方法: 这是一个示例错误处理程序,您可以添加到app.hooks错误. 确保在返回客户端之前清除错误非常重要. `快速错误处理middlware <https://docs.feathersjs.com/api/express.html#expresserrorhandler>`_ 仅适用于REST调用.如果你想确保也处理ws错误,你需要使用 `App Hooks <https://docs.feathersjs.com/guides/basics/hooks.html#application-hooks>`_. App Error Hooks会在每次服务调用时调用错误,无论传输如何. 如果您忘记添加 ``catch()`` 语句,则承诺吞下错误.因此,你应该确保你**总是**在你的承诺上调用 ``.catch()``.要在全局级别捕获未捕获的错误,您可以将以下代码添加到最顶层的文件中. 服务器端错误 ``feathersjs/errors`` 模块包含一组标准错误类,供所有其他Feathers模块使用,以及一个 `Express错误处理程序 <https://expressjs.com/en/guide/error-handling.html>`_ 格式化那些 - 以及其他 - 错误并为REST调用设置正确的HTTP状态代码. 可以使用以下错误类型,它们都是 ``FeathersError`` 的实例: 要将Feathers错误转换回对象,请调用 ``error.toJSON()``. JavaScript Error对象的正常 ``console.log`` 不会自动显示上面描述的那些附加属性(即使它们可以直接访问). 您可以通过从 ``FeathersError`` 类扩展并使用 ``(msg,name,code,className,data)` 来调用其构造函数来创建自定义错误.: ``className`` - 一个CSS类名,可以根据错误类型设置样式错误. (例如  “bad-request”  等) ``className`` - 错误类的全名 ``code`` - An `HTTP error code <https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html>`_ ``code`` - HTTP状态代码 ``data`` - 要包含在错误中的其他数据 ``data`` - 包含传递给Feathers错误的任何对象的对象,除了 ``errors`` 对象. ``errors`` - 包含任何内容的对象传递给 ``errors`` 中的Feathers错误.这通常是验证错误,或者您想要将多个错误组合在一起. ``message`` - 错误消息 ``message`` - 错误消息字符串 ``name`` - 错误名称(如 ``my-error``) ``name`` - 错误名称(例如 “BadRequest”, “ValidationError” 等) 然后将它添加到error.all钩子 |npm version| |Changelog| 