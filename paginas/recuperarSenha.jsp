<%@page import="transacoes.Loja"%>
<%@page import="data.LojaDO"%>
<%@page import="transacoes.Gamer"%>
<%@page import="data.GamerDO"%>
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
        <title>Recuperação de senha</title>
    </head>
    <body>
        <div style="background-image:url('images/spm2.jpg'); padding: 1px  ">
    
            <div id="poli">
                <h1>POLI GAMES</h1>
            </div>
    
            <p> Responda a sua  pergunta de segurança e defina uma nova senha ;) </p>
            <div id="left"> 
                <div id="left2">
<%                  
                    Usuario tn = new Usuario();
                    UsuarioDO user = tn.buscar((String)session.getAttribute("userName"));
                    String action = request.getParameter("action");
                    if ( null == action ) {
                        action = "redefinePassword";
%>
                        <form action="./recuperarSenha.jsp" method="post">
                            <table>
                                <tr>
                                    <td>Pergunta de segurança </td>
                                    <td><p><em><% user.getPergunta().toString(); %></em></p></td>
                                </tr>
                                <tr>
                                    <td>Resposta </td>
                                    <td><input type="text" name="resposta"></td>
                                </tr>
                                <tr>
                                    <td>Nova senha </td>
                                    <td><input type="passsword" name="senha"></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <input type="submit" name="action" value="Redefinir" />
                                    </td>
                                </tr>
                            </table>
                        </form>
<%
                    }  
                    if (action.equals("Redefinir")){
                        String resposta = request.getParameter("resposta");
                        String senha = request.getParameter("senha");
                        if (resposta.equals(user.getResposta()) && !senha.equals(null)){
                            user.setSenha(senha);
                            action = "RedefinirOK";
                        }
                        else {
%>
                            <p><em>RESPOSTA ERRADA</em> ou <em>FALTOU ESCREVER A SENHA</em></p>
                            <a href="./recuperarSenha.jsp">Tentar de novo</a>
                            <a href="./index.jsp">Voltar para o login</a>
<%
                        }
                    }

                    if (action.equals("RedefinirOK")){
%>
                        <h3>Senha alterada!</h3>
                        <a href="./index.jsp">Voltar para o login</a>
<%
                    }
%>
</div>
    </div>
    <div id="right">
        
    </div>
        <div id="charizard"> 
</div>
    <div id="footer">
	<p>PMR2490 - Sistemas de Informação
        <br>Escola Politécnida da USP</p>
    </div>
        </div>    
    </body>
</html>