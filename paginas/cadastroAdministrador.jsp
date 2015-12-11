<%@page import="transacoes.Administrador"%>
<%@page import="data.AdministradorDO"%>
<%@page import="data.UsuarioDO"%>
<%@page import="transacoes.Usuario" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="Stylesheet" href="css/StyleSheetLogin.css"/>
        <title>Pagina de Cadastro de Administrador</title>
    </head>
    <body>
        <div style="background-image:url('images/spm2.jpg'); padding: 1px  ">
    
            <div id="poli">
                <h1>POLI GAMES</h1>
            </div>
    
            <p> Neste site você pode encontrar todos os seus jogos favoritos. Venda ou troque seus jogos de maneira segura, rápida e fácil! </p>
            <div id="left"> 
                <div id="left2">
<%                  
                    String action = request.getParameter("action");
                    if ( null == action ) {
                        action = "CreateUser";
%>
                        <form action="./cadastroAdministrador.jsp" method="post">
                            <table>
                                <tr>
                                    <h3>Cadastro</h3>
                                </tr>
                                <tr>
                                    <td>Nome de usuário </td>
                                    <td><input type="text" name="userName"  /></td>
                                </tr>
                                <tr>
                                    <td>Senha </td>
                                    <td><input type="password" name="senha"  /></td>
                                </tr>
                                <tr>
                                    <td>Pergunta de segurança </td>
                                    <td><input type="text" name="pergunta"></td>
                                </tr>
                                <tr>
                                    <td>Resposta </td>
                                    <td><input type="text" name="resposta"></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <input type="submit" value="Avançar" />
                                        <input type="hidden" name="action" value="UserOK" />
                                    </td>
                                </tr>
                            </table>
                        </form>
<%        
                    }  
                    if (action.equals("UserOK")){
                        UsuarioDO buscar = new UsuarioDO();
                        Usuario tn = new Usuario();                   
                        buscar = tn.buscar(request.getParameter("userName"));
                        if(buscar != null || (request.getParameter("senha")).equals("") || (request.getParameter("pergunta")).equals("") || (request.getParameter("resposta")).equals("")){
                            action="erro";
                        }
                        else{
                            session.setAttribute("userName", request.getParameter("userName"));
                            session.setAttribute("senha", request.getParameter("senha"));
                            session.setAttribute("tipo", "3");
                            session.setAttribute("pergunta", request.getParameter("pergunta"));
                            session.setAttribute("resposta", request.getParameter("resposta"));
							action = "CreateAdministrador";
         
                        }
                    }
                        //----------------------------------------------
                    if(action.equals("erro")){
%>
                        <h3>Nome de Usuário já existe ou campo não preenchido</h3>
                        <a href="./cadastroAdministrador.jsp">Voltar</a>
<%
                    }
                    else if(action.equals("CreateAdministrador")){
%>
                        <form action="./cadastroAdministrador.jsp" method="post">
                            <table>
                                <tr>
                                    <h3>Cadastro do Administrador</h3>
                                </tr>
                                <tr>
                                <td>Nome </td>
                                <td><input type="text" name="name"></td>
                                </tr>
                                <tr>
                                <td>CPF </td>
                                    <td><input type="text" name="cpf"  /></td> 
                                </tr>
                                <tr>
                                    <td>Email </td>
                                    <td><input type="text" name="email"  /></td>
                                </tr>
                                <tr>
                                    <td>Telefone </td>
                                    <td><input type="text" name="tel" /></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <input type="submit" value="Concluir" />
                                        <input type="hidden" name="action" value="AdministradorOK" />
                                    </td>
                                </tr>
                            </table>
                        </form>

<%
   }
%>
<! ------------------------------------------------------------------------->
<%
                    if(action.equals("AdministradorOK")){
                        Usuario tn = new Usuario();                   
                        UsuarioDO novo = new UsuarioDO();
                        novo.setNome_Usuario((String)session.getAttribute("userName"));
                        novo.setSenha((String)session.getAttribute("senha"));
                        novo.setTipo(Integer.parseInt((String)session.getAttribute("tipo")));
                        novo.setPergunta((String)session.getAttribute("pergunta"));
                        novo.setResposta((String)session.getAttribute("resposta"));
                        tn.incluir(novo);
                    
                        Usuario tn = new Usuario();
                        UsuarioDO novoAdministrador = new UsuarioDO();
                        novoAdministrador = tn.buscar((String)session.getAttribute("userName"));
                        Administrador tnAdministrador = new Administrador();
                        AdministradorDO administrador = new AdministradorDO();
                        administrador.setUsuario_Id(novogamer.getId());
                        administrador.setNome(request.getParameter("name"));
                        administrador.setCpf(request.getParameter("cpf"));
                        administrador.setEmail(request.getParameter("email"));
                        administrador.setTelefone(request.getParameter("tel"));
                        tnAdministrador.incluir(administrador);
                        action="CreateOK"; 
                    }
%>
<%
                    if (action.equals("CreateOK")){
%>
                        <h3>Cadastro completo</h3>
                        <a href="./index.jsp">Voltar</a>
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