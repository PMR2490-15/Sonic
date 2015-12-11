
<%@ page import="transacoes.Gamer" %>
<%@ page import="data.GamerDO" %>
<%@ page import="data.ItemDO" %>
<%@ page import="data.ItemData" %>
<%@ page import="data.ItemInventarioDO" %>
<%@ page import="data.ItemInventarioData" %>
<%@ page import="data.TransacaoDO" %>
<%@ page import="data.TransacaoData" %>
<%@ page import="transacoes.Usuario" %>
<%@ page import="transacoes.ItemInventario" %>
<%@ page import="transacoes.Item" %>
<%@ page import="transacoes.Historico" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="Stylesheet" href="css/StyleSheetGamer.css"/>
        <title>Confirmar compra</title>
    </head>
    <body>
        <div style="background-image:url('images/spm2.jpg'); padding: 1px  ">
<%
   if ( session.getAttribute("User_ID") == null) {
       pageContext.forward("index.jsp");
    }

    String buscarUser = request.getParameter("buscarUser");

    if(buscarUser == null){
        buscarUser="Idle";
    }

    int gamerID = Integer.parseInt((String)session.getAttribute("User_ID"));
    Gamer gamertn = new Gamer();
    GamerDO gamer = new GamerDO();
    gamer = gamertn.buscar(gamerID);
    String nome = gamer.getNome();
%>

<%
    if(!buscarUser.equals("Idle"))
    {
       session.setAttribute("User_ID", Integer.toString(gamerID));
       session.setAttribute("busca", request.getParameter("buscar"));
       pageContext.forward("buscarUsuarioGamer.jsp");
    }
%>
<%-- cabeçalho--%>
    <div id="poli">
        <h1>POLI GAMES</h1>
    </div>

<%-- Tabela do lado esquerdo --%>
<div id="left">
    <%
    String action = request.getParameter("action");
                    if ( null == action ) {
                        action = "confirmaCompra";
                        %>
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
                        <h3>Bem vindo <%=nome %> !!</h3>
                    </td>
                </tr>
                <tr>
                    <td><img id="foto" src=<%= gamer.getFoto()%>></td>
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
                </tr>
            </form>
        </tbody>
    </table>
<%
    }
%>
</div>

<%-- Fim da tabela do lado esquerdo e inicio das opçoes no topo --%>
<div>
        <div class="options">
            <a href="./inventarioGamer.jsp" <%session.setAttribute("User_ID", Integer.toString(gamerID));%>>Inventário</a>
        </div> 
        <div class="options">
            <a href="./compraGamer.jsp" <% session.setAttribute("busca", ""); %> >Comprar</a>
        </div>
        <div class="options">
            <a href="./comunicadoGamer.jsp" <%session.setAttribute("User_ID", Integer.toString(gamerID));%>>Comunicados</a>
        </div>
        <div class="options">
            <a href="./search.jsp">Histórico</a>
        </div>
        <div class="options"> 
            <a href="./gamerUpdate.jsp" <%session.setAttribute("User_ID", Integer.toString(gamerID));%>>Editar Conta</a>
        </div>
</div> 

<div id="center">
    <%
    int idUser = Integer.parseInt((String)session.getAttribute("User_ID"));
    int idVendedor = Integer.parseInt((String)session.getAttribute("VendedorID"));;
    int invId = Integer.parseInt((String)session.getAttribute("ItemID"));

    Gamer gamertn2 = new Gamer();
    GamerDO gamer2 = new GamerDO();
    gamer2 = gamertn2.buscar(idVendedor);
    %>
    
    <%
    String estado = "";
    String preco = "";

    Item tnI = new Item();
    ItemDO item = new ItemDO();
    
    ItemInventario tnII = new ItemInventario();
    ItemInventarioDO itemInv = new ItemInventarioDO();
        
    itemInv = tnII.buscar(invId);
    item = tnI.buscar(itemInv.getItemId());
    
    if (itemInv.getEstado() == 1)
    {
        estado = "novo";
    } else if (itemInv.getEstado() == 2) {
        estado = "como novo";
    } else {
        estado = "usado";
    }
    
    preco = itemInv.getPreco();
    
    %>

    <%
    if( action == "confirmaCompra") {
    %>
    <table>
        <tr>
            <td>
                
    <table>
        <tr>
               <h4>Dados do vendedor</h4>
        </tr>
        <tr>
            <td align="right">
                <hdl>CPF:</hdl>
            </td>
            <td align="left">
                <hd><%=gamer2.getCpf()%></hd>
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>e-mail:</hdl>
            </td>
            <td align="left">
                <hd><%=gamer2.getEmail()%></hd>
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>Telefone:</hdl>
            </td>
            <td align="left">
                <hd><%=gamer2.getTelefone()%></hd>
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>Cidade:</hdl>
            </td>
            <td align="left">
                <hd><%=gamer2.getCidade()%></hd>
            </td>
        </tr>
    </table>
            
            </td>
            
            <td>
                <table>
        <tr>
               <h4>Dados do item</h4>
        </tr>
        <tr>
            <td align="right">
                <hdl>Nome:</hdl>
            </td>
            <td align="left">
                <hd><%= item.getNome() %></hd>
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>Produtora:</hdl>
            </td>
            <td align="left">
                <hd><%= item.getProdutora() %></hd>
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>Estado:</hdl>
            </td>
            <td align="left">
                <hd><%= estado %></hd>
            </td>
        </tr>
        <tr>
            <td align="right">
                <hdl>Preço:</hdl>
            </td>
            <td align="left">
                <hd>R$ <%= preco.toString() %></hd>
            </td>
        </tr>
    </table>
            </td>
            
        </tr>
    </table>
            
    <table>
        <tr>
               <h4>Confirmar compra?</h4>
        </tr>
        <tr>
            <form method="post" action=confirmarCompra.jsp>
            <td align="right">
                <input type="submit" name="action" value="SIM" />
            </td>
            <td align="left">
                <input type="submit" name="action" value="NAO" />
            </td>
            </form>
        </tr>

    </table>
    <% } %>

    <%
    if(action.equals("SIM")){
        //incluir item no inventário do comprador
        ItemInventarioDO buscar = new ItemInventarioDO();
        ItemInventario tn = new ItemInventario();
        buscar = tn.buscar(invId);
        if(buscar == null ){
            action="erro";
        }
        else{
            buscar.setUsuarioId(idUser);
            tn.remover(buscar);

            TransacaoDO novo = new TransacaoDO();
            Historico tn2 = new Historico();
            novo.setItem_id1(invId);
            novo.setUser_id1(idUser);
            novo.setUser_id2(idVendedor);
            tn2.incluir(novo);

            action = "vendaOK";
        }

    }
    if(action.equals("erro") || action.equals("NAO")){
%>
        <h3>A venda não foi realizada</h3>
        <a href="./compraGamer.jsp">Voltar</a>
<%
    }

    if (action.equals("vendaOK")){


%>
        <h3>venda Realizada com sucesso</h3>
        <a href="./compraGamer.jsp">Voltar</a>
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
