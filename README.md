# ssmcrud_ajax
### 学习网上的视频教程，做的一个小demo，整合SSM，并对员工进行增删改查的操作
#### SSM框架整合技术点
* 基础框架-ssm（SpringMVC + Spring + MyBatis）
* 数据库-MySQL
* 前端框架-BootStrap快速搭建简洁美观的界面
* 项目的依赖管理-Maven
* 分页-Pagehelper
* 逆向工程-MyBatis Generator

***
#### 基础环境搭建
1. 创建一个Maven工程
2. 引入项目依赖的jar包
    * spring
    * springMVC
    * mybatis
    * 数据库连接池、驱动包
    * 其他包（jstl\servlet-api\junit）
3. 引入bootstrap前端框架
4. 编写ssm整合的关键配置文件
    * web.xml，spring，springmvc，mybatis
    * 使用mybatis的逆向工程（MyBatis Generator）生成对应的bean以及mapper
5. 测试mapper
***
#### 查询
1. 访问index.jsp页面
2. index.jsp页面发送出查询员工列表请求
3. EmployeeController来接受请求，查出员工数据
4. 来到list.jsp页面进行展示

URI：/emps
***
#### 查询-使用纯Ajax技术
1. index.jsp页面直接发送ajax请求进行员工分页数据的查询
2. 服务器将查出的数据，以json字符串的形式返回给浏览器
3. 浏览器收到js字符串。可以使用js对json进行解析，使用js通过dom增删改的形式来改变页面
4. 返回json，实现客户端的无关性

***
#### 新增-逻辑
1. 在index.jsp页面点击"新增"
2. 弹出新增对话框
3. 去数据库查询部门列表，显示在对话框中
4. 用户输入数据，并进行校验
    * jQuery前端校验；
    * ajax用户名重复校验，重要数据后端校验(JSR303)唯一约束；
5. 完成保存
6. URI：
   * /emp/{id} 如果发送的是GET请求，则是    查询员工；
   * /emp   POST    保存员工；
   * /emp   PUT     修改员工；
   * /emp/{id}  DELETE      删除员工；
****
#### 修改-逻辑
1. 点击编辑
2. 弹出用户修改的模态框(显示用户信息)
3. 点击更新，完成用户修改

****
#### 删除-逻辑
1. 单个删除
    * URI：/emp/{id} DELETE

***
#### 总结
**参考：ssmcrud_ajax项目总结.png**
