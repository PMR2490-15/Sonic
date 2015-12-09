
<%-- 
    Document   : admin.jsp
    Created on : 01/10/2009, 18:45:32
    Author     : MB
--%>
<%@page import="data.UsuarioDO"%>
<%@page import="data.ItemDO"%>
<%@page import="java.util.List"%>
<%@ page import="transacoes.Administrador" %>
<%@ page import="transacoes.Item" %>
<%@ page import="data.AdministradorDO" %>

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
    if ( session.getAttribute("User_ID") == null) {
       pageContext.forward("index.jsp");
    }
    int adminID = Integer.parseInt((String)session.getAttribute("User_ID"));
    Administrador admintn = new Administrador();
    AdministradorDO admin = new AdministradorDO();
    admin = admintn.buscar(adminID);
    String nome = admin.getNome();
%>

        <div id="poli">
            <h1>POLI GAMES</h1>
        </div>
<div id="left">
    
    <%                  
                    String action = request.getParameter("action");
                 
%>

    <table border="1px"  style="none">
        <thead>
            <tr>
                <th align="center" class="conta">
                    <a href="./insertItemAdmin.jsp">Cadastrar Item</a>
                </th>
            </tr>
        </thead>
        <tbody>
            <form method="post" action=insertItemAdmin.jsp>
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
                            <td><input type="text" name="item" /></td>
                        <td align="right"><img id="lupa" src="images/lupa.png"></td>
                        </tr>
                    </table>
                </tr>
                <tr>
                    <td align="right"> 
                        <input type="submit" name="enviar" value="Buscar Item"/>
                        <input type="hidden" name="campo_controle" />
                    </td>
                </tr>
                <tr>
                    <table>
                        <td><input type="text" name="item" /></td>
                        <td align="left"><img id="lupa" src="images/Super_Hammer.png"></td>
                    </table>
                </tr>
                <tr>
                    <td align="right"> 
                        <input type="submit" name="enviar" value="Excluir Item"/>
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
            <a href="./insertItemAdmin.jsp">Cadastrar Item</a>
        </div> 
        <div class="options">
            <a href="./comunicadoAdmin.jsp">Comunicados</a>
        </div>
        <div class="options"> 
            <a href="./adminUpdate.jsp">Editar Conta</a>
        </div>
        <div class="options"> 
            <a href="./adminCreate.jsp" <%session.setAttribute("User_ID", Integer.toString(adminID));%>>Criar ADM</a>
        </div> 
</div> 

<%
                    if ( null == action ) {
                        action = "CreateItem";
%>
                        <%--Centro--%>
        <div id="center">
            <form action="./insertItemAdmin.jsp" method="post">
            <table>
                <tr>
               <h4>Incluir item ao invetário:</h4>
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
                     <label for="produtora">Produtora: </label>
                    </td>
                    <td align="left">
                     <input type="text" name="produtora"/>
                    </td>
                </tr>
                <tr>
                    <td>
                     <label>Lançamento: </label>
                    </td>
                    <td align="left">
                     <input type="text" name="lancamento" value="dd-mm-aaaa"/> 
                                        </td>
                </tr>
                <tr>
                   
                    <td align="left">
                    <tr>
                                    <td>Tipo: </td>
                                        <td align="left">
                                            <input type="radio" name="tipoItem" value="1" checked> ROM
                                            <input type="radio" name="tipoItem" value="2"> CONSOLE
                                            <input type="radio" name="tipoItem" value="3"> ACESSORIO
                                            <input type="radio" name="tipoItem" value="4"> OUTRO
                                        </td>
                                </tr>
                   </td>
                  </tr>                  
                  <tr>
                      <td><input type="submit" name="action"value="Enviar" /></td>
                       
                  </tr>
                
            </table>
            </form>
        </div>
        <%
            }
                %>
                           
        <% 
             if (action.equals("Enviar")){
                 
                        ItemDO buscar = new ItemDO();
                        Item tn = new Item();                   
                        buscar = tn.buscar(request.getParameter("nome_Item"));
                        if(buscar != null || (request.getParameter("produtora")).equals("") || (request.getParameter("lancamento")).equals("")){
                            action="erro";
                        }
                        else{
                            session.setAttribute("nome_Item", request.getParameter("nome_Item"));
                            session.setAttribute("produtora", request.getParameter("produtora"));
                            session.setAttribute("tipoItem", request.getParameter("tipoItem"));
                            session.setAttribute("lancamento", request.getParameter("lancamento"));
                            
                                     
                        ItemDO novo = new ItemDO();
                        novo.setNome((String)session.getAttribute("nome_Item"));
                        novo.setProdutora((String)session.getAttribute("produtora"));
                        novo.setTipo(Integer.parseInt((String)session.getAttribute("tipoItem")));
                        novo.setLancamento((String)session.getAttribute("lancamento"));
                        tn.incluir(novo);
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
