<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<%@page import="transacoes.Usuario" %>
<%@ page import="transacoes.Loja" %>
<%@ page import="data.LojaDO" %>
<%@ page import="transacoes.Gamer" %>
<%@ page import="data.GamerDO" %>
<%@ page import="java.util.Date , java.text.DateFormat ,java.text.SimpleDateFormat" %>
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
    
    <p> Neste site você pode encontrar todos os seus jogos favoritos. Venda seus jogos de maneira rápida e fácil! </p>
        
    <div id="left"> 
        
        <div id="left2">
<%          String action = request.getParameter("action");
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
                                <input type="submit" name="action" value="Esqueci minha senha :/" />
                                <input type="submit" name="action" value="loja" />
                                <input type="submit" name="action" value="gamer" />
                                <input type="submit" name="action" value="admin" />
                            </td>
                        </tr>
                    </table>
                </form>
<%        
            }
            if (action.equals("loja")) {
                int id = 500; //simular ID
                session.setAttribute("User_ID", Integer.toString(id));
                pageContext.forward("loja.jsp");
            }
            if (action.equals("admin")) {
                int id = 1000; //simular ID
                session.setAttribute("User_ID", Integer.toString(id));
                pageContext.forward("admin.jsp");
            }
            if (action.equals("gamer")) {
                int id = 3; //simular ID
                session.setAttribute("User_ID", Integer.toString(id));
                pageContext.forward("gamer.jsp");
            }
            if (action.equals("Login :D")){
                String username = request.getParameter("nomeUsuario");
                String password = request.getParameter("senha");
                Usuario tn = new Usuario();
                UsuarioDO usuario = tn.buscar(username);
                if (usuario == null || !password.equals((String)usuario.getSenha())) {
%>         
                <p style="color:red"> <em>NOME DE USUARIO OU SENHA INCORRETOS!</em></p>
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
                    Gamer gamertn = new Gamer();
                    GamerDO gamer = new GamerDO();
                    gamer = gamertn.buscar(usuario.getId());
                    String suspensodata = gamer.getSuspenso_ate();
                    if(suspensodata == null){
                        session.setAttribute("User_ID", Integer.toString(usuario.getId()));
                        pageContext.forward("gamer.jsp");
                    }else{
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        Date date = new Date();
                        String atual = dateFormat.format(date);
                        int ano = Integer.parseInt(suspensodata.substring(0,4));
                        int mes = Integer.parseInt(suspensodata.substring(5,7));
                        int dia = Integer.parseInt(suspensodata.substring(8,10));
                        int anoatual = Integer.parseInt(atual.substring(0,4));
                        int mesatual = Integer.parseInt(atual.substring(5,7));
                        int diaatual = Integer.parseInt(atual.substring(8,10));
                        if(anoatual>ano || (anoatual==ano && mesatual>mes) || (anoatual==ano && mesatual==mes && diaatual>dia)){        
                            session.setAttribute("User_ID", Integer.toString(usuario.getId()));
                            pageContext.forward("gamer.jsp");
                        }else{
%>
    <p style="color:red"> <em>USUÁRIO SUSPENSO ATÉ <%= Integer.toString(dia)%>/<%= Integer.toString(mes)%>/<%= Integer.toString(ano)%>!</em></p>
    <div class="voltar">
                    <a href="./index.jsp">Voltar</a>
    </div>
<%
                    }
                }
           }
           if(usuario.getTipo() == 2){
               Loja lojatn = new Loja();
               LojaDO loja = new LojaDO();
               loja = lojatn.buscar(usuario.getId());
               String suspensodata = loja.getSuspenso_ate();
               if(suspensodata == null){
                   session.setAttribute("User_ID", Integer.toString(usuario.getId()));
                   pageContext.forward("loja.jsp");
               }else{
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    Date date = new Date();
                    String atual = dateFormat.format(date);
                    int ano = Integer.parseInt(suspensodata.substring(0,4));
                    int mes = Integer.parseInt(suspensodata.substring(5,7));
                    int dia = Integer.parseInt(suspensodata.substring(8,10));
                    int anoatual = Integer.parseInt(atual.substring(0,4));
                    int mesatual = Integer.parseInt(atual.substring(5,7));
                    int diaatual = Integer.parseInt(atual.substring(8,10));
                    if(anoatual>ano || (anoatual==ano && mesatual>mes) || (anoatual==ano && mesatual==mes && diaatual>dia)){        
                        session.setAttribute("User_ID", Integer.toString(usuario.getId()));
                        pageContext.forward("loja.jsp");
                    }else{
%>
    <p style="color:red"> <em>USUÁRIO SUSPENSO ATÉ <%= Integer.toString(dia)%>/<%= Integer.toString(mes)%>/<%= Integer.toString(ano)%>!</em></p>
    <div class="voltar">
                    <a href="./index.jsp">Voltar</a>
    </div>
<%
                    }
               }
           }
                    if(usuario.getTipo() == 3){
                        session.setAttribute("User_ID", Integer.toString(usuario.getId()));
                        pageContext.forward("admin.jsp");
                    }
                }
            } // login

            else if (action.equals("Esqueci minha senha :/")) {
                String username = request.getParameter("nomeUsuario");
                Usuario tn = new Usuario();
                UsuarioDO usuario = tn.buscar(username);
                if (usuario.equals(null)) {
                    
                    pageContext.forward("./index.jsp");
                }
                else {
                    session.setAttribute("nomeUsuario", username);
                    pageContext.forward("./recuperarSenha.jsp");
                }
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
    </div>    
</body>
</html>