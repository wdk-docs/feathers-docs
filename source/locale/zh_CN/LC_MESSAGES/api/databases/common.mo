��    0      �                     =  *  �   h       
     �   *  �        �  *   �  $   �       �   %  j   	      t  
   �     �  B   �     �  �   	  -   �	  �   �	  `   d
  �   �
  |   K  e   �  �   .  �   �  �   j  �   >  �   �  �   �  �   �  I   {  k   �  f   1  r   �  �     o         p  |   �               /     D     \     |      �  ~  �     7    C  �   L     �  	   �  �     �   �     f  &   v  $   �     �  �   �  N   �  $   �            4   '     \  �   i     �  h     E   ~  n   �  m   3  O   �  �   �  �   �  �       �   �   �   e!  �   P"  �   #  >   �#  e   $  V   j$  Z   �$  �   %  p   &     �&  i   �&     '     '     .'     C'     ['     {'      �'   **Options:** All database adapters implement a common interface for initialization, pagination, extending and querying. This chapter describes the common adapter initialization and options, how to enable and use pagination, the details on how specific service methods behave and how to extend an adapter with custom functionality. All modules also export an `ES6 class <https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Classes>`_ as ``Service`` that can be directly extended like this: Classes (ES6) Common API Disabling or changing the default pagination is not available in the client. Only ``params.query`` is passed to the server (also see a `workaround here <https://github.com/feathersjs/feathers/issues/382#issuecomment-238407741>`_) Every database adapter is an implementation of the :doc:`../services`. We recommend being familiar with services, service events and hooks before using a database adapter. Extending Adapters Find all messages belonging to room 1 or 3 Find all messages for user with id 1 Hooks If the ORM or database supports models, the model instance or reference to the collection belonging to this adapter can be found in ``adapter.Model``. This allows to easily make custom queries using that model, e.g. in a hook: Keep in mind that calling the original service methods will return a Promise that resolves with the value. Mark all unread messages as read Pagination Remove all read messages Returns a new service instance initialized with the given options. Service methods The most flexible option is weaving in functionality through :doc:`../hooks`. For example, ``createdAt`` and ``updatedAt`` timestamps could be added like this: The pagination options can be set as follows: There are two ways to extend existing database adapters. Either by extending the ES6 base class or by adding functionality through hooks. This section describes specifics on how the :doc:`../services` are implemented for all adapters. To just get the number of available records set ``$limit`` to ``0``. This will only run a (fast) counting query against the database. When ``paginate.default`` is set, ``find`` will return an *page object* (instead of the normal array) in the following form: When initializing an adapter you can set the following pagination options in the ``paginate`` object: When used via REST URLs all query values are strings. Depending on the database the values in ``params.query`` might have to be converted to the right type in a :doc:`../hooks`. ``adapter.create(data, params) -> Promise`` creates a new record with ``data``. ``data`` can also be an array to create multiple records. ``adapter.find(params) -> Promise`` returns a list of all records matching the query in :doc:`./querying`. Will either return an array with the results or a page object if `pagination is enabled <#pagination>`_. ``adapter.get(id, params) -> Promise`` retrieves a single record by its unique identifier (the field set in the ``id`` option during initialization). ``adapter.patch(id, data, params) -> Promise`` merges a record identified by ``id`` with ``data``. ``id`` can be ``null`` to allow replacing multiple records (all records that match ``params.query`` the same as in ``.find``). ``id`` can not be changed. ``adapter.remove(id, params) -> Promise`` removes a record identified by ``id``. ``id`` can be ``null`` to allow removing multiple records (all records that match ``params.query`` the same as in ``.find``). ``adapter.update(id, data, params) -> Promise`` completely replaces a single record identified by ``id`` with ``data``. Does not allow replacing multiple records (``id`` can’t be ``null``). ``id`` can not be changed. ``default`` - Sets the default number of items when ``$limit`` is not set ``events`` (*optional*) - A list of `custom service events <../events#custom-events>`_ sent by this service ``id`` (*optional*) - The name of the id field property (usually set by default to ``id`` or ``_id``). ``max`` - Sets the maximum allowed number of items per page (even if the ``$limit`` query parameter is set higher) ``multi`` (*optional*, default: ``false``) - Allow ``create`` with arrays and ``update`` and ``remove`` with id ``null`` to change multiple items. Can be ``true`` for all methods or an array of allowed methods (e.g. ``[ 'remove', 'create' ]``) ``paginate`` (*optional*) - A `pagination object <#pagination>`_ containing a ``default`` and ``max`` page size ``service([options])`` ``whitelist`` (*optional*) - A list of additional non-standard query parameters to allow (e.g ``[ '$regex', '$populate' ]``) adapter.Model adapter.create(data, params) adapter.find(params) adapter.get(id, params) adapter.patch(id, data, params) adapter.remove(id, params) adapter.update(id, data, params) Project-Id-Version: feathers docs 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-06-22 19:36+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 **选项:** 所有数据库适配器都实现了用于初始化,分页,扩展和查询的通用接口.本章介绍常见的适配器初始化和选项,如何启用和使用分页,有关特定服务方法的行为以及如何使用自定义功能扩展适配器的详细信息. 所有模块还导出一个 `ES6类 <https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Classes>`_ 作为 ``Service``, 可以像这样直接扩展: Classes (ES6) 通用API 客户端中不提供禁用或更改默认分页的功能.只有 ``params.query`` 被传递给服务器(另见 `这里 <https://github.com/feathersjs/feathers/issues/382#issuecomment-238407741>`_ 的解决方法) 每个数据库适配器都是 :doc:`../services` 的实现.我们建议在使用数据库适配器之前熟悉服务,服务事件和挂钩. 扩展适配器 查找属于房间1或3的所有邮件 查找ID为1的用户的所有消息 钩子 如果ORM或数据库支持模型,则可以在 ``adapter.Model`` 中找到模型实例或属于此适配器的集合的引用.这允许使用该模型轻松地进行自定义查询,例如,在钩子里: 请记住,调用原始服务方法将返回一个使用该值解析的Promise. 将所有未读邮件标记为已读 分页 删除所有阅读邮件 返回使用给定选项初始化的新服务实例. 服务方式 最灵活的选择是通过以下方式编织功能 :doc:`../hooks`.例如,可以像这样添加 ``createdAt`` 和 ``updatedAt`` 时间戳: 分页选项可以设置如下: 有两种方法可以扩展现有的数据库适配器.通过扩展ES6基类或通过钩子添加功能. 本节介绍如何为所有适配器实现 :doc:`services` 的细节. 要获得可用记录的数量,将 ``$limit`` 设置为 ``0``.这只会对数据库运行(快速)计数查询. 当设置 ``paginate.default`` 时, ``find`` 将返回以下形式的 *页面对象* (而不是正常数组): 初始化适配器时,可以在 ``paginate`` 对象中设置以下分页选项: 通过REST URL使用时,所有查询值都是字符串.根据数据库,``params.query`` 中的值可能必须在 :doc:`../hooks` 中转换为正确的类型. ``adapter.create(data, params) -> Promise`` 使用 ``data`` 创建一个新记录. ``data`` 也可以是一个用来创建多个记录的数组. ``adapter.find(params) - > Promise`` 返回与查询匹配的所有记录的列表 :doc:`./querying`. 如果启用了 `pagination <#pagination>`_,将返回带结果的数组或页面对象. ``adapter.get(id, params) -> Promise`` 通过其唯一标识符(初始化期间在 ``id`` 选项中设置的字段)检索单个记录. ``adapter.patch(id,data,params) - > Promise`` 将 ``id`` 标识的记录与 ``data`` 合并.  ``id`` 可以是 ``null`` 以允许替换多个记录(所有匹配 ``params.query`` 的记录与 ``.find`` 中相同).  ``id`` 无法更改. ``adapter.remove(id, params) -> Promise`` 删除由 ``id`` 标识的记录. ``id`` 可以是 ``null`` 以允许删除多个记录(所有与``params.query``匹配的记录与 ``.find`` 相同). ``adapter.update(id,data,params) - > Promise`` 完全用 ``data`` 替换 ``id`` 标识的单个记录.不允许替换多个记录(``id`` 不能是 ``null``).  ``id`` 无法更改. ``default`` - 设置未设置 ``$limit`` 时的默认项目数 ``events`` (*可选*) - 此服务发送的 `自定义服务事件 <../events #custom-events>`_ 列表 ``id`` (*可选*) - id字段属性的名称(通常默认设置为 ``id`` 或 ``_id``). ``max`` - 设置每页允许的最大项数(即使 ``$limit`` 查询参数设置得更高) ``multi`` (*可选*, 默认: ``false``) - 允许带有数组的 ``create`` 和带有 ``null`` 的 ``update`` 和 ``remove`` 来改变多个项目.对于所有方法或一组允许的方法都可以是 ``true`` (e.g. ``[ 'remove', 'create' ]``) ``paginate`` (*可选*) - 一个 `分页对象 <#pagination>`_ 包含一个 ``default`` 和 ``max`` 页面大小 ``service([options])`` ``whitelist`` (*可选*) - 允许的其他非标准查询参数列表 (e.g ``[ '$regex', '$populate' ]``) adapter.Model adapter.create(data, params) adapter.find(params) adapter.get(id, params) adapter.patch(id, data, params) adapter.remove(id, params) adapter.update(id, data, params) 