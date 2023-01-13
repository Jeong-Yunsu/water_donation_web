<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>기간 지난 기부글 자세히</title>
    <link rel="stylesheet" href="css/viewmlrd.css" />
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>

<body>
<%@ include file="dona.jsp"%>

<div id="container">
    <div class="collect_wrap">
        <div class="content_content">
            <h2 class="theme"></h2>
            <c:forEach items="${viewmlrd}" var="viewmlrd">
            <h3 class="title">${viewmlrd.cntr_ttl}</h3>
            <div class="tab_content">
                <ul class="intro_list editor_base">
                    <li>
                        <dl>
                            <dd style="font-weight: bold; font-size: 30px; margin-bottom: 20px" id="paraContent1">${viewmlrd.mlrd_ttl}</dd>
                            <dt style="margin-bottom: 20px" id="paraTitle"><img src=${viewmlrd.mlrd_file_id} alt width="100%" height="300" class="card_img"></dt>
                            <dd style="margin-bottom: 100px" id="paraContent2">${viewmlrd.mlrd_cn}</dd>

                            <!-- 댓글 조회-->
                            <div style="font-size: 20px;">댓글을 달아주세요</div>
                            <hr style="border: solid 0.5px #ccc; margin-bottom: 8px; margin-top: 8px">
                            <section style="margin-top: 30px">
                                <ol>
                                    <c:forEach items="${comt}" var="comt">
                                        <li>
                                            <div style="font-size: 18px"><span>${comt.mbr_ncnm}</span> <span>(${comt.mbr_id})</span></div>
                                            <div style="font-size: 17px">${comt.comt_cn}</div>
                                            <div style="font-size: 14px; font-weight: lighter; margin-bottom: 10px"><span><fmt:formatDate value="${comt.rgtr_dt}" pattern="yyyy-MM-dd HH:mm:ss" /></span></div>
                                        </li>
                                    </c:forEach>
                                </ol>
                            </section>

                            <!-- 댓글 작성-->
                            <c:if test="${sessionScope.mbr_id == null }">
                                <p style="margin-top: 60px">소감을 남기시려면 <a href="login">로그인</a>을 해주세요</p>
                            </c:if>
                            <c:if test="${sessionScope.mbr_id != null }">
                                <section class="replyForm">
                                    <form role="form" method="post" autocomplete="off">
                                        <input type="hidden" name="mlrd_sn" value="${viewmlrd.mlrd_sn}">
                                        <div class="input_area">
                                            <textarea name="comt_cn" id="comt_cn"></textarea>
                                        </div>
                                        <div class="input_area">
                                            <button type="submit" id="reply_btn" style="cursor:pointer;">댓글 등록</button>
                                        </div>
                                    </form>
                                </section>
                            </c:if>
                            </c:forEach>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>


        <c:forEach items="${viewmlrd}" var="viewmlrd">
        <div class="content_side">
            <div class="section_title">
                <p class="tit">모금단체</p>
                <p class="tit2">${viewmlrd.cntr_rcvfvr}</p>
            </div>
            <div class="section_status">
                <div class="graph_wrap">
                    <div class="graph_status">
                        <span class="per">
                            <strong class="num">${viewmlrd.percent}</strong>%
                        </span>
                    </div>
                </div>
                <div class="sl_progressBarWrap">
                    <span class="sl_bar" style="width: ${viewmlrd.percent}%"></span>
                </div>
                <div class="term_area">
                    <p>
                        <strong>${viewmlrd.cntr_str_dt} ~ ${viewmlrd.cntr_end_dt}</strong>
                    </p>
                </div>
                <div class="num_area">
                    <p class="status_num">
                        <strong><fmt:formatNumber value="${viewmlrd.ctbny_pc}" pattern="###,###,###"/></strong>
                        <span>원 달성</span>
                    </p>
                    <p class="detail_num">
                        <span><fmt:formatNumber value="${viewmlrd.cntr_obctr}" pattern="###,###,###"/></span>
                        <em style="font-style: inherit">원 목표</em>
                    </p>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>
</div>
<div>
    <%@ include file="footer.jsp"%>
</div>

</body>
</html>