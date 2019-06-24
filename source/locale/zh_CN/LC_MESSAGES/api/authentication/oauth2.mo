��                        �  f   �  '   T  X  |     �     �     �  7     �   G  A   >     �     �  o   �       �   %        �  -  #   �  �   �     v	  �   	    t
  *  �  >   �  :   �  A   (  @   j  8   �     �  ~  �  f   }  '   �  6       C     P     ^  /   }  �   �  C   �     �     �  o   �     j  �   �      J  b  k  #   �  �   �     �  �   �    r    �  >   �  :   �  A     @   \  8   �     �   Additional passport strategy options can be provided based on the OAuth1 strategy you are configuring. An example of customizing the Verifier: By default the ``Verifier`` takes everything returned by the provider and attaches it to the ``entity`` (ie. the user object) under the provider name. You will likely want to customize the data that is returned. This can be done by adding a ``before`` hook to both the ``update`` and ``create`` service methods on your ``entity``\ ’s service. Client Usage Configuration Customizing The OAuth Response For example you might have a login button for Facebook: If your api and frontend live on separate domains, you will need to manually setup a handler to pass the access token back to the frontend application. `See this FAQ <https://docs.feathersjs.com/faq/readme.html#oauth-is-not-setting-the-cookie>`_. In most cases initializing the module is as simple as doing this: OAuth2 Authentication Options Registering the OAuth2 plugin will automatically set up routes to handle the OAuth redirects and authorization. The ``Verifier`` class The ``Verifier`` class can be extended so that you customize it’s behavior without having to rewrite and test a totally custom local Passport implementation. Although that is always an option if you don’t want use this plugin. The main initialization function This is the verification class that handles the OAuth2 verification by looking up the entity (normally a ``user``) on a given service and either creates or updates the entity and returns them. It has the following methods that can all be overridden. All methods return a promise except ``verify``, which has the exact same signature as `passport-oauth2 <https://github.com/jaredhanson/passport-oauth2>`_. This module contains 2 core pieces: This will pull from your global authentication object in your config file. It will also mix in the following defaults, which can be customized. Verifier When this module is registered server side, whether you are using ``feathers-authentication-client`` or not the user has to navigate to the authentication strategy url. This could be by setting ``window.location`` or through a link in your app. Whenever you authenticate with an OAuth2 provider such as Facebook, the provider sends back an ``accessToken``, ``refreshToken``, and a ``profile`` that contains the authenticated entity’s information based on the OAuth2 ``scopes`` you have requested and been granted. [@feathersjs/authentication-oauth2](https://github.com/feathersjs/authentication-oauth2) is a server side module that allows you to use any `Passport <http://passportjs.org/>`_ OAuth2 authentication strategy within your Feathers application. There are hundreds of them! Some commonly used ones are: `Facebook <https://github.com/jaredhanson/passport-facebook>`_ `Github <https://github.com/jaredhanson/passport-github>`_ `Google <https://github.com/jaredhanson/passport-google-oauth2>`_ `Instagram <https://github.com/jaredhanson/passport-instagram>`_ `Spotify <https://github.com/JMPerez/passport-spotify>`_ |npm version| |Changelog| Project-Id-Version: feathers docs 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-06-21 16:00+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 Additional passport strategy options can be provided based on the OAuth1 strategy you are configuring. An example of customizing the Verifier: 默认情况下，``Verifier``接受提供程序返回的所有内容，并将其附加到提供程序名称下的``entity``（即用户对象）。您可能希望自定义返回的数据。这可以通过在``entity`` \的服务上为``update``和``create``服务方法添加一个``before``挂钩来完成。 Client Usage Configuration Customizing The OAuth Response 例如，您可能有Facebook的登录按钮： 如果您的api和前端位于不同的域中，则需要手动设置处理程序以将访问令牌传递回前端应用程序。 `请参阅此常见问题<https://docs.feathersjs.com/faq/readme.html#oauth-is-not-setting-the-cookie>`_。 在大多数情况下，初始化模块就像这样做一样简单: OAuth2身份验证 Options Registering the OAuth2 plugin will automatically set up routes to handle the OAuth redirects and authorization. The ``Verifier`` class 可以扩展``Verifier``类，以便您可以自定义它的行为，而无需重写和测试完全自定义的本地Passport实现。虽然如果您不想使用此插件，这始终是一个选项。 The main initialization function 这是验证类，它通过在给定服务上查找实体（通常是“用户”）来处理OAuth2验证，并创建或更新实体并返回它们。它具有以下可以覆盖的方法。除了``verify``之外，所有方法都返回一个promise，它与`passport-oauth2 <https://github.com/jaredhanson/passport-oauth2>`_具有完全相同的签名。 This module contains 2 core pieces: This will pull from your global authentication object in your config file. It will also mix in the following defaults, which can be customized. Verifier 当该模块是注册服务器端时，无论您是否使用``feathers-authentication-client``，用户都必须导航到身份验证策略URL。这可以通过设置``window.location``或通过应用程序中的链接来实现。 每当您使用OAuth2提供程序（如Facebook）进行身份验证时，提供程序都会发回一个“accessToken”，“refreshToken”和一个“profile”，其中包含基于OAuth2“scopes”的经过身份验证的实体信息。你已经要求并获得了批准。 [@ feathersjs / authentication-oauth2]（https://github.com/feathersjs/authentication-oauth2）是一个服务器端模块，允许您使用任何`Passport <http://passportjs.org/>`_ OAuth2身份验证您的Feathers应用程序中的策略。有数百个！一些常用的是： `Facebook <https://github.com/jaredhanson/passport-facebook>`_ `Github <https://github.com/jaredhanson/passport-github>`_ `Google <https://github.com/jaredhanson/passport-google-oauth2>`_ `Instagram <https://github.com/jaredhanson/passport-instagram>`_ `Spotify <https://github.com/JMPerez/passport-spotify>`_ |npm version| |Changelog| 