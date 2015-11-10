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
            <input type="submit" name="Login" value="tryLogin" />
	    <input type="submit" name="Esqueci minha senha" value="forgotPassword" />
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
            
<%     } // login efetuado

     } // login

     else if (action.equals("forgotPassword")) {
%>


<%
     } // forgotPassword
%>
<! ------------------------------------------------------------------->
<!--   mostra formulario para atualizacao                           -->
<%     if (action.equals("showEditForm")) {
          int id = Integer.parseInt(request.getParameter("id"));
	  transacoes.Contato tn = new transacoes.Contato();
          data.ContatoDO contato = tn.buscar(id);
%>        
          <form action="./update.jsp" method="post">
             <table>
               <tr>
                  <td>Nome</td>
                  <td><%= contato.getNome() %> </td>
               </tr>
               <tr>
                  <td>Telefone</td>
                  <td><input type="text" name="telefone" value=<%= contato.getTelefone() %> />
               </tr>
             </table>
             <input type="submit" name="atualizar" value="atualizar" />
	     <a href="index.html">Voltar</a>
	     <input type="hidden" name="id" value=<%= id %> />
	     <input type="hidden" name="action" value="updateValues" />
	     <input type="hidden" name="nome" value=<%= contato.getNome() %> />
           </form>
<%         
       } // showEditForm
%>

<! ------------------------------------------------------------------->
<!--   atualizar valores -->
<%     
     if (action.equals("updateValues")) {
       String nome = request.getParameter("nome");
       String telefone = request.getParameter("telefone");
       int id = Integer.parseInt(request.getParameter("id"));
       transacoes.Contato tn = new transacoes.Contato();
       data.ContatoDO contato = new data.ContatoDO();
       contato.setId(id);
       contato.setNome(nome);
       contato.setTelefone(telefone); 
       if ( tn.atualizar(contato)) {
         // avisar usuario que transacao foi feita com sucesso
%>
          Transação realizada com sucesso!
          <form action="./index.html" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     } else {
%>
          Erro ao atualizar dados do contato
          <form action="./update.jsp" method="post">
             <input type="submit" name="retry" value="Repetir" />
          </form>
<%     }
     } // updateValues
%>

</body>
</html>
