<%@page import="data.GamerDO"%>
<%@page import="transacoes.Gamer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.UsuarioDO"%>
<%@page import="data.ItemDO"%>
<%@page import="data.ItemInventarioDO"%>
<%@page import="java.util.List"%>
<%@ page import="transacoes.Item" %>
<%@ page import="transacoes.ItemInventario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="Stylesheet" href="css/StyleSheetGamer.css"/>
        <title>HttpSessionDemo - Resultado da Busca</title>
    </head>
    <body>
        <div style="background-image:url('images/spm2.jpg'); padding: 1px  ">
            <%
                if (session.getAttribute("User_ID") == null) {
                    pageContext.forward("index.jsp");
                }

                int gamerID = Integer.parseInt((String) session.getAttribute("User_ID"));

                Gamer gamertn = new Gamer();

                GamerDO gamer = new GamerDO();
                gamer = gamertn.buscar(gamerID);
                String nome = gamer.getNome();

                String itemID = request.getParameter("itemID");
                if (itemID == null) {
                    itemID = "idle";
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
                                <a href="./gamer.jsp">Minha Conta</a>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                    <form method="post" action=gamer.jsp>
                        <tr>
                            <td align="center">
                                <h3>Bem vindo <%= nome%> !!</h3>
                            </td>
                        </tr>
                        <tr>
                            <td><img id="foto" src="images/Logo.png"></td>
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
                    <a href="./update.jsp">Wishlist</a>
                </div>
                <div class="options">
                    <a href="./comunicadoGamer.jsp">Comunicados</a>
                </div>
                <div class="options">
                    <a href="./search.jsp">Histórico</a>
                </div>
                <div class="options"> 
                    <a href="./gamerUpdate.jsp">Editar Conta</a>
                </div> 
            </div>

            <%
                if (!itemID.equals("idle")) {
                    session.setAttribute("ItemID", itemID);
                    session.setAttribute("VendedorID", request.getParameter("vendedorID") );
                    pageContext.forward("confirmarCompra.jsp");

                }

            %>

            <%--centro--%>
            <div id="center">
                <%    String busca = (String) session.getAttribute("busca");
                    String estado = "";
                    String preco = "";
                    String tipo = "";
                    String action = "";

                    int size;
                    List<ItemInventarioDO> listItemInv = new ArrayList<ItemInventarioDO>();
                    ItemInventarioDO itemInv = new ItemInventarioDO();
                    ItemDO item = new ItemDO();
                    Item tnI = new Item();
                    ItemInventario tnII = new ItemInventario();
                    listItemInv = tnII.pesquisar(busca);
                    if (listItemInv != null && listItemInv.size() > 0) {
                %>
                <form method="post" action=buscarItemGamer.jsp>

                    <table>
                        <%
                            size = listItemInv.size();
                            for (int i = 0; i < size; i++) {
                                itemInv = listItemInv.get(i);
                                item = tnI.buscar(itemInv.getItemId());

                                if (itemInv.getEstado() == 1) {
                                    estado = "novo";
                                } else if (itemInv.getEstado() == 2) {
                                    estado = "como novo";
                                } else {
                                    estado = "usado";
                                }

                                preco = itemInv.getPreco();

                                if (itemInv.getTipoTransacao() == 1) {
                                    tipo = "venda";
                                } else if (itemInv.getTipoTransacao() == 2) {
                                    tipo = "troca";
                                } else {
                                    tipo = "troca & venda";
                                }
                        %>
                        <tr>
                        <input type="hidden" name="action<%= String.valueOf(i)%>" value="null" />
                        <td align="left"><%= item.getNome()%></td>
                        <td align="right"><%= estado.toString()%></td>
                        <%
                            if (itemInv.getTipoTransacao() != 2 && preco != null) {
                        %>
                        <td align="right">R$ <%= preco.toString()%></td>
                        <% } else { %>
                        <td align="right"></td>
                        <% } %>
                        <td><input type="submit" name="action<%= String.valueOf(i)%>" value="Comprar"/>
                            <input type="hidden" name="itemID" value="<%= String.valueOf(itemInv.getId())%>"/>
                        <input type="hidden" name="vendedorID" value="<%= String.valueOf(itemInv.getUsuarioId())%>"/></td>
                        </tr>
                        <%      } %>
                    </table>

                    <%
                    } else {
                    %>
                    <p>Nenhum game encontrado! ;'(</p>
                    <%
                        }
                    %>
                </form>
            </div>




            <%-- Rodape --%>
            <div id="footer">
                <p>PMR2490 - Sistemas de Informação
                    <br>Escola Politécnida da USP</p>
            </div>
        </div>
    </body>
</html>
