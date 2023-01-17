<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>기간 지난 기부글 자세히</title>
    <link rel="stylesheet" href="css/viewmlrdlist.css" />
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>

<body>
<%@ include file="dona.jsp"%>

<div id="container">
    <div class="collect_wrap">
        <div class="content_content">
            <h2 class="theme"></h2>
            <h3 class="title">${view.cntr_ttl}</h3>
            <div class="tab_content">
                <ul class="intro_list editor_base">
                    <li>
                        <dl>
                            <dt id="paraTitle" style="padding-bottom: 20px"><img src=${view.cntr_file_id} alt width="100%" height="300" class="card_img"></dt>
                            <dd id="paraContent">${view.cntr_cn}</dd>
                        </dl>
                    </li>
                    <div style="margin-top: 100px">
                        <table>
                            <thead>
                            <div style="margin-bottom: 13px; font-size: 20px">후기글</div>
                            <hr style="border: solid 0.5px #ccc; margin-bottom: 8px; margin-top: 8px">
                            </thead>
                            <tbody>
                            <c:forEach items="${viewmlrdlist}" var="viewmlrdlist">
                            <tr>
                                <td style="padding-right: 85px; margin-bottom: 10px">
                                    <a href="viewmlrd?q=${viewmlrdlist.mlrd_sn}" style="font-size: 20px">${viewmlrdlist.mlrd_ttl}</a>
                                </td>
                                <td style="right: 10px"><fmt:formatDate value="${viewmlrdlist.rgtr_dt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            </tr>
                            </tbody>
                            </c:forEach>
                            <section>
                                <ol>
                                    <c:forEach items="${comt}" var="comt">
                                        <li>
                                            <div>
                                                <span>${comt.mbr_nm}</span>
                                                <span><fmt:formatDate value="${comt.rgtr_dt}" pattern="yyyy-MM-dd" /></span>
                                            </div>
                                            <div>${comt.comt_cn}</div>
                                        </li>
                                    </c:forEach>
                                </ol>
                            </section>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </ul>
            </div>
        </div>

        <div class="content_side">
            <div class="section_title">
                <p class="tit">모금단체</p>
                <p class="tit2">${view.cntr_rcvfvr}</p>
            </div>
            <div class="section_status">
                <div class="graph_wrap">
                    <div class="graph_status">
                        <span class="per">
                            <strong class="num">${view2.percent}</strong>%
                        </span>
                    </div>
                </div>
                <div class="sl_progressBarWrap">
                    <span class="sl_bar" style="width: ${view2.percent}%"></span>
                </div>
                <div class="term_area">
                    <p>
                        <strong>${view.cntr_str_dt} ~ ${view.cntr_end_dt}</strong>
                    </p>
                </div>
                <div class="num_area">
                    <p class="status_num">
                        <strong><fmt:formatNumber value="${view2.ctbny_pc}" pattern="###,###,###"/></strong>
                        <span>원 달성</span>
                    </p>
                    <p class="detail_num">
                        <span><fmt:formatNumber value="${view.cntr_obctr}" pattern="###,###,###"/></span>
                        <em style="font-style: inherit">원 목표</em>
                    </p>
                </div>
            </div>
            <div class="section_title" style="height: 500px;">
                <p class="brk">여러분들의 소중한 참여</p>
                <p>
                    <span>총</span>
                    <span style="font-size: 17px"> ${breakdownSum.breakdownSum}</span>
                    <span>건이 기부되었습니다.</span>
                </p>
                <hr style="border: solid 0.5px #ccc; margin-bottom: 8px; margin-top: 8px">
                <c:forEach items="${breakdown}" var="breakdown">
                    <p><fmt:formatDate value="${breakdown.rgtr_dt}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
                    <p class="brk2">
                        <span class="ncnm">${breakdown.mbr_ncnm}</span>
                        <span class="btr_pc"><fmt:formatNumber value="${breakdown.btr_pc}" pattern="###,###,###"/></span>
                        <span>원</span>
                    </p>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<div>
    <%@ include file="footer.jsp"%>
</div>

</body>
</html>