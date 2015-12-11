<%@ page import="data.UsuarioDO" %>
<%@ page import="transacoes.Gamer" %>
<%@ page import="data.GamerDO" %>
<%@ page import="data.UsuarioDO"%>
<%@ page import="data.ItemDO"%>
<%@ page import="data.ItemInventarioDO"%>
<%@ page import="java.util.List"%>
<%@ page import="transacoes.Administrador" %>
<%@ page import="transacoes.ItemInventario" %>
<%@ page import="transacoes.Item" %>
<%@ page import="data.AdministradorDO" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="Stylesheet" href="css/StyleSheetGamer.css"/>
        <title>Pagina do Gamer</title>
    </head>
    <body>
        <div style="background-image:url('images/spm2.jpg'); padding: 1px  "></div>
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

         int gamerID = Integer.parseInt((String)session.getAttribute("User_ID"));
         Gamer gamertn = new Gamer();
         GamerDO gamer = new GamerDO();
         gamer = gamertn.buscar(gamerID);
         String nome = gamer.getNome();

         if(!buscarUser.equals("Idle")){
            session.setAttribute("User_ID", Integer.toString(gamerID));
            session.setAttribute("busca", request.getParameter("buscar"));
            pageContext.forward("buscarUsuarioGamer.jsp");
         }
         else if(!buscarItem.equals("Idle")){
            session.setAttribute("User_ID", Integer.toString(gamerID));
            session.setAttribute("busca", request.getParameter("buscar"));
            pageContext.forward("buscarItemGamer.jsp");
         }
         %>
         <%-- cabeçalho--%>
        <div id="poli">
            <h1>POLI GAMES</h1>
        </div>
    
        <%                  
        String action = request.getParameter("action");
        if ( action == null ) 
            action = "CreateItem"; 
        %> 
        
        <%-- Tabela do lado esquerdo --%>
        <div id="left">
            <table border="1px"  style="none">
                <thead>
                    <tr>
                        <th align="center" class="conta">
                            <a href="./criarItemInventario.jsp">Minha Conta</a>
                        </th>
                    </tr>
                </thead>
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
                            <td align="left"> 
                                <input type="submit" name="buscarItem" value="Buscar Item"/>
                            </td>
                        </tr>
                    </form>
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
                <a href="./comunicadoGamer.jsp" <%session.setAttribute("User_ID", Integer.toString(gamerID));%>>Comunicados</a>
            </div>
            <div class="options">
                <a href="./search.jsp">Histórico</a>
            </div>
            <div class="options"> 
                <a href="./gamerUpdate.jsp" <%session.setAttribute("User_ID", Integer.toString(gamerID));%>>Editar Conta</a>
            </div>
        </div> 
            
        <%--Centro--%>    
        <div id="center">
            <form action="./criarItemInventario.jsp" method="post">
            <table>
                <tr>
                    <h4>Incluir item ao inventário:</h4>
                </tr>
                <tr>
                    <td>
                        <label for="nome">Nome: </label>
                    </td>
                    <td align="left">
                        <input type="text" name="nome_Item"/>
                    </td>
                </tr>                
                    <tr>
                        <td>
                            <input type="submit" name="action"value="Buscar" />
                        </td>                       
                    </tr>                
            </table>
            </form>
        </div>
            
        <% 
        if (action.equals("Buscar")){                 
            ItemDO buscar = new ItemDO();
            Item tn = new Item();                   
            buscar = tn.buscar(request.getParameter("nome_Item"));
            session.setAttribute("nome_Item", (String)request.getParameter("nome_Item"));
            if(buscar == null ){
                action="erro";
            }
            else{                 
                %>
                <form action="./criarItemInventario.jsp" method="post">
                    <table>
                        <tr>
                            <h4>Defina o preço do item </h4>
                        </tr>
                    <tr>
                        <td>
                            <label for="Preço">Preço: </label>
                        </td>
                        <td align="left">
                            <input type="text" name="precoItem"/>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="action" value="OK" /></td>
                    </tr>
                    </table>
                </form>
                <%
                   }
}
                 else if(action.equals("OK")){
                    if(request.getParameter("precoItem") == null){
                        %>
                        <h3>Item já existe ou campo não preenchido</h3>
                        <%
                    }
                    else{
                        ItemDO buscar1 = new ItemDO();
                        Item tn = new Item();                   
                        buscar1 = tn.buscar((String)session.getAttribute("nome_Item"));
                        ItemInventarioDO novo = new ItemInventarioDO();
                        ItemInventario tn2 = new ItemInventario();
                        novo.setUsuarioId(gamerID);
                        novo.setItemId(buscar1.getId());
                        novo.setEstado(1);
                        novo.setPreco(((String)request.getParameter("precoItem")));
                        novo.setTipoTransacao(1);
                        tn2.incluir(novo);
                        action="createOK";                        
                    }       
                }
                

            
        
            //----------------------------------------------
        if(action.equals("erro")){
%>
            <h3>Item já existe ou campo não preenchido</h3>
            <a href="./insertItemAdmin.jsp">Voltar</a>
<%
        }

        if (action.equals("createOK")){
%>
            <h3>Cadastro completo</h3>
            <a href="./admin.jsp">Voltar</a>
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