
<%-- 
    Document   : adminUpdate.jsp
--%>

<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<%@ page import="transacoes.Administrador" %>
<%@ page import="data.AdministradorDO" %>
<%@ page import="java.util.Vector" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="Stylesheet" href="css/StyleSheetLoja.css"/>
        <title>Pagina da Administrador - Editar Conta</title>
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
    int adminID = Integer.parseInt((String)session.getAttribute("User_ID"));
    Administrador admintn = new Administrador();
    AdministradorDO admin = new AdministradorDO();
    admin = admintn.buscar(adminID);
    String nome = admin.getNome();
    //String nome = Integer.toString(adminID);
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
                    <a href="./admin.jsp"<%session.setAttribute("User_ID", Integer.toString(adminID));%>>Minha Conta</a>
                </th>
            </tr>
        </thead>
        <tbody>
            <form method="post" action=adminUpdate.jsp>
                <tr>
                    <td align="center">
                        <h3>Administrador <%= nome %> !!</h3>
                    </td>
                </tr>
                <tr>
                    <td><img id="foto" src="images/Venusaur.png"></td>
                </tr>                                
        </tbody>
    </table>
</div>
                    
<%-- Fim da tabela do lado esquerdo e inicio das opçoes no topo --%>
<div>
        <div class="options">
            <a href="./insertItemAdmin.jsp">Cadastrar Item</a>
        </div> 
        <div class="options">
            <a href="./comunicadoAdmin.jsp">Comunicados</a>
        </div>
        <div class="options"> 
            <a href="./adminUpdate.jsp" <%session.setAttribute("User_ID", Integer.toString(adminID));%>>Editar Conta</a>
        </div> 
</div>  

    <%--centro--%>
<div id="center">
    <table>
        <tr>
               <h4>Dados do Administrador</h4>
        </tr>
        <tr>
            <td align="right">
                <hdl>Nome:</hdl>
            </td>
            <td align="center">
                <input type="text" name="newnome" value=<%= admin.getNome()%> />
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>CPF:</hdl>
            </td>
            <td align="center">
                <input type="text" name="newcpf" value=<%= admin.getCPF()%> />
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>e-mail:</hdl>
            </td>
            <td align="center">
                <input type="text" name="newemail" value=<%= admin.getEmail()%> />
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>Telefone:</hdl>
            </td>
            <td align="center">
                <input type="text" name="newtel" value=<%= admin.getTelefone()%> />
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
                    <a href="./admin.jsp">Voltar<%session.setAttribute("User_ID", Integer.toString(adminID));%></a>
                </div>
            </td>
        </tr>
    </table>
    </form>
<%
   if(action.equals("Salvar")){
       AdministradorDO newadmin = new AdministradorDO();
       Administrador newadmintn = new Administrador();
       newadmin.setUsuarioId(admin.getUsuarioId());
       newadmin.setNome((String)request.getParameter("newnome"));
       newadmin.setCPF((request.getParameter("newcpf")));
       newadmin.setEmail((String)request.getParameter("newemail"));
       newadmin.setTelefone((request.getParameter("newtel")));
       newadmintn.atualizar(newadmin);
       session.setAttribute("User_ID", Integer.toString(adminID));
       pageContext.forward("admin.jsp");
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
