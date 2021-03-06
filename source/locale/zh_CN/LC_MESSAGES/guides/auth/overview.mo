��          L               |      }   &   �   �   �   �  q  �   �  ~  �     \     m  �   �  X    �   w   A Single Auth Endpoint An Overview of Feathers Authentication Here are a couple of examples that show what this single ``/authentication`` endpoint looks like in practice. This first one shows the payload for ``local`` auth in the new version. In the previous ``feathers-authentication`` plugin, there were two auth endpoints: ``/auth/local`` was for username and password login. ``/auth/token`` was for JWT-based login. In making the latest version, we decided that auth could be more like the rest of Feathers. We created an ``/authentication`` service. This single endpoint handles both ``local``, and ``jwt`` logins, and more. The Auk release of FeathersJS includes a powerful new :doc:`../../api/authentication/server` built on top of `PassportJS <http://www.passportjs.org/>`_. The new plugins are very flexible, allowing you to customize nearly everything. Project-Id-Version: feathers docs 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-06-21 21:06+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 单个Auth端点  Feathers 认证概述 以下是一些示例,显示了这个单一的 ``/authentication`` 端点在实践中的样子.第一个显示新版本中 ``local`` auth的有效负载. 在之前的 ``feathers-authentication`` 插件中,有两个auth端点: ``/auth/local`` 用于用户名和密码登录. ``/auth/token`` 用于基于JWT的登录.在制作最新版本时,我们认为auth可能更像其他的Feathers.我们创建了一个 ``/authentication`` 服务.这个单一的端点处理 ``local`` 和 ``jwt`` 登录等等. FeatusJS的 Auk 版本包含一个强大的新的建立在 `PassportJS <http://www.passportjs.org/>`_ 之上的 :doc:`../../api/authentication/server`.新插件非常灵活,允许您自定义几乎所有内容. 