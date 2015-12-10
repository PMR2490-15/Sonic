<%@ page import="data.UsuarioDO" %>
<%@ page import="transacoes.Gamer" %>
<%@ page import="data.GamerDO" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="Stylesheet" href="css/StyleSheetGamer.css"/>
        <title>Pagina do Gamer</title>
    </head>
    <body>
        <div style="background-image:url('images/spm2.jpg'); padding: 1px  ">
<%
   if ( session.getAttribute("User_ID") == null) {
       pageContext.forward("index.jsp");
    }
    
    String buscarUser = request.getParameter("buscarUser");
    String buscarItem = request.getParameter("buscarItem");
    
    if(buscarUser == null){
        buscarUser="Idle";
    }
    if(buscarItem == null){
        buscarItem="Idle";
    }
    
    int gamerID = Integer.parseInt((String)session.getAttribute("User_ID"));
    Gamer gamertn = new Gamer();
    GamerDO gamer = new GamerDO();
    gamer = gamertn.buscar(gamerID);
    String nome = gamer.getNome();
%>

<%  
    if(!buscarUser.equals("Idle")){
       session.setAttribute("User_ID", Integer.toString(gamerID));
       session.setAttribute("busca", request.getParameter("buscar"));
       pageContext.forward("buscarPessoaGamer.jsp");
    }
    else if(!buscarItem.equals("Idle")){
       session.setAttribute("User_ID", Integer.toString(gamerID));
       session.setAttribute("busca", request.getParameter("buscar"));
       pageContext.forward("buscarItemGamer.jsp");
    }
%>
<%-- cabeçalho--%>
    <div id="poli">
        <h1>POLI GAMES</h1>
    </div>
    
<%-- Tabela do lado esquerdo --%>
<div id="left">
    <table border="1px"  style="none">
        <thead>
            <tr>
                <th align="center" class="conta">
                    <a href="./gamer.jsp">Minha Conta</a>
                </th>
            </tr>
        </thead>
        <tbody>
            <form method="post" action=gamer.jsp>
                <tr>
                    <td align="center">
                        <h3>Bem vindo <%=nome %> !!</h3>
                    </td>
                </tr>
                <tr>
                    <td><img id="foto" src=<%= gamer.getFoto()%>></td>
                </tr>
                <tr>
                    <table>
                        <tr>
                        <td><input type="text" name="buscar" /></td>
                        <td align="right"><img id="lupa" src="images/lupa.png"></td>
                        </tr>
                    </table>
                </tr>
                <tr>
                    <td align="right"> 
                        <input type="submit" name="buscarUser" value="Buscar Usuário"/>
                    </td>
                </tr>
            </form>
        </tbody>
    </table>
</div>

<%-- Fim da tabela do lado esquerdo e inicio das opçoes no topo --%>
<div>
        <div class="options">
            <a href="./insert.jsp">Inventário</a>
        </div> 
        <div class="options">
            <a href="./compraGamer.jsp" <% session.setAttribute("busca", ""); %> >Comprar</a>
        </div>
        <div class="options">
            <a href="./comunicadoGamer.jsp" <%session.setAttribute("User_ID", Integer.toString(gamerID));%>>Comunicados</a>
        </div>
        <div class="options">
            <a href="./search.jsp">Histórico</a>
        </div>
        <div class="options"> 
            <a href="./gamerUpdate.jsp" <%session.setAttribute("User_ID", Integer.toString(gamerID));%>>Editar Conta</a>
        </div>
</div> 

<div id="center">
    <table>
        <tr>
               <h4>Dados do Gamer</h4>
        </tr>
        <tr>
            <td align="right">
                <hdl>CPF:</hdl>
            </td>
            <td align="left">
                <hd><%=gamer.getCpf()%></hd>
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>e-mail:</hdl>
            </td>
            <td align="left">
                <hd><%=gamer.getEmail()%></hd>
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>Telefone:</hdl>
            </td>
            <td align="left">
                <hd><%=gamer.getTelefone()%></hd>
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>Cidade:</hdl>
            </td>
            <td align="left">
                <hd><%=gamer.getCidade()%></hd>
            </td>
        </tr>
    </table>
</div>
<%-- Rodape --%>
        <div id="footer">
            <p>PMR2490 - Sistemas de Informação
            <br>Escola Politécnida da USP</p>
        </div>
        </div>
    </body>
</html>
