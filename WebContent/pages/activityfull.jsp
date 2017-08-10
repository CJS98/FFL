<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ page import="java.util.ArrayList,bean.*,java.text.DecimalFormat"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%!Activity actf;%>
<%!ArrayList<Activity> actfl;%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href='${pageContext.request.contextPath}/css/bootstrap.css' rel='stylesheet'>
<link href='${pageContext.request.contextPath}/css/bootstrap.custom.css' rel='stylesheet'>
<link href='${pageContext.request.contextPath}/css/master.css' rel='stylesheet'>
<link rel='icon' href='favicon.ico' type='image/x-icon' />
<title>Activity Details</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%-- end of header --%>

<div class="container">
<% 
	DecimalFormat df = new DecimalFormat("##.00");
	actfl = (ArrayList<Activity>) request.getAttribute("activityFull");
	actf = actfl.get(0);
%>
	<jsp:include page="parts/page-header.jsp">
		<jsp:param value="activityfull" name="type" />
		<jsp:param value="Activities For Family" name="title" />
		<jsp:param value="5" name="titleWidth" />
	</jsp:include>
	<div>
	
			<div class="col-md-7 ">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3><%=actf.getActivityTitle()%> <% if(actf.getStatus().equals("Draft")){%><%=actf.getStatus() %><%} %></h3>
					</div>
					<div class="panel-body">
					<div class="panel-info">
				<c:set value="<%= actf.getOrganiserId() %>" var="oid"></c:set>
				<c:if test="${user.accountId eq oid }">
				 <div class="folded">
		            <h2 style="background-color: #DB874A;">Your Activity</h2>
		          </div>
		          </c:if>
					
						<p>
							Activity Categories :
							<%=actf.getActivityCategory()%>
						</p>
						<img src="<%=actf.getImgUrl()%>" id="factpic" class="fullactsize"><br>
						<br>
						<p>Activity Description :</p>
						<p><%=actf.getActivityDescription()%></p>
						<p>
							Organiser Id :
							<%=actf.getOrganiserId()%></p>
						<p>
							Slots Available:
							<%=actf.getParticipantNo()%></p>
						<p>
							Activity Fee : $
							<%=df.format(actf.getActivityFee())%></p>
						<p>
							Activity Time :
							<%=actf.getActivityTime()%></p>
						<p>
							Days Of Activity :
							<% for(String day:actf.getActivityDay()){
								out.print(day + " ");
							}%></p>
						<p>
							Activity Location :
							<%=actf.getActivityLocation()%></p>
						<p>
							Activity Period :
							<%=actf.getActivityStartDate()%>
							to
							<%=actf.getActivityEndDate()%></p>
						<p></p>
						<p>
							Activity Post Date :
							<%=actf.getActivityPostDate()%></p>
						<p>
							Registration Closes On :
							<%=actf.getActivityRegistrationEnd()%></p>
							<% if(actf.getStatus().equals("Draft")){%><p>Activity Status : <%=actf.getStatus() %><%} %>
						<div>
							<jsp:include page="parts/likeButtons.jsp">
								<jsp:param value="<%=actf.getLikeAccounts()%>"
									name="likeAccounts" />
								<jsp:param value="<%=actf.getDislikeAccounts()%>"
									name="dislikeAccounts" />
								<jsp:param value="<%=actf.getActivityId()%>" name="Id" />
								<jsp:param value="<%=actf.getLikeCount()%>" name="likeCount" />
								<jsp:param value="<%=actf.getDislikeCount()%>"
									name="dislikeCount" />
							</jsp:include>
							<c:if test="${user.accountId eq oid }">
									<span aria-hidden="true">
										<button class="btn btn-success"
											onclick="location.href = 'ActEdit?activityId=<%=actf.getActivityId()%>'">Edit
											Activity</button>
									</span>
								<%if (!actf.getStatus().equals("Draft")){ %>
									<span aria-hidden="true">
										<button class="btn btn-success"
										onclick="location.href = 'RegList?activityId=<%=actf.getActivityId()%>'">Participants
										List</button>
									</span>
								<%} %>
								<span aria-hidden="true">
									<button type="button" class="btn btn-danger " data-toggle="modal" data-target="#myModal">
									  Delete Activity
									</button>	
								</span>
							
								<!-- Modal -->
								<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								  <div class="modal-dialog modal-sm" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        <h4 class="modal-title" id="myModalLabel">Confirmation</h4>
								      </div>
								      <div class="modal-body">
								        Confirm Delete Activity?
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								        <button type="button" class="btn btn-danger" onclick="location.href = 'SelfDeleteActivity?activityId=<%=actf.getActivityId()%>'">Yes</button>
								      </div>
								    </div>
								  </div>
								</div>
							
								<% if(actf.getStatus().equals("Draft")){%>
									<span aria-hidden="true">
									<button class="btn btn-success"
										onclick="location.href = 'UploadActivity?activityId=<%=actf.getActivityId()%>'">Upload Activity</button>
									</span>
								<%} %>
							</c:if>
							<c:if test="${user.accountId ne oid }">
							<% 
							if (!actf.getStatus().equals("Draft")){ %>
							<span aria-hidden="true">
								<button class="btn btn-success"
									onclick="location.href = 'ActReg?activityId=<%=actf.getActivityId()%>'">Register
									For Activity</button>
							</span>
							<%}%>
							</c:if>
						</div>
					</div></div>
				</div>
			</div>
		</div>
		<div class = "col-md-1"></div>
		<div class="col-sm-12 col-md-3">
			<div class="sticky-sidebar">
				<div class="col-md-12 col-sm-4">
					<jsp:include page="parts/sidebar-account.jsp">
						<jsp:param value="activity" name="type" />
						<jsp:param value="ActFull?activityId=<%=actf.getActivityId()%>" name="url" />
					</jsp:include>
				</div>
				<div class="col-md-12 col-sm-4">
					<ul class="list-group" id="aMultiPlatformList">
						<h4>Activity Popularity Ranking</h4>
						<%
							int z = 0;
							ArrayList<Activity> actRank = (ArrayList<Activity>) request.getAttribute("actRank");
							for (Activity act : actRank) {
						%>
						<li class="list-group-item"><%=z + 1%>. <a
							href='ActFull?activityId=<%=act.getActivityId()%>'><%=act.getActivityTitle()%>
						</a><span class="badge"><%=act.getRankPoints()%></span></li>
						<%
							z++;
							}
						%>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<%-- end of main container --%>
	<jsp:include page="footer.jsp"></jsp:include>
	<%-- end of footer --%>

</body>
</html>