<%-- 
    Document   : atualizarGamer
    Created on : 06.12.2015, 17:09:20
    Author     : Rafael
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="Stylesheet" href="css/StyleSheetGamer.css"/>
        <title>HttpSessionDemo - Pagina do Gamer</title>
    </head>
    <body>
        <div style="background-image:url('images/spm2.jpg'); padding: 1px  ">
<%
    // VERIFICACAO MANUAL DO LOGIN
    /*if ( session.getAttribute("user_name") == null) {
       pageContext.forward("index.jsp");
    }
    */
    String nome = (String)session.getAttribute("user_name");
%>
<%     
       String action = request.getParameter("action");
       if ( null == action ) {
          action = "showUpdateform";
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
                    <a href="./gamer.jsp">Minha Conta</a>
                </th>
            </tr>
        </thead>
        <tbody>
            <form method="post" action=index.jsp>
                <tr>
                    <td align="center">
                        <h3>Bem vindo <%= nome %> !!</h3>
                    </td>
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
                    
<%-- Fim da tabela do lado esquerdo e inicio das opçoes no topo --%>
<div>
        <div class="options">
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
            <a href="./atualizarGamer.jsp">Editar Conta</a>
        </div> 
</div> 
<div id="center">
<%     
      
%>
     
     
          <form action="./update.jsp" method="post">
             <table>
               <tr>
                  <td>Nome:</td>
                  <td><input type="text" name="nome" />
                  <td>Nome Atual:</td>
                  
               </tr>
               <tr>
                  <td>CPF:</td>
                  <td><input type="text" name="cpf" />
                  <td>CPF Atual:</td>
                  
              
               </tr>
               <tr>
                  <td>Email:</td>
                  <td><input type="text" name="email" />
                  <td>Email atual:</td>
                  
              
               </tr>
               <tr>
                  <td>Telfone:</td>
                  <td><input type="text" name="telefone" />
                   <td>Telfone Atual:</td>
                  
                  
               </tr>
               <tr>
                  <td>Cidade:</td>
                  <td><input type="text" name="cidade" />
                  <td>Cidade Atual:</td>
                  
                  
               </tr>
             </table>
             <input type="submit" name="action" value="atualizar" />
	     <a href="gamer.jsp">Voltar</a>
          </form>      
    
    <%
        if(action.equals("Atualizar")) {
           %>
             <table>
               <tr>
                  <td>Contato Atualizado</td>
               </tr>
            </table>
              
    <%     
            }
       }
    %>
    
</div>
%>        
<%-- Rodape --%>
        <div id="footer">
            <p>PMR2490 - Sistemas de Informação
            <br>Escola Politécnida da USP</p>
        </div>
        </div>
    </body>
</html>