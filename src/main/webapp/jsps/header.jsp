<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="struts" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]--%>
<%--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]--%>
<%--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]--%>
<%--[if gt IE 8]><%--%> <html class="no-js"> <%--<![endif]--%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>NCU App Store</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <link rel="shortcut icon" href="<c:url value='/favicon.ico'/>" type="image/x-icon" />  
        <link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,600,800' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" href="<c:url value='/css/main.css'/>">
        
        <script src="<c:url value='/js/modernizr-2.6.2-respond-1.1.0.min.js'/>"></script>
        <style type="text/css">
			  .glyphiconbig {
			    font-size: 4.3em;
			}
			.row-centered {
			    text-align:center;
			}
        </style>
        
		<script>
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		
		  ga('create', 'UA-59629247-1', 'auto');
		  ga('send', 'pageview');
		
		</script>
    </head>
    <body>
        <%--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]--%>
        

        <%-- Navigation & Logo--%>
        <div class="mainmenu-wrapper">
            <div class="container">
                
                <nav id="mainmenu" class="mainmenu">
                    <ul>
                        <li class="logo-wrapper"><a href="/appstore"><img src="<c:url value='/img/mPurpose-logo.png'/>" alt="Multipurpose Twitter Bootstrap Template"></a></li>
                        <li>
                            <a href="/appstore">首頁</a>
                        </li>
                        <li>
                            <a href="<struts:url action="allproduct"/>">總覽App</a>
                        </li>
                        
                        
                        <struts:if test="#session.personInfo != null && #session.personInfo.type == 'ADMIN'">
                        <li class="has-submenu">
                            <a href="#">管理App</a>
                            <div class="mainmenu-submenu">
                                <div class="mainmenu-submenu-inner"> 
                                       
                                    <div>
                                        <h4>查看App申請列表</h4>
                                        <ul>
                                            <struts:url action="checklist" var="uncheckedPage">
                                                <struts:param name="wantState" >UNCHECKED</struts:param>
                                            </struts:url>
                                            <struts:url action="checklist" var="checkingPage">
                                                <struts:param name="wantState" >CHECKING</struts:param>
                                            </struts:url>
                                            <struts:url action="checklist" var="failPage">
                                                <struts:param name="wantState" >FAIL</struts:param>
                                            </struts:url>
                                            <struts:url action="checklist" var="checkedPage">
                                                <struts:param name="wantState" >CHECKED</struts:param>
                                            </struts:url>
                                            <li><a href=" <struts:url action="checklist"/> ">查看所有App申請</a></li>
                                            <li><a href=" <struts:property value="#uncheckedPage" /> ">查看所有待檢查App申請</a></li>
                                            <li><a href=" <struts:property value="#checkingPage" /> ">查看所有檢查中App申請</a></li>
                                            <li><a href=" <struts:property value="#checkedPage" /> ">查看所有檢查成功App申請</a></li>
                                            <li><a href=" <struts:property value="#failPage" /> ">查看所有檢查失敗App申請</a></li>
                                        </ul>
                                        
                                    </div>
                                    
                                </div><%-- /mainmenu-submenu-inner --%>
                            </div><%-- /mainmenu-submenu --%>
                        </li>
                        </struts:if>
                        
                        
                        <li class="has-submenu">
                            <a href="#">歡迎提案</a>
                            <div class="mainmenu-submenu">
                                <div class="mainmenu-submenu-inner"> 
                                       
                                    <div>
                                        <h4>提案相關列表</h4>
                                        <ul>
                                            <li><a href=" <struts:url action="propose"/> ">提案說明</a></li>                                            
                                            <li><a href='<c:url value='/doc/proposal_exp.docx'/>'>提案範例</a></li>
                                            <li><a href="<c:url value='/doc/pre_list.docx'/>">APP需求LIST</a></li>
                                        </ul>
                                        
                                    </div>
                                    
                                </div><%-- /mainmenu-submenu-inner --%>
                            </div><%-- /mainmenu-submenu --%>
                        </li>
                        
                        
                        <li>
                            <a href="<struts:url action="personalpage"/>">申請上架</a>
                        </li>
                        <struts:if test="#session.personInfo != null">
                            <li>
                            <a href="<struts:url action="logout"/>">登出</a>
                            </li>
                        </struts:if>
                    </ul>
                </nav>
            </div>
        </div>