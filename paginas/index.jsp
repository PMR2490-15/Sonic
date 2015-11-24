
<%-- 
    Document   : index
    Created on : 01/10/2009, 18:29:29
    Author     : MB
--%>
<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<%@page import="transacoes.Usuario" %>
<%@page import="java.util.Vector" %>
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
	  <form action="./index.jsp" method="post">
            <table>
              <tr>
                 <td>Nome de usuário </td>
                 <td><input type="text" name="nomeUsuario" />
              </tr>
              <tr>
                 <td>Senha </td>
                 <td><input type="password" name="senha" />  
              </tr>
              <tr>
                  <td></td>
                  <td>
                      <input type="submit" name="action" value="Login :D" />
                      <input type="submit" name="forgotPassword" value="Esqueci minha senha :/" />
                      <input type="submit" name="action" value="loja" />
                      <input type="submit" name="action" value="gamer" />
                      <input type="submit" name="action" value="admin" />
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
     if (action.equals("loja")) {
       int id = 500; //simular ID
       session.setAttribute("User_ID", Integer.toString(id));
       pageContext.forward("loja.jsp");
     }
     
     if (action.equals("admin")) {
       pageContext.forward("admin.jsp");
     }

     if (action.equals("gamer")) {
         pageContext.forward("gamer.jsp");
       }
     if (action.equals("Login :D")){
       String username = request.getParameter("nomeUsuario");
       String password = request.getParameter("senha");
       Usuario tn = new Usuario();
       UsuarioDO usuario = tn.buscar(username);
       if (usuario == null || !password.equals((String)usuario.getSenha())) {
%>         
           Nome de usuário ou senha incorretos!
          <form action="./index.html" method="post">
          </form>
<%
       }else{
           if(usuario.getTipo() == 1){
               pageContext.forward("gamer.jsp");
           }
           if(usuario.getTipo() == 2){
               session.setAttribute("User_ID", Integer.toString(usuario.getId()));
               pageContext.forward("loja.jsp");
           }
           if(usuario.getTipo() == 3){
               pageContext.forward("admin.jsp");
           }
       }
     
         // avisar usuario que o login nao pode ser efetuado
%>
<%---
          Nome de usuário ou senha incorretos!
          <form action="./index.html" method="post">
          </form>
     --%>    
<%   //  }// else {
           // session.setAttribute("nomeUsuario", nome);
           // session.setAttribute("idUsuario", usuario.getId());*/
           // pageContext.forward("gamer.jsp");
       //} // login efetuado
     } // login

     
    else if (action.equals("Esqueci minha senha :/")) {
%>
        <form action="./search.jsp" method="post">
            <table>
                <tr>
                    <td>Nome de usuário </td>
                    <td><input type="text" name="Email" /> </td
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
