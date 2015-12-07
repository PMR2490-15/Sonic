
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
                    <a href="./admin.jsp">Minha Conta</a>
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
                <tr>
                    <td align="left"> 
                        Trocar foto
                        <input type="text" name="newfoto" value=<%=admin.getFoto()%>  />
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
            <a href="./comunicado.jsp"<%session.setAttribute("User_ID", Integer.toString(adminID));%>>Comunicados</a>
        </div>
        <div class="options">
            <a href="./search.jsp">Histórico</a>
        </div>
        <div class="options"> 
            <a href="./adminUpdate.jsp" <%session.setAttribute("User_ID", Integer.toString(adminID));%>>Editar Conta</a>
        </div> 
</div>  

    <%--centro--%>
<div id="center">
    <table>
        <tr>
               <h4>Dados da admin</h4>
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
                <input type="text" name="newcnpj" value=<%= Integer.toString(admin.getCNPJ())%> />
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
                <input type="text" name="newtel1" value=<%= Integer.toString(admin.getTelefone_1())%> />
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
       newadmin.setID(admin.getID());
       newadmin.setNome((String)request.getParameter("newnome"));
       newadmin.setCNPJ(Integer.parseInt(request.getParameter("newcnpj")));
       newadmin.setEmail((String)request.getParameter("newemail"));
       newadmin.setTelefone_1(Integer.parseInt(request.getParameter("newtel1")));
       newadmin.setTelefone_2(Integer.parseInt(request.getParameter("newtel2")));
       newadmin.setURL((String)request.getParameter("newurl"));
       //newadmin.setFoto((String)request.getParameter("newfoto"));
       if((String)request.getParameter("newfoto") == null){
           newadmin.setFoto(admin.getFoto());
       } else{
           newadmin.setFoto((String)request.getParameter("newfoto"));
       }
       newadmin.setSuspenso_ate(admin.getSuspenso_ate());
       newadmin.setAtivo(admin.getAtivo());
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
