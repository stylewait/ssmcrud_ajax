<%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2018/11/17
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core_1_1" prefix="c"%>


<html>
<head>
    <%--web路径问题
        不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
        以/开始的相对路径，找资源，以服务器的路径为标准（http://localhost:3306）；需要加上项目名
    --%>
    <link rel="stylesheet" href="../../static/bs/css/bootstrap.css">
    <script src="../../static/bs/js/jquery.min.js"></script>
    <script src="../../static/bs/js/holder.min.js"></script>
    <script src="../../static/bs/js/bootstrap.js"></script>
    <title>员工列表</title>
    <style>
        *{
            font-family: "微软雅黑";
        }
        .row{
            padding-bottom: 15px;
        }
    </style>
</head>
<body>
<%--搭建显示页面--%>
    <div class="container">
        <%--标题--%>
        <div class="row">
            <div class="col-md-12">
                <h1 class="page-header">SSM框架整合-CRUD</h1>
            </div>
        </div>

        <%--按钮--%>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-success">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>

        <%--显示表格数据--%>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr class="success">
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list }" var="emp">
                        <tr class="success">
                            <th>${emp.empId }</th>
                            <th>${emp.empName }</th>
                            <th>${emp.gender=="M"?"男":"女" }</th>
                            <th>${emp.email }</th>
                            <th>${emp.department.deptName }</th>
                            <th>
                                <button class="btn btn-success btn-sm">
                                    <span class="glyphicon glyphicon-pencil"></span> 编辑
                                </button>
                                <button class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </button>
                            </th>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>
        <%--显示分页信息--%>
        <div class="row">
            <%--分页文字信息--%>
            <div class="col-md-6">
                <p>当前第 <kbd>${pageInfo.pageNum }</kbd> 页，总 <kbd>${pageInfo.pages }</kbd> 页，总 <kbd>${pageInfo.total }</kbd> 记录数</p>
            </div>
            <%--分页条信息--%>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="/emps?pn=1 ">首页</a></li>
                        <c:if test="${pageInfo.hasPreviousPage }">
                            <li>
                                <a href="/emps?pn=${pageInfo.pageNum - 1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>


                        <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                            <%--当前页高亮显示--%>
                            <c:if test="${page_Num == pageInfo.pageNum }">
                                <li class="active"><a href="#">${page_Num }</a></li>
                            </c:if>
                            <%--添加其他页的链接--%>
                            <c:if test="${page_Num != pageInfo.pageNum }">
                                <li><a href="/emps?pn=${page_Num}">${page_Num }</a></li>
                            </c:if>

                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage }">
                            <li>
                                <a href="/emps?pn=${pageInfo.pageNum + 1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>


                        <li><a href="/emps?pn=${pageInfo.pages }">尾页</a></li>
                    </ul>
                </nav>
            </div>

        </div>
    </div>

</body>
</html>
