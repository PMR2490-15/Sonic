<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<%@page import="transacoes.Usuario" %>
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
	  <form action="./caadastroCliente.jsp" method="post">
            <table>
              <tr>
                 <td>Tipo de Usuário </td>
                 <td align="left">
                    <select name="tipo"> 
                    <option value="1">Loja</option> 
                    <option value="gamer">Gamer</option>                                           
                   </select>
                     
                   </td>
              </tr>
            <%
                String n = request.getParameter("tipo");
                if(n.equals("gamer")){
            %>
            <p> blabla</p>
            <tr>
                  <td>Nome </td>
                 <td><input type="text" name="userName"  />  
              </tr>
              <tr>
                 <td>CPF </td>
                 <td><input type="text" name="cpf"  />  
              </tr>
              
            <%
                }
                %>
                <tr>
                 <td>CNPJ </td>
                 <td><input type="text" name="cnpj" />  
              </tr>
              <tr>
                 <td>Cidade </td>
                 <td><input type="text" name="cidade"  />  
              </tr>
              <tr>
                 <td>Email </td>
                 <td><input type="text" name="email"  />  
              </tr>
              <tr>
                 <td>Telefone 1 </td>
                 <td><input type="text" name="tel1" />  
              </tr>
              <tr>
                 <td>Telefone 2 </td>
                 <td><input type="text" name="tel2"  />  
              </tr>
              <td>Senha </td>
                 <td><input type="password" name="senha"  />
              
              <tr>
                  <td></td>
                  <td>
                      <input type="submit" name="action" value="Enviar" />
                      
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

     if (action.equals("enviar")){
       String username = request.getParameter("userName");
       String cpf = request.getParameter("cpf");
       String cnpj = request.getParameter("cnpj");
       String cidade = request.getParameter("cidade");
       String email = request.getParameter("email");
       String tel1 = request.getParameter("tel1");
       String tel2 = request.getParameter("tel2");
       String password = request.getParameter("senha");
       Usuario tn = new Usuario();
       data.UsuarioDO user = new data.UsuarioDO();
       user.setNome_Usuario(username);
       user.setSenha(password);
       tn.incluir(user);
       data.GamerDO gamer = new data.GamerDO();
       gamer.setCidade(cidade);
       gamer.setNome(username);
       gamer.setCpf(cpf);
       gamer.setEmail(email);
       
       UsuarioDO usuario = tn.buscar(username);
       if (usuario == null || !password.equals((String)usuario.getSenha())) {
%>         
<p style="color:red"> <em>NOME OU SENHA DE USUÁRIO INCORRETO!</em></p>
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
       
       }else{
           if(usuario.getTipo() == 1){
               session.setAttribute("User_ID", Integer.toString(usuario.getId()));
               pageContext.forward("gamer.jsp");
           }
           if(usuario.getTipo() == 2){
               session.setAttribute("User_ID", Integer.toString(usuario.getId()));
               pageContext.forward("loja.jsp");
           }
           if(usuario.getTipo() == 3){
               session.setAttribute("User_ID", Integer.toString(usuario.getId()));
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
        String nomeUsuario = (String)session.getAttribute("nomeUsuario");
        Usuario tn = new Usuario();
        UsuarioDO usuario = tn.buscar(nomeUsuario);
        if (!usuario.equals(null)) {
            pageContext.forward("recuperarSenha.jsp");
        }
    } // forgotPassword
%>
</div>
    </div>
    <div id="right">
        
    </div>
        <div id="charizard"> 
            <%--        <img  class="charizard" src="images/Logo.png"> --%>
</div>
    <div id="footer">
	<p>PMR2490 - Sistemas de Informação
        <br>Escola Politécnida da USP</p>
    </div>
        </div>    
    </body>
</html>
