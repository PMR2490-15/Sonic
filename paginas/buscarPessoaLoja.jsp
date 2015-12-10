<%@page import="data.LojaDO"%>
<%@page import="transacoes.Loja"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.UsuarioDO"%>
<%@page import="data.ItemDO"%>
<%@page import="data.ItemInventarioDO"%>
<%@page import="java.util.List"%>
<%@page import="transacoes.Gamer"%>
<%@page import="data.GamerDO"%>
<%@page import="data.UsuarioDO"%>
<%@page import="data.AdministradorDO"%>
<%@page import="transacoes.Usuario"%>
<%@page import="data.AdministradorData"%>
<%@page import="transacoes.Administrador"%>
<%@page import="data.LojaData"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="Stylesheet" href="css/StyleSheetLoja.css"/>
        <title>Pagina da Loja</title>
    </head>
    <body>
        <div style="background-image:url('images/spm2.jpg'); padding: 1px  ">
<%
    if ( session.getAttribute("User_ID") == null) {
       pageContext.forward("index.jsp");
    }
    
    int lojaID = Integer.parseInt((String)session.getAttribute("User_ID"));
    
    Loja lojatn = new Loja();
    
    LojaDO loja = new LojaDO();
    loja = lojatn.buscar(lojaID);
    String nome = loja.getNome();
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
                    <a href="./loja.jsp">Minha Conta</a>
                </th>
            </tr>
        </thead>
        <tbody>
            <form method="post" action=loja.jsp>
                <tr>
                    <td align="center">
                        <h3>Loja <%= nome %> !!</h3>
                    </td>
                </tr>
                <tr>
                    <td><img id="foto" src=<%= loja.getFoto()%>></td>
                </tr>
                <tr>
                    <table>
                        <tr>
                        <td><input type="text" name="buscar" /></td>
                        <td align="right"><img id="lupa" src="images/lupa.png"></td>
                        </tr>
                    </table>
                </tr>                                
                <tr>
                    <td align="right"> 
                        <input type="submit" name="buscarUser" value="Buscar Usuário"/>
                    </td>
                    <td align="left"> 
                        <input type="submit" name="buscarItem" value="Buscar Item"/>
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
            <a href="./comunicadoLoja.jsp"<%session.setAttribute("User_ID", Integer.toString(lojaID));%>>Comunicados</a>
        </div>
        <div class="options">
            <a href="./search.jsp">Histórico</a>
        </div>
        <div class="options"> 
            <a href="./lojaUpdate.jsp" <%session.setAttribute("User_ID", Integer.toString(lojaID));%>>Editar Conta</a>
        </div> 
</div>  

    <%--centro--%>
    <div id="center">
<%
    String busca = (String)session.getAttribute("busca");
    String nomeUsuario = "";
    int idPessoa = 0;
    String nomePessoa = "";
    String email = "";
    String telefone = "";
    String telefone2 = "";
    String cidade = "";
    String site = "";
    int tipo = 0;
    String action = "";
    
    int size;
    List<UsuarioDO> listusuario = new ArrayList<UsuarioDO>();
    UsuarioDO usuario = new UsuarioDO();
    Usuario tn = new Usuario();
    listusuario = tn.pesquisar(busca);
    if ( listusuario != null && listusuario.size() > 0 ) {
%>
        <table>
<%
        size = listusuario.size();
        for(int i = 0; i < size; i++) {
            usuario = listusuario.get(i);
            tipo = usuario.getTipo();
            idPessoa = usuario.getId();
            if (tipo == 3){
        Administrador administradortn = new Administrador(); 
        AdministradorDO perfil = new AdministradorDO();
        perfil = administradortn.buscar(idPessoa);
        nomePessoa = perfil.getNome();
        email = perfil.getEmail();
        telefone = perfil.getTelefone();
    }
    if (tipo == 2){
        Loja lojinhatn = new Loja();
        LojaDO perfil = new LojaDO();
        perfil = lojinhatn.buscar(idPessoa);
        nomePessoa = perfil.getNome();
        email = perfil.getEmail();
        telefone = (String)perfil.getTelefone_1();
        telefone2 = (String)perfil.getTelefone_2();
        site = perfil.getURL();
    }
    if (tipo == 1){
        Gamer jogadortn = new Gamer();
        GamerDO perfil = new GamerDO();
        perfil = jogadortn.buscar(idPessoa);
        nomePessoa = perfil.getNome();
        email = perfil.getEmail();
        telefone = perfil.getTelefone();
        cidade = perfil.getCidade();
    }
%>
            <tr>
                <input type="hidden" name="action<%= String.valueOf(i) %>" value="null" />
                <td align="left"><%= nomePessoa %></td>
                <td align="right"><%= email %></td>
                <td align="right">Para <%= telefone %></td>
                <td align="right">Para <%= telefone2 %></td>
                <td align="right">Para <%= cidade %></td>
                <td align="right">Para <%= site %></td>
                <td><input type="submit" name="action<%= String.valueOf(i) %>" value="Ver perfil"/>
                    <input type="hidden" name="view" value="<%= String.valueOf(i)%>"/> </td>
            </tr>
<%      } %>
        </table>

<%

    } else {
%>
        <p>Nenhum Usuário encontrado! ;'(</p>
<%
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
