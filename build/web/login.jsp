<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<html>
<header>
  <title>Remover Contato</title>
</header>

<body bgcolor="white">
<%@ page import="transacoes.Contato" %>
<%@ page import="data.ContatoDO" %>
<%@ page import="java.util.Vector" %>

<! ------------------------------------------------------------------------->
<!--   se for o request inicial, mostrar somente o formulario de login -->

<%     
       String action = request.getParameter("action");
       if ( null == action ) {
          action = "showLoginForm";
%>

	  <form action="./search.jsp" method="post">
            <table>
              <tr>
                 <td>Nome de usuário </td>
                 <td><input type="text" name="nomeUsuario" />
                 <td>Nome de usuário </td>
                 <td><input type="password" password="senha" />  
              </tr>
            </table>
            <input type="submit" name="tryLogin" value="Login :D" />
	    <input type="submit" name="forgotPassword" value="Esqueci minha senha :/" />
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

</body>
</html>
