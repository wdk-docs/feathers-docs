��    !      $              ,  [   -  �   �     �  <   �  6   �  h     a   n  a   �  s   2  j   �  f     ^   x     �  �   �     �  �   �  [  5  �   �	  �   ~
     A     S  
   e  >   p     �     �     �     �  h   �  	   F  4   P  	   �  �   �  ~  3  [   �  �        	  <     6   O  h   �  a   �  a   Q  s   �  j   '  f   �  ^   �     X  �   _       �     ;  �  �   �  �   �     �     �  
   �  >   �     	          #     +  h   7  	   �  4   �  	   �  �   �   All fields that do not contain special query parameters are compared directly for equality. All official database adapters support a common way for querying, sorting, limiting and selecting ``find`` method calls as part of ``params.query``. Querying also applies ``update``, ``patch`` and ``remove`` method calls if the ``id`` is set to ``null``. Equality Find all records that do not equal the given property value. Find all records that match any of the given criteria. Find all records where the property does (``$in``) or does not (``$nin``) match any of the given values. Find all records where the value is less (``$lt``) or less and equal (``$lte``) to a given value. Find all records where the value is more (``$gt``) or more and equal (``$gte``) to a given value. For MongoDB also see `feathers-mongodb-fuzzy-search <https://www.npmjs.com/package/feathers-mongodb-fuzzy-search>`_ For NeDB also see `feathers-nedb-fuzzy-search <https://www.npmjs.com/package/feathers-nedb-fuzzy-search>`_ For additional search functionality see `feathers-solr <https://www.npmjs.com/package/feathers-solr>`_ For further discussions see `this issue <https://github.com/feathersjs/feathers/issues/334>`_. Querying Regular expressions (converted in a hook) for Mongoose, MongoDB and NeDB. See `this comment <https://github.com/feathersjs/feathers/issues/334#issuecomment-234432108>`_ Search Searching is not part of the common querying syntax since it is very specific to the database you are using. Many databases already support their own search syntax: Some database adapters like `KnexJS <https://github.com/feathersjs-ecosystem/feathers-knex>`_, `RethinkDB <https://github.com/feathersjs-ecosystem/feathers-rethinkdb>`_ and `Elasticsearch <https://github.com/feathersjs-ecosystem/feathers-elasticsearch>`_ also support non-standard query parameters which are described in their documentation pages. With :doc:`common#pagination`. to just get the number of available records set ``$limit`` to ``0``. This will only run a (fast) counting query against the database and return a page object with the ``total`` and an empty ``data`` array. `$like for Sequelize <http://docs.sequelizejs.com/en/latest/docs/querying/>`_ which can be set in `params.sequelize <https://github.com/feathersjs-ecosystem/feathers-sequelize#paramssequelize>`_ ``$gt``, ``$gte`` ``$in``, ``$nin`` ``$limit`` ``$limit`` will return only the number of results you specify: ``$lt``, ``$lte`` ``$ne`` ``$or`` ``$select`` ``$select`` allows to pick which fields to include in the result. This will work for any service method. ``$skip`` ``$skip`` will skip the specified number of results: ``$sort`` ``$sort`` will sort based on the object you provide. It can contain a list of properties by which to sort mapped to the order (``1`` ascending, ``-1`` descending). Project-Id-Version: feathers docs 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-06-22 19:22+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 All fields that do not contain special query parameters are compared directly for equality. 所有官方数据库适配器都支持查询，排序，限制和选择``find``方法调用的常用方法，作为``params.query``的一部分。如果将``id``设置为``null``，查询也会应用``update``，``patch``和``remove``方法调用。 Equality Find all records that do not equal the given property value. Find all records that match any of the given criteria. Find all records where the property does (``$in``) or does not (``$nin``) match any of the given values. Find all records where the value is less (``$lt``) or less and equal (``$lte``) to a given value. Find all records where the value is more (``$gt``) or more and equal (``$gte``) to a given value. For MongoDB also see `feathers-mongodb-fuzzy-search <https://www.npmjs.com/package/feathers-mongodb-fuzzy-search>`_ For NeDB also see `feathers-nedb-fuzzy-search <https://www.npmjs.com/package/feathers-nedb-fuzzy-search>`_ For additional search functionality see `feathers-solr <https://www.npmjs.com/package/feathers-solr>`_ For further discussions see `this issue <https://github.com/feathersjs/feathers/issues/334>`_. 查询 Regular expressions (converted in a hook) for Mongoose, MongoDB and NeDB. See `this comment <https://github.com/feathersjs/feathers/issues/334#issuecomment-234432108>`_ Search Searching is not part of the common querying syntax since it is very specific to the database you are using. Many databases already support their own search syntax: 一些数据库适配器，如`KnexJS <https://github.com/feathersjs-ecosystem/feathers-knex>`_，`RethinkDB <https://github.com/feathersjs-ecosystem/feathers-rethinkdb>`_和`Elasticsearch <https://github.com/feathersjs-ecosystem/feathers-elasticsearch>`_还支持其文档页面中描述的非标准查询参数。 用：doc：`common＃pagination`。只是得到可用记录的数量``$ limit``设置为``0``。这只会对数据库运行一个（快速）计数查询，并返回一个带有``total``和一个空``data``数组的页面对象。 `$like for Sequelize <http://docs.sequelizejs.com/en/latest/docs/querying/>`_ which can be set in `params.sequelize <https://github.com/feathersjs-ecosystem/feathers-sequelize#paramssequelize>`_ ``$gt``, ``$gte`` ``$in``, ``$nin`` ``$limit`` ``$limit`` will return only the number of results you specify: ``$lt``, ``$lte`` ``$ne`` ``$or`` ``$select`` ``$select`` allows to pick which fields to include in the result. This will work for any service method. ``$skip`` ``$skip`` will skip the specified number of results: ``$sort`` ``$sort`` will sort based on the object you provide. It can contain a list of properties by which to sort mapped to the order (``1`` ascending, ``-1`` descending). 