<%-- 
    Document   : main.jsp
    Created on : 01/10/2009, 18:45:32
    Author     : MB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="Stylesheet" href="css/StyleSheetMain.css"/>
        <title>HttpSessionDemo - Pagina Principal</title>
    </head>
    <body>
        <div style="background-image:url('images/spm2.jpg'); padding: 1px  ">
<%
    // VERIFICACAO MANUAL DO LOGIN
    if ( session.getAttribute("user_name") == null) {
       pageContext.forward("index.jsp");
    }
    
    String nome = (String)session.getAttribute("user_name");
%>

        <div id="poli">
            <h1>POLI GAMES</h1>
        </div>
<div id="left">
        <h3>Bom dia <%= nome %> !! </h3>

        <li><a href="./insert.jsp">Inserir Contato</a>
        <li><a href="./update.jsp">Editar Contato</a>
        <li><a href="./remove.jsp">Remover Contato</a>
        <li><a href="./search.jsp">Pesquisar Contato</a>
        <li><a href="./insert.jsp">Alterar Wishlist</a>
        <li><a href="./update.jsp">Alterar Inventario</a>
        <li><a href="./remove.jsp">Pesquisar Jogo</a>
        <li><a href="./search.jsp">Sair</a>
</div>  
        <div id="footer">
            <p>PMR2490 - Sistemas de Informação
            <br>Escola Politécnida da USP</p>
        </div>
        </div>
    </body>
</html>
