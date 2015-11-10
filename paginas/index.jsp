<%-- 
    Document   : index
    Created on : 01/10/2009, 18:29:29
    Author     : MB
--%>
<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<%@ page import="transacoes.Contato" %>
<%@ page import="data.ContatoDO" %>
<%@ page import="java.util.Vector" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="Stylesheet" href="css/StyleSheetLogin.css"/>
        <title>HttpSessionDemo-Pagina de Login</title>
    </head>
   <body>
        <div style="background-image:url('images/spm2.jpg'); padding: 1px  ">
    
    <div id="poli">
        <h1>POLI GAMES</h1>
    </div>
    
    <p> Neste site você pode encontrar todos os seus jogos favoritos. Venda ou 
            troque seus jogos de maneira segura, rápida e fácil! </p>
        
    <div id="left"> 
        
        <div id="left2">
<%            String action = request.getParameter("action");
       if ( null == action ) {
          action = "showLoginForm";
%>
	  <form action="./search.jsp" method="post">
            <table>
              <tr>
                 <td>Nome de usuário </td>
                 <td><input type="text" name="nomeUsuario" />
              </tr>
              <tr>
                 <td>Senha </td>
                 <td><input type="password" password="senha" />  
              </tr>
              <tr>
                  <td></td>
                  <td>
                      <input type="submit" name="Login" value="tryLogin" />
	    <input type="submit" name="Esqueci minha senha" value="forgotPassword" />
                  </td>
              </tr>
            </table>
            
          </form>

<%        
       }
%>
<! ------------------------------------------------------------------------->
<!--   faz a pesquisa e tenta fazer o login                               -->
<%
     if (action.equals("tryLogin")) {
       String nome = request.getParameter("nomeUsuario");
       String password = request.getParameter("senha");
       transacoes.Usuario tn = new transacoes.Usuario();
       UsuarioDO usuario = tn.buscar(nome);
       if (usuario == null || usuario.getSenha().equals(password)) {
         // avisar usuario que o login nao pode ser efetuado
%>

          Nome de usuário ou senha incorretos!
          <form action="./index.html" method="post">
          </form>
          
<%     } else {
            session.setAttribute("nomeUsuario", nome);
            session.setAttribute("idUsuario", usuario.getId());
       } // login efetuado
     } // login

     
     else if (action.equals("forgotPassword")) {
%>
        <form action="./search.jsp" method="post">
            <table>
                <tr>
                    <td>Nome de usuário </td>
                    <td><input type="text" name="Email" /> 
                </tr>
            </table>
            <input type="submit" name="Enviar email" value="sendResetPassword" />
            <input type="submit" name="Cancelar" value="backToLogin" />
        </form>
    
<%
     } // forgotPassword
%>
</div>
    </div>
    <div id="right">
        <h3>Cadastre-se!</h3>
        <div id="button">
            <p> <a href="./cadastroCliente.jsp"><span class="bold">Clique Aqui!</span></a></p>
        </div>
    </div>
        <div id="charizard"> 
            <%--        <img  class="charizard" src="images/Logo.png"> --%>
</div>
    <div id="footer">
	<p>PMR2490 - Sistemas de Informação
        <br>Escola Politécnida da USP</p>
    </div>
    
    </body>
</html>
