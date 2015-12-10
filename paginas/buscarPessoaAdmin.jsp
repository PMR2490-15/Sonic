<%@page import="transacoes.ItemInventario"%>
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
                String action = request.getParameter("action");
                action = "idle";
                int adminID = Integer.parseInt((String) session.getAttribute("User_ID"));
                Administrador admintn = new Administrador();
                AdministradorDO admin = new AdministradorDO();
                admin = admintn.buscar(adminID);
                String nome = admin.getNome();
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
    String estado, preco, tipo, acao;
    int size;
    List<ItemInventarioDO> listItemInv = new ArrayList<ItemInventarioDO>();
    ItemInventarioDO itemInv;
    ItemDO item;
    Item tnI = new Item();
    ItemInventario tnII = new ItemInventario();
    listItemInv = tnII.pesquisar(busca);
    if (! listItemInv.equals(null)) {
%>
        <table>
<%
        size = listItemInv.size();
        for(int i = 0; i < size; i++) {
            itemInv = listItemInv.get(i);
            item = tnI.buscar(itemInv.getItemId());
            
            if      (itemInv.getEstado() == 1) {estado = "novo";}
            else if (itemInv.getEstado() == 2) {estado = "como novo";}
            else                               {estado = "usado";}
            
            preco = itemInv.getPreco();
            
            if      (itemInv.getTipoTransacao() == 1) {tipo = "venda";}
            else if (itemInv.getTipoTransacao() == 2) {tipo = "troca";}
            else                                      {tipo = "troca & venda";}
%>
            <tr>
                <input type="hidden" name="acao<% String.valueOf(i); %>" value="null" />
                <td align="left"><% item.getNome(); %></td>
                <td align="right"><% estado.toString(); %></td>
                <td align="right">Para <% tipo.toString(); %></td>
                <% if(itemInv.getTipoTransacao() != 2) { %>
                <td align="right">R$ <% preco.toString(); %></td><% } %>
                <td><input type="submit" name="action<% String.valueOf(i); %>" value="Visualizar"/></td>
            </tr>
<%      } %>
        </table>
<%
       // for (int i=0; i < size; i++) {
         //   acao = (String)session.getAttribute("action"+String.valueOf(i));
           // if (acao.equals("Visualizar")) {
            //    session.setAttribute("idItemInventario",
             //                        String.valueOf(listItemInv.get(i).getId()));
             //   pageContext.forward("anuncioGamer.jsp");
             //   break;
            //}
        //}
    }

    else {
%>
        <p>Nenhum game encontrado! ;'(</p>
<%
    }
%>
    
<%  
     if (((String)session.getAttribute("enviar")).equals("Buscar Usuário")) {
       pageContext.forward("buscarUsuarioLoja.jsp");
     }
     
     if (((String)session.getAttribute("enviar")).equals("Buscar Item")) {
       pageContext.forward("buscarItemLoja.jsp");
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
