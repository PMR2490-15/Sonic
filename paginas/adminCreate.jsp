
<%-- 
    Document   : adminUpdate.jsp
--%>
<%@page import="transacoes.Administrador"%>
<%@page import="data.AdministradorDO"%>
<%@page import="transacoes.Usuario" %>
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
        action="CreateAdmin";
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
        <div class="options"> 
            <a href="./adminCreate.jsp" <%session.setAttribute("User_ID", Integer.toString(adminID));%>>Criar ADM</a>
        </div>
</div>  

    <%--centro--%>
<%
            if(action.equals("CreateAdmin")){
%>
<div id="center">
    <form method="post" action=adminCreate.jsp>
    <table>
        <tr>
               <h4>Dados do Administrador</h4>
        </tr>
        <tr>
            <td align="right">
                <hdl>Nome de usuário:</hdl>
            </td>
            <td><input type="text" name="userName"  /></td>
        </tr>
        <tr>
            <td align="right">
                <hdl>Senha:</hdl>
            </td>
            <td><input type="password" name="senha"  /></td>
        </tr>
        <tr>
            <td align="right">
                <hdl>Pergunta de segurança:</hdl>
            </td>
            <td><input type="text" name="pergunta"></td>
        </tr>
        <tr>
            <td align="right">
                <hdl>Resposta:</hdl>
            </td>
            <td><input type="text" name="resposta"></td>
        </tr>        
        <tr>
            <td align="right">
                <hdl>Nome:</hdl>
            </td>
            <td align="center">
                <input type="text" name="newnome" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>CPF:</hdl>
            </td>
            <td align="center">
                <input type="text" name="newcpf" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>e-mail:</hdl>
            </td>
            <td align="center">
                <input type="text" name="newemail" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>Telefone:</hdl>
            </td>
            <td align="center">
                <input type="text" name="newtel" />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td align="center">
                <input type="submit" name="action" value="Concluir"/>
            </td>
        </tr>
        <tr>
            <td align="left">
                <div class="voltar">
                    <a href="./admin.jsp" <%session.setAttribute("User_ID", Integer.toString(adminID));%>>Voltar</a>
                </div>
            </td>
        </tr>
    </table>
    </form>
<%
            }
%>
<%
   if(action.equals("Concluir")){
        UsuarioDO buscar = new UsuarioDO();
        Usuario tn = new Usuario();                   
        buscar = tn.buscar(request.getParameter("userName"));
        if(buscar != null || (request.getParameter("senha")).equals("") || (request.getParameter("pergunta")).equals("") || (request.getParameter("resposta")).equals("")){
            action="erro";
        }
        else{              
            UsuarioDO novo = new UsuarioDO();
            novo.setNome_Usuario((String)request.getParameter("userName"));
            novo.setSenha((String)request.getParameter("senha"));
            novo.setTipo(3);
            novo.setPergunta((String)request.getParameter("pergunta"));
            novo.setResposta((String)request.getParameter("resposta"));
            tn.incluir(novo);
            UsuarioDO buscarid = new UsuarioDO();
            buscarid = tn.buscar((String)request.getParameter("userName"));
            AdministradorDO newadmin = new AdministradorDO();
            Administrador newadmintn = new Administrador();
            newadmin.setUsuarioId(buscarid.getId());
            newadmin.setNome((String)request.getParameter("newnome"));
            newadmin.setCPF((request.getParameter("newcpf")));
            newadmin.setEmail((String)request.getParameter("newemail"));
            newadmin.setTelefone((request.getParameter("newtel")));
            newadmintn.incluir(newadmin);
            action="CreateOK";
        }
   }        
%>

<%
   if(action.equals("erro")){
%>       
<div id="center">    
    <h3>Nome de Usuário já existe ou campo não preenchido</h3>
    <a href="./adminCreate.jsp" <%session.setAttribute("User_ID", Integer.toString(adminID));%>>Voltar</a>
<%
   }  
   if(action.equals("CreateOK")){
%>
<div id="center">  
    <h3>Cadastro completo</h3>
    <a href="./admin.jsp" <%session.setAttribute("User_ID", Integer.toString(adminID));%>>Voltar</a>
<%
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
