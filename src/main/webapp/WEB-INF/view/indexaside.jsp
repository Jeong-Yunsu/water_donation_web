<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
    ul { padding:0; margin:0; list-style:none;  }

    div#root { width:90%; margin:0 auto; }

    header#header { font-size:60px; padding:20px 0; }
    header#header h1 a { color:#000; font-weight:bold; }

    nav#nav { padding:10px; text-align:right; }
    nav#nav ul li { display:inline-block; margin-left:10px; }

    section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
    section#container::after { content:""; display:block; clear:both; }
    aside { float:left; height:800px; width:250px; align-content: center; margin-top: 170px;}
    div#container_box { float:right; width:calc(100% - 200px - 20px); }

    aside ul li { text-align:center; margin-bottom:50px; }
    aside ul li a { display:block; width:100%; padding:10px 0;}
    aside ul li a:hover { background:#eee; }
    a {
        text-decoration: none;
    }
    li > a {
        text-decoration: none;
        color: black;
        cursor: pointer;
        position: relative;
        height: 100%;
        display: flex;
        align-items: center;
        font-weight: 1000;
        font-size: 1.3rem;
        /*transition: all 0.25s cubic-bezier(0.42, 0, 0, 1);*/
        padding: 0 1rem;
        z-index: 1;
        user-select: none;
    }
</style>

<aside>
    <ul>
        <li><a href="/indexregister">기부글 등록</a></li>
        <li><a href="/indexlist">기부글 목록</a></li>
        <li><a href="">기부 후기글</a></li>
        <li><a href="">유저 목록</a></li>
    </ul>
</aside>
