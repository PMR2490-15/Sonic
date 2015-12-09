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
        <title>Pagina de Cadastro</title>
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
                        <form action="./cadastroCliente.jsp" method="post">
                            <table>
                                <tr>
                                    <h3>Cadastro</h3>
                                </tr>
                                <tr>
                                    <td>Tipo de Usuário </td>
                                        <td align="left">
                                            <input type="radio" name="tipo" value="1" checked> Gamer
                                            <input type="radio" name="tipo" value="2"> Loja
                                        </td>
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
                            session.setAttribute("tipo", request.getParameter("tipo"));
                            session.setAttribute("pergunta", request.getParameter("pergunta"));
                            session.setAttribute("resposta", request.getParameter("resposta"));
                            if((request.getParameter("tipo")).equals("1")){
                                action="CreateGamer";
                            }else if((request.getParameter("tipo")).equals("2")){
                                action="CreateLoja";
                            }
                        }
                    }
                        //----------------------------------------------
                    if(action.equals("erro")){
%>
                        <h3>Nome de Usuário já existe ou campo não preenchido</h3>
                        <a href="./cadastroCliente.jsp">Voltar</a>
<%
                    }
                    else if(action.equals("CreateGamer")){
%>
                        <form action="./cadastroCliente.jsp" method="post">
                            <table>
                                <tr>
                                    <h3>Cadastro do Gamer</h3>
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
                                    <td>Cidade </td>
                                    <td><input type="text" name="cidade"  /></td> 
                                </tr>
                                <tr>
                                    <td>Foto </td>
                                    <td><input type="text" name="foto"  /></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <input type="submit" value="Concluir" />
                                        <input type="hidden" name="action" value="GamerOK" />
                                    </td>
                                </tr>
                            </table>
                        </form>

<%
   } else if(action.equals("CreateLoja")){
%>
                        <form action="./cadastroCliente.jsp" method="post">
                            <table>
                                <tr>
                                    <h3>Cadastro da Loja</h3>
                                </tr>
                                <tr>
                                <td>Nome </td>
                                <td><input type="text" name="name"></td>
                                </tr>
                                <tr>
                                <td>CNPJ </td>
                                    <td><input type="text" name="cnpj"  /></td> 
                                </tr>
                                <tr>
                                    <td>Email </td>
                                    <td><input type="text" name="email"  /></td>
                                </tr>
                                <tr>
                                    <td>Telefone 1 </td>
                                    <td><input type="text" name="tel1" /></td>
                                </tr>
                                <tr>
                                    <td>Telefone 2 </td>
                                    <td><input type="text" name="tel2"  /></td>
                                </tr>
                                <tr>
                                    <td>URL </td>
                                    <td><input type="text" name="url"  /></td>
                                </tr>
                                <tr>
                                    <td>Foto </td>
                                    <td><input type="text" name="foto"  /></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <input type="submit" value="Concluir" />
                                        <input type="hidden" name="action" value="LojaOK" />
                                    </td>
                                </tr>
                            </table>
                        </form>
<%
   }
%>
<! ------------------------------------------------------------------------->
<%
                    if(action.equals("LojaOK") || action.equals("GamerOK")){
                        Usuario tn = new Usuario();                   
                        UsuarioDO novo = new UsuarioDO();
                        novo.setNome_Usuario((String)session.getAttribute("userName"));
                        novo.setSenha((String)session.getAttribute("senha"));
                        novo.setTipo(Integer.parseInt((String)session.getAttribute("tipo")));
                        novo.setPergunta((String)session.getAttribute("pergunta"));
                        novo.setResposta((String)session.getAttribute("resposta"));
                        tn.incluir(novo);
                    }
                    if (action.equals("LojaOK")){
                        Loja tnLoja = new Loja();
                        LojaDO loja = new LojaDO();
                        Usuario tn = new Usuario();
                        UsuarioDO novaloja = new UsuarioDO();
                        novaloja = tn.buscar((String)session.getAttribute("userName"));
                        loja.setID(novaloja.getId());
                        loja.setNome(request.getParameter("name"));
                        loja.setCNPJ(request.getParameter("cnpj"));
                        loja.setEmail(request.getParameter("email"));
                        loja.setTelefone_1(request.getParameter("tel1"));
                        loja.setTelefone_2(request.getParameter("tel2"));
                        loja.setURL(request.getParameter("url"));
                        loja.setFoto(request.getParameter("foto"));
                        loja.setAtivo(true);
                        tnLoja.incluir(loja);
                        action="CreateOK"; 
                    }
                    if (action.equals("GamerOK")){
                        Usuario tn = new Usuario();
                        UsuarioDO novogamer = new UsuarioDO();
                        novogamer = tn.buscar((String)session.getAttribute("userName"));
                        Gamer tnGamer = new Gamer();
                        GamerDO gamer = new GamerDO();
                        gamer.setUsuario_Id(novogamer.getId());
                        gamer.setNome(request.getParameter("name"));
                        gamer.setCpf(request.getParameter("cpf"));
                        gamer.setCidade(request.getParameter("cidade"));
                        gamer.setEmail(request.getParameter("email"));
                        gamer.setTelefone(request.getParameter("tel"));
                        gamer.setFoto(request.getParameter("foto"));
                        gamer.setAtivo(true);
                        gamer.setSuspenso_ate(null);
                        tnGamer.incluir(gamer);
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
