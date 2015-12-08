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
        <title>HttpSessionDemo-Pagina de Login</title>
    </head>
    <body>
        <div style="background-image:url('images/spm2.jpg'); padding: 1px  ">
    
            <div id="poli">
                <h1>POLI GAMES</h1>
            </div>
    
            <p> Neste site você pode encontrar todos os seus jogos favoritos. Venda ou troque seus jogos de maneira segura, rápida e fácil! </p>
            <div id="left"> 
                <div id="left2">
<%                  String action = request.getParameter("action");
                    if ( null == action ) {
                        action = "showLoginForm";
%>
                        <form action="./caadastroCliente.jsp" method="post">
                            <table>
                                <tr>
                                    <td>Tipo de Usuário </td>
                                        <td align="left">
                                            <select name="tipo"> 
                                                <option value="2">Loja</option> 
                                                <option value="1">Gamer</option>                                           
                                            </select>
                                        </td>
                                </tr>
                                <tr>
                                    <td>Nome de usuário </td>
                                    <td><input type="text" name="userName"  /></td>
                                </tr>
                                <tr>
                                    <td>Nome </td>
                                    <td><input type="text" name="Name"></td>
                                </tr>
                                <tr>
                                    <td>CPF / CNPJ</td>
                                    <td><input type="text" name="cpf"  /></td> 
                                </tr>
                                <tr>
                                    <td>Cidade </td>
                                    <td><input type="text" name="cidade"  /></td> 
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
                    if (action.equals("Enviar")){
                        Usuario tn = new Usuario();
                        UsuarioDO novo = tn.buscar(request.getParameter("userName"));
                        if(novo.equals(null)){
                            novo.setNome_Usuario(request.getParameter("userName"));
                            novo.setSenha(request.getParameter("senha"));
                            novo.setTipo(Integer.parseInt(request.getParameter("tipo")));
                            novo.setPergunta(request.getParameter("pergunta"));
                            novo.setResposta(request.getParameter("resposta"));
                            tn.incluir(novo);
                            novo = tn.buscar(request.getParameter("nomeUsuario"));
                            if (novo.getTipo() == 1){
                                GamerDO gamer = new GamerDO();
                                gamer.setUsuario_Id(novo.getId());
                                gamer.setNome(request.getParameter("nome"));
                                gamer.setCpf(request.getParameter("cpf"));
                                gamer.setCidade(request.getParameter("cidade"));
                                gamer.setEmail(request.getParameter("email"));
                                gamer.setTelefone(request.getParameter("tel1"));
                                gamer.setAtivo(true);
                                gamer.setSuspenso_ate(null);
                                
                                Gamer tnGamer = new Gamer();
                                tnGamer.incluir(gamer);
                            }
                            else { // if(loja)
                                LojaDO loja = new LojaDO();
                                loja.setID(novo.getId());
                                loja.setNome(request.getParameter("nome"));
                                loja.setCNPJ(request.getParameter("cpf"));
                                loja.setEmail(request.getParameter("email"));
                                loja.setTelefone_1(request.getParameter("tel1"));
                                loja.setTelefone_2(request.getParameter("tel2"));
                                loja.setURL(null);
                                loja.setAtivo(true);
                                loja.setSuspenso_ate(null);
                                
                                Loja tnLoja = new Loja();
                                tnLoja.incluir(loja);
                            }
                        }
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
