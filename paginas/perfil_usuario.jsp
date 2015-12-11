<%-- 
    Document   : perfil_usuari.jsp
    Created on : 05/12/2015, 18:45:32
    Author     : MB
--%>

<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<%@ page import="transacoes.Loja" %>
<%@ page import="transacoes.Gamer" %>
<%@ page import="transacoes.Usuario" %>
<%@ page import="transacoes.Administrador" %>
<%@ page import="data.AdministradorDO" %>
<%@ page import="data.LojaDO" %>
<%@ page import="data.GamerDO" %>
<%@ page import="java.util.Vector" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="Stylesheet" href="css/StyleSheetGamer.css"/>
        <title>HttpSessionDemo - Perfil de Usuário</title>
    </head>
    <body>
        <div style="background-image:url('images/spm2.jpg'); padding: 1px  ">
<%
    // VERIFICACAO MANUAL DO LOGIN
    /*if ( session.getAttribute("user_name") == null) {
       pageContext.forward("index.jsp");
    }
    */
    /* String nome = (String)session.getAttribute("user_name");
    String email = (String)session.getAttribute("Email");
    String telefone = (String)session.getAttribute("Telefone");
    String telefone2 = (String)session.getAttribute("Telefone2");
    String cidade = (String)session.getAttribute("Cidade");
    String site = (String)session.getAttribute("URL"); */
    
 
    
%>
<%
    String nome = null;
    String email = null;
    String telefone = null;
    String telefone2 = null;
    String cidade = null;
    String site = null;
    
    if ( session.getAttribute("User_ID") == null) {
       pageContext.forward("index.jsp");
    }
    String action = request.getParameter("action");
    if(action == null){
        action="Idle";
    }
    int ID = Integer.parseInt((String)session.getAttribute("Requested_ID"));
    //int tipo = 2;
    Usuario usuariotn = new Usuario();
    UsuarioDO perfilUsuario = new UsuarioDO();
    perfilUsuario = usuariotn.buscar(ID);
    int tipo = perfilUsuario.getTipo();
    if (tipo == 3){
        Administrador administradortn = new Administrador(); 
        AdministradorDO perfil = new AdministradorDO();
        perfil = administradortn.buscar(ID);
        nome = perfil.getNome();
        email = perfil.getEmail();
        telefone = perfil.getTelefone();
    }
    if (tipo == 2){
        Loja lojatn = new Loja();
        LojaDO perfil = new LojaDO();
        perfil = lojatn.buscar(ID);
        nome = perfil.getNome();
        email = perfil.getEmail();
        telefone = (String)perfil.getTelefone_1();
        telefone2 = (String)perfil.getTelefone_2();
        site = perfil.getURL();
    }
    if (tipo == 1){
        Gamer gamertn = new Gamer();
        GamerDO perfil = new GamerDO();
        perfil = gamertn.buscar(ID);
        nome = perfil.getNome();
        email = perfil.getEmail();
        telefone = perfil.getTelefone();
        cidade = perfil.getCidade();
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
                    <h>Minha Conta</h>
                </th>
            </tr>
        </thead>
        <tbody>
            <form method="post" action=perfil_usuario.jsp>
                <tr>
                    <%-- <td align="center"> 
                        <h3>Bem vindo <%= nome %> !!</h3>
                    </td> --%>
                </tr>
                <tr>
                    <td><img id="foto" src="images/Logo.png"></td>
                </tr>
                <tr>
                    <table>
                        <tr>
                        <td><input type="text" name="usuario" /></td>
                        <td align="right"><img id="lupa" src="images/lupa.png"></td>
                        </tr>
                    </table>
                </tr>                                
                <tr>
                    <td align="right"> 
                        <input type="submit" name="enviar" value="Buscar Usuário"/>
                        <input type="hidden" name="campo_controle" />
                    </td>
                    <td align="left"> 
                        <input type="submit" name="enviar" value="Buscar Item"/>
                        <input type="hidden" name="campo_controle" />
                    </td>
                </tr>
            </form>
        </tbody>
    </table>
</div>
                    
<%-- Fim da tabela do lado esquerdo e inicio da tabela do meio --%>

<div>
        <%--<div class="options">
            <a href="./insert.jsp">Inventário</a>
        </div> 
        <div class="options">
            <a href="./update.jsp">Wishlist</a>
        </div>
        <div class="options">
            <a href="./remove.jsp">Comunicados</a>
        </div>
        <div class="options">
            <a href="./search.jsp">Histórico</a>
        </div>
        <div class="options"> 
            <a href="./insert.jsp">Editar Conta</a>
        </div> --%>
        <div class="options">
                <a href="./inventarioGamer.jsp">Acessar Inventário</a>
        </div>
        
</div>  


<div id="center">
<%  if (tipo == 3){ %>
    <table border="1px"  style="none">
        <thead>
            <tr>
                <th align="center">
                    <h>Informações de Usuário</h>
                </th>
            </tr>
        </thead>
        <tbody>
            <form method="post" action=index.jsp>
                <tr>
                    <td align="left"> 
                        <h>Nome: <%= nome %></h>
                    </td>
                </tr>
                <tr>
                    <td align="left"> 
                        <h>Email: <%= email %></h>
                    </td>
                </tr>
                <tr>
                    <td align="left"> 
                        <h>Telefone: <%= telefone %></h>
                    </td>
                </tr>
            </form>
        </tbody>
    </table>
<%  }
    if (tipo == 2){ %>
    <table>
        <thead>
            <tr>
                <th align="center">
                    <h>Informações de Usuário</h>
                </th>
            </tr>
        </thead>
        <tbody>
            <form method="post" action=index.jsp>
                <tr>
                    <td align="left"> 
                        <h>Nome: <%= nome %></h>
                    </td>
                </tr>
                <tr>
                    <td align="left"> 
                        <h>Email: <%= email %></h>
                    </td>
                </tr>
                <tr>
                    <td align="left"> 
                        <h>Telefone: <%= telefone %></h>
                    </td>
                </tr>
                <tr>
                    <td align="left"> 
                        <h>Telefone: <%= telefone2 %></h>
                    </td>
                </tr>
                <tr>
                    <td align="left"> 
                        <h>Site: <%= site %></h>
                    </td>
                </tr>
                <tr>
                    
                </tr>
            </form>
        </tbody>
    </table>
<%  }
    if (tipo == 1){ %>
    <table>
        <thead>
            <tr>
                <th align="center">
                    <h>Informações de Usuário</h>
                </th>
            </tr>
        </thead>
        <tbody>
            <form method="post" action=index.jsp>
                <tr>
                    <td align="left"> 
                        <h>Nome: <%= nome %></h>
                    </td>
                </tr>
                <tr>
                    <td align="left"> 
                        <h>Email: <%= email %></h>
                    </td>
                </tr>
                <tr>
                    <td align="left"> 
                        <h>Telefone: <%= telefone %></h>
                    </td>
                </tr>
                <tr>
                    <td align="left"> 
                        <h>Cidade: <%= cidade %></h>
                    </td>
                </tr>
                <tr>
                    
                </tr>
                <tr>
                </tr>
            </form>
        </tbody>
    </table> 
<%  } %>              
</div>
<%-- Rodape --%>
        <div id="footer">
            <p>PMR2490 - Sistemas de Informação
            <br>Escola Politécnida da USP</p>
        </div>
        </div>
    </body>
</html>
