<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<form id="pagerForm" method="post" action="BK3002/payList.do">
    <input type="hidden" name="pageNum" value="1" />
    <input type="hidden" name="orderField" value="" />
    <input type="hidden" name="orderDirection" value="asc" />
</form>

<div class="pageHeader">
<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="BK3002/payList.do" method="post">
    <input type="hidden" id="numPerPage" name="numPerPage" value="${page.numPerPage}">
    <div class="searchBar">
        <div class="titleBar">
            <div class="navTitle">还款管理/</div><div class="pageTitle">还款信息列表</div>
        </div>
        <div class="pageFormContent">
            <label>贷款单号：</label><input type="text" name="loanrecordid" value="" />
            <label>客户名称：</label><input type="text" name="loanpersonname" value="" />
        </div>
        <div class="subBar">
            <ul>
                <li><div class="buttonActive"><div class="buttonContent"><button type="submit">查&nbsp;&nbsp;询</button></div></div></li>
            </ul>
        </div>
    </div>
    </form>
</div>
<div class="pageContent">
    <div class="panelBar">
        <ul class="toolBar">
        	<c:if test="${sessionScope.roleName=='财务经理' || sessionScope.roleName=='放款员'}">
            <li><a class="edit" href="BK3002/editMpayrecord/{id}.do" title="修改还款记录" target="dialog" width="800" height="400" rel="BK300101"><span>修改</span></a></li>
            </c:if>
            <li><a class="edit" href="BK3002/viewMpayrecord/{id}.do" title="查看还款记录" target="dialog" width="800" height="400" rel="BK300102"><span>查看</span></a></li>
        </ul>
    </div>
    <table id="gridTable" class="table" width="100%" layoutH="194">
        <thead>
            <tr>
                <th style="font-weight:bold; text-align: center;"  width="5%">序号</th>
				<th style="font-weight:bold; text-align: center;" width="10%" style="font-weight:bold;">贷款单号</th>
				<th style="font-weight:bold; text-align: center;" width="10%" style="font-weight:bold;">客户名称</th>
				<th style="font-weight:bold; text-align: center;" width="10%" style="font-weight:bold;">预计还款日期</th>
				<th style="font-weight:bold; text-align: center;" width="10%" style="font-weight:bold;">预计还款利息（万元）</th>
				<th style="font-weight:bold; text-align: center;" width="10%" style="font-weight:bold;">预计还款金额（万元）</th>
				<th style="font-weight:bold; text-align: center;" width="10%" style="font-weight:bold;">实际还款日期</th>
				<th style="font-weight:bold; text-align: center;" width="10%" style="font-weight:bold;">实际还款利息（万元）</th>
				<th style="font-weight:bold; text-align: center;" width="10%" style="font-weight:bold;">实际还款金额（万元）</th>
				<th style="font-weight:bold; text-align: center;" width="10%" style="font-weight:bold;">还款人</th>
				<th style="font-weight:bold; text-align: center;" width="5%" style="font-weight:bold;">还款状态</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="mpayrecord" items="${page.resultList}" varStatus="status">
				<c:if test="${mpayrecord.status=='0'}">
					<tr target="id" rel="${mpayrecord.id}">
						<td align="center">${status.index+1}</td>
						<td align="center">${mpayrecord.mloanrecord.loanno}</td>
                		<td align="center">${mpayrecord.mloanrecord.loanpersonname}</td>		
						<td align="center"><fmt:formatDate
								value='${mpayrecord.planpaydate}' pattern='yyyy-MM-dd' /></td>
						<td align="center">${mpayrecord.planpayaccrual}</td>
						<td align="center">${mpayrecord.planpayamount}</td>
						<td align="center"><fmt:formatDate
								value='${mpayrecord.paydate}' pattern='yyyy-MM-dd' /></td>
						<td align="center">${mpayrecord.payaccrual}</td>
						<td align="center">${mpayrecord.payamount}</td>
						<td align="center">${mpayrecord.payperson}</td>
						<td align="center">
						<c:choose>
								<c:when test="${mpayrecord.paystatus==1}">已还</c:when>
								<c:when test="${mpayrecord.paystatus==2}">未还</c:when>
						</c:choose></td>
					</tr>
				</c:if>
				<c:if test="${mpayrecord.status=='1'}">
					<tr target="id" rel="${mpayrecord.id}"
						style="background-color: orange;">
						<td align="center">${status.index+1}</td>
						<td align="center">${mpayrecord.mloanrecord.loanno}</td>
						<td align="center">${mpayrecord.mloanrecord.loanpersonname}</td>
						<td align="center"><fmt:formatDate
								value='${mpayrecord.planpaydate}' pattern='yyyy-MM-dd' /></td>
						<td align="center">${mpayrecord.planpayaccrual}</td>
						<td align="center">${mpayrecord.planpayamount}</td>
						<td align="center"><fmt:formatDate
								value='${mpayrecord.paydate}' pattern='yyyy-MM-dd' /></td>
						<td align="center">${mpayrecord.payaccrual}</td>
						<td align="center">${mpayrecord.payamount}</td>
						<td align="center">${mpayrecord.payperson}</td>
						<td align="center">
							<c:choose>
								<c:when test="${mpayrecord.paystatus==1}">已还</c:when>
								<c:when test="${mpayrecord.paystatus==2}">未还</c:when>
							</c:choose></td>
					</tr>
				</c:if>
				<c:if test="${mpayrecord.status=='2'}">
					<tr target="id" rel="${mpayrecord.id}"
						style="background-color: red;">
						<td align="center">${status.index+1}</td>
						<td align="center">${mpayrecord.mloanrecord.loanno}</td>
						<td align="center">${mpayrecord.mloanrecord.loanpersonname}</td>
						<td align="center"><fmt:formatDate
								value='${mpayrecord.planpaydate}' pattern='yyyy-MM-dd' /></td>
						<td align="center">${mpayrecord.planpayaccrual}</td>
						<td align="center">${mpayrecord.planpayamount}</td>
						<td align="center"><fmt:formatDate
								value='${mpayrecord.paydate}' pattern='yyyy-MM-dd' /></td>
						<td align="center">${mpayrecord.payaccrual}</td>
						<td align="center">${mpayrecord.payamount}</td>
						<td align="center">${mpayrecord.payperson}</td>
						<td align="center">
							<c:choose>
								<c:when test="${mpayrecord.paystatus==1}">已还</c:when>
								<c:when test="${mpayrecord.paystatus==2}">未还</c:when>
							</c:choose></td>
					</tr>
				</c:if>
			</c:forEach>
        </tbody>
    </table>
    <div class="panelBar">
        <div class="pages">
            <span>显示</span>
            <select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
                <option value="20">20</option>
                <option value="30">30</option>
                <option value="100">100</option>
                <option value="200">200</option>
            </select>
            <span>条，共${page.totalCount}条</span>
        </div>
        
        <div class="pagination" targetType="navTab" totalCount="${page.totalCount}" numPerPage="${page.numPerPage}" pageNumShown="10" currentPage="${page.pageNum}"></div>
    </div>
</div>
<script type="text/javascript">
    navTab.getCurrentPanel().find("select[name='numPerPage'] option[value='${page.numPerPage}']").attr("selected",true);
</script>