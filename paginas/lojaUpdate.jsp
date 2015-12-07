
<%-- 
    Document   : lojaUpdate.jsp
--%>

<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<%@ page import="transacoes.Loja" %>
<%@ page import="data.LojaDO" %>
<%@ page import="java.util.Vector" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="Stylesheet" href="css/StyleSheetLoja.css"/>
        <title>Pagina da Loja - Editar Conta</title>
    </head>
    <body>
        <div style="background-image:url('images/spm2.jpg'); padding: 1px  ">
<%
    if ( session.getAttribute("User_ID") == null) {
       pageContext.forward("index.jsp");
    }
    String action = request.getParameter("action");
    if(action == null){
        action="Idle";
    }
    int lojaID = Integer.parseInt((String)session.getAttribute("User_ID"));
    Loja lojatn = new Loja();
    LojaDO loja = new LojaDO();
    loja = lojatn.buscar(lojaID);
    String nome = loja.getNome();
    //String nome = Integer.toString(lojaID);
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
            <form method="post" action=lojaUpdate.jsp>
                <tr>
                    <td align="center">
                        <h3>Loja <%= nome %> !!</h3>
                    </td>
                </tr>
                <tr>
                    <td><img id="foto" src=<%= loja.getFoto()%>></td>
                </tr>                        
                <tr>
                    <td align="left"> 
                        Trocar foto
                        <input type="text" name="newfoto" value=<%=loja.getFoto()%>  />
                        <!--<input type="file" name="newfoto" accept="image/*" />-->
                    </td>
                </tr>
         
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
               <h4>Dados da loja</h4>
        </tr>
        <tr>
            <td align="right">
                <hdl>Nome:</hdl>
            </td>
            <td align="center">
                <input type="text" name="newnome" value=<%= loja.getNome()%> />
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>CNPJ:</hdl>
            </td>
            <td align="center">
                <input type="text" name="newcnpj" value=<%= loja.getCNPJ()%> />
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>e-mail:</hdl>
            </td>
            <td align="center">
                <input type="text" name="newemail" value=<%= loja.getEmail()%> />
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>Telefone 1:</hdl>
            </td>
            <td align="center">
                <input type="text" name="newtel1" value=<%= loja.getTelefone_1()%> />
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>Telefone 2:</hdl>
            </td>
            <td align="center">
                <input type="text" name="newtel2" value=<%= loja.getTelefone_2()%> />
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>Site:</hdl>
            </td>
            <td align="center">
                <input type="text" name="newurl" value=<%=loja.getURL()%> />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td align="center">
                <input type="submit" name="action" value="Salvar"/>
            </td>
        </tr>
        <tr>
            <td align="left">
                <div class="voltar">
                    <a href="./loja.jsp">Voltar<%session.setAttribute("User_ID", Integer.toString(lojaID));%></a>
                </div>
            </td>
        </tr>
    </table>
    </form>
<%
   if(action.equals("Salvar")){
       LojaDO newloja = new LojaDO();
       Loja newlojatn = new Loja();
       newloja.setID(loja.getID());
       newloja.setNome((String)request.getParameter("newnome"));
       newloja.setCNPJ((String)request.getParameter("newcnpj"));
       newloja.setEmail((String)request.getParameter("newemail"));
       newloja.setTelefone_1(request.getParameter("newtel1"));
       newloja.setTelefone_2(request.getParameter("newtel2"));
       newloja.setURL((String)request.getParameter("newurl"));
       //newloja.setFoto((String)request.getParameter("newfoto"));
       if((String)request.getParameter("newfoto") == null){
           newloja.setFoto(loja.getFoto());
       } else{
           newloja.setFoto((String)request.getParameter("newfoto"));
       }
       newloja.setSuspenso_ate(loja.getSuspenso_ate());
       newloja.setAtivo(loja.getAtivo());
       newlojatn.atualizar(newloja);
       session.setAttribute("User_ID", Integer.toString(lojaID));
       pageContext.forward("loja.jsp");
   }        
%>
</div>
               
    
<%-- Rodape --%>
        <div id="footer">
            <p>PMR2490 - Sistemas de Informação
            <br>Escola Politécnida da USP</p>
        </div>
        </div>
    </body>
</html>