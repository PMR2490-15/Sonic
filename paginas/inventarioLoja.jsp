<%@ page import="data.UsuarioDO"%>
<%@ page import="java.util.List"%>
<%@ page import="transacoes.Loja" %>
<%@ page import="data.LojaDO" %>
<%@ page import="java.util.Vector" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="data.GamerDO"%>
<%@page import="transacoes.Gamer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.UsuarioDO"%>
<%@page import="data.ItemDO"%>
<%@page import="data.ItemInventarioDO"%>
<%@page import="java.util.List"%>
<%@ page import="transacoes.Item" %>
<%@ page import="transacoes.ItemInventario" %>
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
    
    String buscarUser = request.getParameter("buscarUser");
    String buscarItem = request.getParameter("buscarItem");
    
    if(buscarUser == null){
        buscarUser="Idle";
    }
    if(buscarItem == null){
        buscarItem="Idle";
    }
    
    int lojaID = Integer.parseInt((String)session.getAttribute("User_ID"));
   
    Loja lojatn = new Loja();
    
    LojaDO loja = new LojaDO();
    
    loja = lojatn.buscar(lojaID);
    String nome = loja.getNome();
%>

<%  
    if(!buscarUser.equals("Idle")){
       session.setAttribute("User_ID", Integer.toString(lojaID));
       session.setAttribute("busca", request.getParameter("buscar"));
       pageContext.forward("buscarPessoaLoja.jsp");
    }
    else if(!buscarItem.equals("Idle")){
       session.setAttribute("User_ID", Integer.toString(lojaID));
       session.setAttribute("busca", request.getParameter("buscar"));
       pageContext.forward("buscarItemLoja.jsp");
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
    <div class="options2">
        <a href="./inventarioGamer.jsp">Incluir Item</a>
    </div> 
    
    <div class="options2">
        <a href="./inventarioGamer.jsp">Excluir Item</a>
    </div> 
        
    <%
    int idUsuario = Integer.parseInt((String)session.getAttribute("User_ID"));
    String busca = "";
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
    listItemInv = tnII.pesquisarUsuario(idUsuario);
    
    if ( listItemInv != null && listItemInv.size() != 0 ) {
%>

       <table class="list">
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
                <input type="hidden" name="action<%= String.valueOf(i) %>" value="null" />
                <td align="left"><%= item.getNome() %></td>
                <td align="left"><%= estado.toString() %></td>
                <%--<td align="right">Para <%= tipo.toString() %></td>--%>
                <%
                if(itemInv.getTipoTransacao() != 2 && preco != null) {
                %>
                    <td align="right">R$ <%= preco.toString() %></td>
                <% } %>
                <%--   <td><input type="submit" name="action<%= String.valueOf(i) %>" value="Comprar"/>
                    <input type="hidden" name="view" value="<%= String.valueOf(i)%>"/> </td>--%>
            </tr>
<%      } %>
        </table>

<%
        
    } else {
%>
        <p class="list">Nenhum game encontrado! ;'(</p>
<%
    }
%>
                
<%-- Rodape --%>
        <div id="footer">
            <p>PMR2490 - Sistemas de Informação
            <br>Escola Politécnida da USP</p>
        </div>
        </div>
    </body>
</html>
