��          T               �      �      �   �   �   e   �  j       �  ~  �       "     �   A  ^     ]   p  �  �   Customizing the JWT Claims How JSON Web Tokens Work This guide is a work in progress. There’s some useful information here while we make it more user friendly in the context of Feathers. In the meantime, here are a couple of resources on JWT to get more familiar with how it works, in general: `The Auth0 JWT Documentation <https://auth0.com/docs/jwt>`_ - If you want a good high-level overview. `The IETF JWT Specification <https://tools.ietf.org/html/rfc7519>`_ - If you want to get really technical. ``feathers-authentication@1.x`` allows you to customize the data stored inside the JWT. We refer to the data in the JWT as the ``payload``. There are a few reserved attributes, which in the `Official JWT Spec <https://tools.ietf.org/html/rfc7519>`_ are called ``claims``. You can customize some of these claims in the :ref:`api_auth_server-otions`. To get more familiar with the purpose of each ``claim``, please refer to `Section 4 of the Official JWT Specification <https://tools.ietf.org/html/rfc7519#section-4>`_. Project-Id-Version: feathers docs 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-06-25 14:49+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 自定义JWT声明 JSON Web Tokens 是如何工作的 本指南正在进行中.这里有一些有用的信息,而我们在Feathers的上下文中使它更加用户友好.与此同时,以下是JWT的一些资源,以便更加熟悉它的工作原理,一般来说: `Auth0 JWT文档 <https://auth0.com/docs/jwt>`_  - 如果你想要一个很好的高级概述. `IETF JWT规范 <https://tools.ietf.org/html/rfc7519>`_  - 如果你想获得真正的技术. ``feathers-authentication @1.x`` 允许您自定义存储在JWT中的数据.我们将JWT中的数据称为 ``payload``.有一些保留属性,在 `JWT官方规范 <https://tools.ietf.org/html/rfc7519>`_ 中被称为 ``claim``. 您可以在 :ref:`api_auth_server-otions` 中自定义其中一些声明. 为了更加熟悉每个 ``claim`` 的目的, 请参阅官方 `JWT规范的第4节 <https://tools.ietf.org/html/rfc7519#section-4>`_. 