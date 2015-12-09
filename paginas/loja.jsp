<%@ page import="data.UsuarioDO"%>
<%@ page import="java.util.List"%>
<%@ page import="transacoes.Loja" %>
<%@ page import="data.LojaDO" %>
<%@ page import="java.util.Vector" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="Stylesheet" href="css/StyleSheetLoja.css"/>
        <title>Pagina da Loja</title>
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
    
    int lojaID = Integer.parseInt((String)session.getAttribute("User_ID"));
   
    Loja lojatn = new Loja();
    
    LojaDO loja = new LojaDO();
    loja = lojatn.buscar(lojaID);
    String nome = loja.getNome();
%>

<%  
    if(!buscarUser.equals("Idle")){
       session.setAttribute("User_ID", Integer.toString(lojaID));
       session.setAttribute("busca", request.getParameter("buscar"));
       pageContext.forward("buscarUsuarioLoja.jsp");
    }
    else if(!buscarItem.equals("Idle")){
       session.setAttribute("User_ID", Integer.toString(lojaID));
       session.setAttribute("busca", request.getParameter("buscar"));
       pageContext.forward("buscarItemLoja.jsp");
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
                    <a href="./loja.jsp">Minha Conta</a>
                </th>
            </tr>
        </thead>
        <tbody>
            <form method="post" action=loja.jsp>
                <tr>
                    <td align="center">
                        <h3>Loja <%= nome %> !!</h3>
                    </td>
                </tr>
                <tr>
                    <td><img id="foto" src=<%= loja.getFoto()%>></td>
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
                    <td align="left"> 
                        <input type="submit" name="buscarItem" value="Buscar Item"/>
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
            <a href="./comunicadoLoja.jsp"<%session.setAttribute("User_ID", Integer.toString(lojaID));%>>Comunicados</a>
        </div>
        <div class="options">
            <a href="./search.jsp">Histórico</a>
        </div>
        <div class="options"> 
            <a href="./lojaUpdate.jsp" <%session.setAttribute("User_ID", Integer.toString(lojaID));%>>Editar Conta</a>
        </div> 
</div>  
  
    <%--centro--%>
<div id="center">
    <table>
        <tr>
               <h4>Dados da Loja</h4>
        </tr>
        <tr>
            <td align="right">
                <hdl>CNPJ:</hdl>
            </td>
            <td align="left">
                <hd><%=loja.getCNPJ()%></hd>
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>e-mail:</hdl>
            </td>
            <td align="left">
                <hd><%=loja.getEmail()%></hd>
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>Telefone 1:</hdl>
            </td>
            <td align="left">
                <hd><%=loja.getTelefone_1()%></hd>
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>Telefone 2:</hdl>
            </td>
            <td align="left">
                <hd><%=loja.getTelefone_2()%></hd>
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>Site:</hdl>
            </td>
            <td align="left">
                <hd><a href=<%=loja.getURL()%>><%=loja.getURL()%></a></hd>
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
