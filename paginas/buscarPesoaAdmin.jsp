<%-- 
    Document   : buscarPesoaAdmin
    Created on : 10.12.2015, 13:01:25
    Author     : Rafael
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="data.GamerDO"%>
<%@page import="data.GamerData"%>
<%@page import="transacoes.Gamer"%>
<%@page import="data.UsuarioDO"%>
<%@page import="data.AdministradorDO"%>
<%@page import="transacoes.Usuario"%>
<%@page import="data.AdministradorData"%>
<%@page import="transacoes.Administrador"%>
<%@page import="data.LojaDO"%>
<%@page import="data.LojaData"%>
<%@page import="transacoes.Loja"%>
<%@page import="java.util.List"%>

<%-- <%@page import="transacoes.ItemInventario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.ItemDO"%>
<%@page import="data.ItemInventarioDO"%>
<%@page import="data.ItemInventarioDO"%>
<%@page import="transacoes.Item"%>
<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<%@ page import="transacoes.Administrador" %>
<%@ page import="data.AdministradorDO" %>
<%@ page import="java.util.Vector" %>
<%@page import="data.UsuarioDO"%>
<%@page import="transacoes.Usuario"%> --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="Stylesheet" href="css/StyleSheetAdmin.css"/>
        <title>HttpSessionDemo - Pagina do Admin</title>
    </head>
    <body>
        <div style="background-image:url('images/spm2.jpg'); padding: 1px  ">
            <%
                if (session.getAttribute("User_ID") == null) {
                    pageContext.forward("index.jsp");
                }
                int adminID = Integer.parseInt((String) session.getAttribute("User_ID"));
                
                Administrador admintn = new Administrador();
                
                AdministradorDO admin = new AdministradorDO();
                admin = admintn.buscar(adminID);
                String nome = admin.getNome();
                String view = request.getParameter("view");
//                System.out.println("view "+view);
                    if (view == null) {
                        view = "idle";
                    }
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
                    <a href="./admin.jsp">Pagina Inicial</a>
                </th>
            </tr>
        </thead>
        <tbody>
            <form method="post" action=admin.jsp>
                <tr>
                    <td align="center">
                        <h3>Administrador <%= nome %> !!</h3>
                    </td>
                </tr>
                <tr>
                    <td><img id="foto" src="images/Venusaur.png"></td>
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
                        <input type="submit" name="enviar" value="Buscar Item"/>
                        <input type="hidden" name="campo_controle" />
                    </td>
                    <td align="right"> 
                        <input type="submit" name="enviar" value="Buscar Usuário"/>
                        <input type="hidden" name="campo_controle" />
                    </td>
                </tr>
                <tr>
                    <table>
                        <td><input type="text" name="usuario" /></td>
                        <td align="left"><img id="lupa" src="images/Super_Hammer.png"></td>
                    </table>
                </tr>
                <tr>
                    <td align="right"> 
                        <input type="submit" name="enviar" value="Banir Usuário"/>
                        <input type="hidden" name="campo_controle" />
                    </td>
                </tr>
            </form>
        </tbody>
    </table>
</div>
<div>
        <div class="options">
            <a href="./insertItemAdmin.jsp">Cadastrar Item</a>
        </div> 
        <div class="options">
            <a href="./comunicadoAdmin.jsp">Comunicados</a>
        </div>
        <div class="options"> 
            <a href="./adminUpdate.jsp" <%session.setAttribute("User_ID", Integer.toString(adminID));%>>Editar Conta</a>
        </div> 
</div>

<%--Centro--%>
<div id="center">
<%
    String busca = (String)session.getAttribute("busca");
    String nomeUsuario = "";
    int idPessoa = 0;
    String idPessoaString;
    String nomePessoa = "";
    String email = "";
    String telefone = "";
    String telefone2 = "";
    String cidade = "";
    String site = "";
    int tipo = 0;
    String action = request.getParameter("action");
    
    int size;
    List<UsuarioDO> listusuario = new ArrayList<UsuarioDO>();
    UsuarioDO usuario = new UsuarioDO();
    Usuario tn = new Usuario();
    listusuario = tn.pesquisar(busca);
    
    if (!view.equals("idle")) {
        
        session.setAttribute("Requested_ID", request.getParameter("view"));
        // session.setAttribute("Requested_ID", "2");
        pageContext.forward("perfil_usuario.jsp");
    } 

    if ( listusuario != null && listusuario.size() > 0 ) {
%>
        <table>
<%
        size = listusuario.size();
        for(int i = 0; i < size; i++) {
            usuario = listusuario.get(i);
            tipo = usuario.getTipo();
            idPessoa = usuario.getId();
//            System.out.println("idPessoa "+idPessoa);
            if (tipo == 3){
        Administrador administradortn = new Administrador(); 
        AdministradorDO perfil = new AdministradorDO();
        perfil = administradortn.buscar(idPessoa);
        nomePessoa = perfil.getNome();
        email = perfil.getEmail();
        telefone = perfil.getTelefone();
    }
    if (tipo == 2){
        Loja lojatn = new Loja();
        LojaDO perfil = new LojaDO();
        perfil = lojatn.buscar(idPessoa);
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
    idPessoaString = String.valueOf(idPessoa);
    System.out.println("String "+idPessoaString);
%>
        <form method="post" action=buscarPesoaAdmin.jsp>
            <tr>
                <input type="hidden" name="action<%= String.valueOf(i) %>" value="null" />
                <td align="left"><%= nomePessoa %></td>
                <td align="right"><%= email %></td>
                <td align="right"><%= telefone %></td>
                <td align="right"><%= telefone2 %></td>
                <td align="right"><%= cidade %></td>
                <td align="right"><%= site %></td>
                <td><input type="submit" name="action<%= String.valueOf(i) %>" value="Ver perfil"/>
                    <input type="hidden" name="view" value="<%= idPessoaString%>"/> </td>
            </tr>
        </form>

<%      // System.out.println("view2 "+view);
        } %>
        </table>
<%
    }
    else {
%>
        <p>Nenhum usuário encontrado! ;'(</p>
<%
    }
%>
    
<%  
     
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

