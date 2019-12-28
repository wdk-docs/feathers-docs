��          �               �  r  �       Q   ?  �   �  4     J   K     �     �  a   �  �  $  �   �  �   f	  z   Y
  �   �
  �   �       "   7  P  Z  �   �  7  �  &   �     �  G   �  d   6  ~  �  �        J     {   j  0   �  9        Q     b  N     �  �  f   T  �   �  j   �  �   �  r   �          %  6  A  �   x    I  %   d  	   �  I   �  d   �   As with any web application **you** need to guard against XSS attacks. Since Feathers persists the JWT in localstorage in the browser, if your app falls victim to a XSS attack your JWT could be used by an attacker to make malicious requests on your behalf. This is far from ideal. Therefore you need to take extra care in preventing XSS attacks. Our stance on this particular attack vector is that if you are susceptible to XSS attacks then a compromised JWT is the least of your worries because keystrokes could be logged and attackers can just steal passwords, credit card numbers, or anything else your users type directly. By default, `JWT <https://jwt.io/>`_\ ’s are stored in Local Storage (instead of cookies) to avoid CSRF attacks. For JWT, we use the ``HS256`` algorithm by default (HMAC using SHA-256 hash algorithm). If you choose to store JWT’s in cookies, your app will have CSRF vulnerabilities. Disable multiple element changes by throwing an error if ``context.id === null``. Don’t use a weak ``secret`` for you token service. The generator creates a strong one for you automatically. No need to change it. Escape any HTML and JavaScript to avoid XSS attacks. Escape any SQL (typically done by the SQL library) to avoid SQL injection. Feathers Security For more information see: Here are some things that you should be aware of when writing your app to make sure it is secure. In order to give the community time to respond and upgrade we strongly urge you report all security issues to us. Send us a PM in `Slack <http://slack.feathersjs.com>`_ or email us at hello@feathersjs.com with details and we will respond ASAP. Security issues always take precedence over bug fixes and feature work so we’ll work with you to come up with a resolution and plan and document the issue on Github in the appropriate repo. Issuing releases is typically very quick. Once an issue is resolved it is usually released immediately with the appropriate semantic version. JSON Web Tokens (JWT’s) are only signed, they are **not** encrypted. Therefore, the payload can be examined on the client. This is by design. **DO NOT** put anything that should be private in the JWT ``payload`` unless you encrypt it first. Make sure to set up proper :doc:`api/channels` so that only clients that are allowed to see them can see real-time updates Password storage inside ``@feathers/authentication-local`` uses `bcrypt <https://github.com/dcodeIO/bcrypt.js>`_. We don’t store the salts separately since they are included in the bcrypt hashes. Restrict the :doc:`api/databases/querying` to only the use cases your application requires by sanitizing ``params.query`` in a hook. Security Considerations Some of the technologies we employ Use hooks to check security roles to make sure users can only access data they should be permitted to. You can find useful hook utilities in `feathers-hooks-common <https://feathers-plus.github.io/v1/feathers-hooks-common/>`_ and `feathers-authentication-hooks <https://github.com/feathersjs-ecosystem/feathers-authentication-hooks/>`_. We run `nsp <https://github.com/nodesecurity/nsp>`_ as part of our CI. This notifies us if we are susceptible to any vulnerabilites that have been reported to the `Node Security Project <https://nodesecurity.io/>`_. We take security very seriously at Feathers. We welcome any peer review of our 100% open source code to ensure nobody’s Feathers app is ever compromised or hacked. As a web application developer you are responsible for any security breaches. We do our very best to make sure Feathers is as secure as possible. Where should I report security issues? XSS Attacks `this issue <https://github.com/feathersjs/authentication/issues/132>`_ and `this Auth0 forum thread <https://ask.auth0.com/t/stealing-jwt-from-authenticated-user/352/3>`_. Project-Id-Version: feathers docs 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-06-21 10:40+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 与任何Web应用程序一样,**您**需要防范XSS攻击.由于Feathers将JWT保留在浏览器的本地存储中,如果您的应用程序成为XSS攻击的受害者,攻击者可能会使用JWT代表您发出恶意请求.这远非理想.因此,您需要特别注意防止XSS攻击.我们对这个特定攻击媒介的立场是,如果您容易受到XSS攻击,那么受损的JWT是您最不担心的,因为可以记录击键,攻击者可以窃取密码,信用卡号或用户直接输入的任何其他内容. 默认情况下, `JWT <https://jwt.io/>`_\ 's 存储在本地存储(而不是cookie)中以避免CSRF攻击.对于JWT,我们默认使用 ``HS256`` 算法(HMAC使用SHA-256哈希算法).如果您选择将JWT存储在cookie中,您的应用程序将具有CSRF漏洞. 如果 ``context.id === null`` 则抛出错误来禁用多个元素更改. 不要为你的令牌服务使用弱的 ``secret``. 生成器会自动为您创建一个强大的生成器.无需改变它. 转义任何HTML和JavaScript以避免XSS攻击. 转义任何SQL(通常由SQL库完成)以避免SQL注入.  Feathers 安全 有关更多信息,请参阅 在编写应用程序时,您应该注意以下几点,以确保它是安全的. 为了让社区有时间回复和升级,我们强烈建议您向我们报告所有安全问题.请发送给我们一个PM的 `Slack <http://slack.feathersjs.com>`_ 或发送电子邮件至hello@feathersjs.com,我们将尽快回复.安全问题始终优先于错误修复和功能工作,因此我们将与您一起制定解决方案并计划并在相应的回购中记录Github上的问题. 发布版本通常非常快.一旦问题得到解决,通常会立即使用适当的语义版本发布. JSON Web令牌(JWT)只是签名,它们 **不是** 加密的.因此,可以在客户端上检查有效负载.这是设计的. **除非** 先加密,否则请勿在JWT ``payload`` 中放置任何私密内容. 确保设置正确的 :doc:`api/channels`, 以便只有允许查看它们的客户才能看到实时更新 ``@feathers/authentication-local`` 中的密码存储使用 `bcrypt <https://github.com/dcodeIO/bcrypt.js>`_.我们不单独存储盐,因为它们包含在bcrypt哈希中. 通过在钩子中清理 ``params.query``, 将 :doc:`api/databases/querying` 限制为应用程序所需的用例. 安全考虑因素 我们采用的一些技术 使用挂钩检查安全角色,以确保用户只能访问应允许的数据.您可以在 `feathers-hooks-common <https://feathers-plus.github.io/v1/feathers-hooks-common/>`_ 和 `feathers-authentication-hooks <https://github中找到有用的钩子实用程序.的.com/feathersjs生态系统/羽认证钩/>`_. 我们运行 `nsp <https://github.com/nodesecurity/nsp>`_ 作为CI的一部分.如果我们容易受到已向 `node 安全项目 <https://nodesecurity.io/>`_ 报告的任何漏洞的影响,则会通知我们. 我们非常重视Feathers的安全.我们欢迎任何同行评审我们的100％开源代码,以确保没有人的Feathers应用程序遭到入侵或黑客入侵.作为Web应用程序开发人员,您应对任何安全漏洞负责.我们尽最大努力确保Feathers尽可能安全. 我应该在哪里报告安全问题? XSS攻击 `这个问题 <https://github.com/feathersjs/authentication/issues/132>`_ 和 `这个Auth0论坛帖子 <https://ask.auth0.com/t/stealing-jwt-from-authenticated-user/352/3>`_. 