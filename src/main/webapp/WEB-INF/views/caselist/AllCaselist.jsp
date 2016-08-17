<%@ include file="../common/IncludeTop.jsp"%>



<div>
    <form:form modelAttribute="taskcases" action="${pageContext.request.contextPath}/caselist/newtaskcase">

        <table>
            <tr>
                <td>任务id:</td>
                <td><form:input path="taskid" /></td>
            </tr>
        </table>


        <table>
            <tr>
                <th><b>用例id</b></th>
                <th><b>用例名称</b></th>
                <th><b>一级模块</b></th>
                <th><b>二级模块</b></th>
                <th><b>三级模块</b></th>
                <th><b>用例步骤</b></th>
                <th><b>已评审?</b></th>
                <th><b>已自动化?</b></th>
                <th><b>创建人</b></th>
                <th><b>修改人</b></th>
                <th><b>任务用例?</b></th>
                <th><b>编辑?</b></th>
                <th><b>删除?</b></th>
            </tr>
            <c:forEach var="caselist" items="${allCaselist}">
                <tr>
                    <td>${caselist.caseid}</td>
                    <td>${caselist.casename}</td>
                    <td>${caselist.belongmodulea}</td>
                    <td>${caselist.belongmoduleb}</td>
                    <td>${caselist.belongmodulec}</td>
                    <td>${caselist.casestep}</td>
                    <td>${caselist.reviewed}</td>
                    <td>${caselist.automated}</td>
                    <td>${caselist.creator}</td>
                    <td>${caselist.modifier}</td>
                    <td>
                        <input type = "checkbox" name = "caseids" value = "${caselist.caseid}" />
                    </td>
                    <td><a href="${pageContext.request.contextPath}/caselist/editCaselistForm?caseid=${caselist.caseid}">编辑</a></td>
                    <td><a href="${pageContext.request.contextPath}/caselist/delCaselist?caseid=${caselist.caseid}">删除</a></td>
                </tr>
            </c:forEach>

            <input type="submit" name="taskcase" value="提交" />
        </table>
    </form:form>
</div>


<%@ include file="../common/IncludeBottom.jsp"%>