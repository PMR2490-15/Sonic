<%-- 
    Document   : atualizarGamer
    Created on : 06.12.2015, 17:09:20
    Author     : Rafael
--%>

<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<%@ page import="transacoes.Gamer" %>
<%@ page import="data.GamerDO" %>
<%@ page import="java.util.Vector" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="Stylesheet" href="css/StyleSheetLoja.css"/>
        <title>Pagina do Gamer - Editar Conta</title>
    </head>
    <body>
        <div style="background-image:url('images/spm2.jpg'); padding: 1px  ">
<%
    if ( session.getAttribute("User_ID") == null) {
       pageContext.forward("index.jsp");
    }
    String action = request.getParameter("action");
    if(action == null){
        action="Idle";
    }
    int gamerID = Integer.parseInt((String)session.getAttribute("User_ID"));
    Gamer gamertn = new Gamer();
    GamerDO gamer = new GamerDO();
    gamer = gamertn.buscar(gamerID);
    String nome = gamer.getNome();
    //String nome = Integer.toString(gamerID);
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

    <%--centro--%>
<div id="center">
    <table>
        <tr>
               <h4>Dados do Gamer</h4>
        </tr>
        <tr>
            <td align="right">
                <hdl>Nome:</hdl>
            </td>
            <td align="center">
                <input type="text" name="newnome" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>CPF:</hdl>
            </td>
            <td align="center">
                <input type="text" name="newcnpj" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>e-mail:</hdl>
            </td>
            <td align="center">
                <input type="text" name="newemail" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>Telefone:</hdl>
            </td>
            <td align="center">
                <input type="text" name="newtel1"  />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td align="center">
                <input type="submit"  value="Salvar"/>
            </td>
        </tr>
        <tr>
            <td align="left">
                <div class="voltar">
                    <a href="./gamer.jsp">Voltar</a>
                </div>
            </td>
        </tr>
    </table>
    </form>
<%
        action = request.getParameter("action");
        System.out.println("agora foi " + action);
        if(action.equals("Salvar")){
            System.out.println("agora foi");
       GamerDO newgamer = new GamerDO();
       Gamer newgamertn = new Gamer();
       newgamer.setUsuario_Id(gamer.getUsuario_Id());
       newgamer.setNome((String)request.getParameter("newnome"));
       newgamer.setCpf(request.getParameter("newcpf"));
       newgamer.setEmail((String)request.getParameter("newemail"));
       newgamer.setTelefone(request.getParameter("newtel"));
       //newloja.setFoto((String)request.getParameter("newfoto"));
       if((String)request.getParameter("newfoto") == null){
           newgamer.setFoto(gamer.getFoto());
       } else{
           newgamer.setFoto((String)request.getParameter("newfoto"));
       }
       newgamer.setSuspenso_ate(gamer.getSuspenso_ate());
       newgamer.setAtivo(gamer.getAtivo());
       newgamertn.atualizar(newgamer);
       //session.setAttribute("User_ID", Integer.toString(gamerID));
       pageContext.forward("gamer.jsp");
              
            }
        
%>
</div>
               
    
<%-- Rodape --%>
        <div id="footer">
            <p>PMR2490 - Sistemas de Informação
            <br>Escola Politécnida da USP</p>
        </div>
        </div>
    </body>
</html>
