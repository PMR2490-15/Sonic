
<%-- 
    Document   : gamer.jsp
    Created on : 01/10/2009, 18:45:32
    Author     : MB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="data.ComunicadoDO" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="transacoes.Loja" %>
<%@ page import="data.LojaDO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Date , java.text.DateFormat ,java.text.SimpleDateFormat" %>
         
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="Stylesheet" href="css/StyleSheetLoja.css"/>
        <title>HttpSessionDemo - Pagina da Loja</title>
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
            <form method="post" action=comunicadoLoja.jsp>
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
            
 <%  
    if(!buscarUser.equals("Idle")){
       session.setAttribute("User_ID", Integer.toString(lojaID));
       session.setAttribute("busca", request.getParameter("buscar"));
       pageContext.forward("buscarUsuarioLoja.jsp");
    }
    else if(!buscarItem.equals("Idle")){
       session.setAttribute("User_ID", Integer.toString(lojaID));
       session.setAttribute("busca", request.getParameter("buscar"));
       pageContext.forward("buscarItemLoja.jsp");
    }
%>                         
                        
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

    <table border = "1">
        <tr>
            <td>
                <h2 style="text-align:center">Mandar nova mensagem</h2>
            </td>
        </tr>

        <tr>
            <td>
                <%
                    String action = request.getParameter("action");
                    if (null == action)
                        action = "showMsgForm";
                %>

                <%-- Mostra formulário para enviar mensagem --%>
                <%
                      if (action.equals("showMsgForm")) {
                %>
                <form action="./comunicadoLoja.jsp" method="post">
                    <table>
                        <tr>
                            <td>Nome</td>
                            <td><input type="text" name="nome" />
                        </tr>
                        <tr>
                            <td>
                                Mensagem
                            </td>
                        </tr>
                        <tr>
                            <td><input type="text" name="msg" />
                        </tr>
                    </table>
                    <input type="submit" name="enviar" value="enviar" />
                    <input type="hidden" name="action" value="sendMsg" />
                </form>
                
                <%
                } else if (action.equals("sendMsg")) {
                    String destinatario = request.getParameter("nome");

                    transacoes.Usuario tn_user = new transacoes.Usuario();
                    UsuarioDO user = tn_user.buscar(destinatario);

                    if (null == user) {
                %>
                Usuário inexistente
                <form action="./comunicadoLoja.jsp" method="post">
                    <input type="submit" name="voltar" value="Retornar" />
                </form>
                <%
                } else {
                    int dest_id = user.getId();

                    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    Date date = new Date();
                    String data_atual = dateFormat.format(date);

                    transacoes.Comunicado tn_new = new transacoes.Comunicado();
                    data.ComunicadoDO novo_comunicado = new data.ComunicadoDO();
                    novo_comunicado.setIdrem(lojaID);
                    novo_comunicado.setIdDest(dest_id);
                    novo_comunicado.setComunicado(request.getParameter("msg"));
                    novo_comunicado.setData(data_atual);

                    boolean result = false;
                    try {
                        result = tn_new.incluir(novo_comunicado);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }
                    if (result) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                Mensagem enviada com sucesso!
                <form action="./comunicadoLoja.jsp" method="post">
                    <input type="submit" name="voltar" value="Enviar outra" />
                </form>
                <%     } else {
                %>
                Erro ao enviar mensagem
                <form action="./comunicadoLoja.jsp" method="post">
                    <input type="submit" name="retry" value="Retornar" />
                </form>
                <%     }
                        }
                    } // updateValues

                %>

                          
            </td>
        </tr>

        <%-- Mostra mensagens enviadas --%>
        <%
            transacoes.Comunicado tn_comunicado = new transacoes.Comunicado();
        %>

        <tr>
            <td>
                <h2 style="text-align:center">
                    Mensagens enviadas
                </h2>
            </td>
        </tr>

        <tr>
            <td>

                <!--   faz a pesquisa e mostra os resultados                              -->
                <%
                    Vector msg_rem = tn_comunicado.pesquisarPorRemetente(lojaID);
                    if ((msg_rem == null) || (msg_rem.size() == 0)) {
                %>
                Sociopata

                <%
                } else {
                %>
                <table border = "1" style="background-color:white">
                    <tr>
                        <th>Nome</th>
                        <th>Mensagem</th>
                        <th>Data</th>
                    </tr>
                    <%
                        for (int i = 0; i < Math.min(msg_rem.size(),2); i++)
                        {
                            ComunicadoDO comunicado = (ComunicadoDO) msg_rem.elementAt(i);
                            
                            transacoes.Usuario tn_user = new transacoes.Usuario();
                            UsuarioDO user = tn_user.buscar(comunicado.getIdDest());
                    %>
                    <tr>
                        <td><%= user.getNome_Usuario()%></td>
                        <td><%= comunicado.getComunicado()%></td>
                        <td><%= comunicado.getData()%></td>
                    </tr>        
                    <%
                        } // for i      
                    %>        
                </table>            
                <%
                    } // contatos retornados
                %>
            </td>
        </tr>

        <%-- Mostra mensagens recebidas --%>
        <tr>
            <td>
                <h2 style="text-align:center">Mensagens recebidas</h2>
            </td>
        </tr>

        <tr>
            <td>

                <!--   faz a pesquisa e mostra os resultados                              -->
                <%
                    Vector msg_dest = tn_comunicado.pesquisarPorDestinatario(lojaID);
                    if ((msg_dest == null) || (msg_dest.size() == 0)) {
                %>
                Ninguém quer conversar com você.

                <%
                } else {
                %>
                <table border = "1" style="background-color:white">
                    <tr>
                        <th>Nome</th>
                        <th>Mensagem</th>
                        <th>Data</th>
                    </tr>
                    <%
                        for (int i = 0; i < Math.min(msg_dest.size(),2); i++)
                        {
                            ComunicadoDO comunicado = (ComunicadoDO) msg_dest.elementAt(i);
                            
                            transacoes.Usuario tn_user = new transacoes.Usuario();
                            UsuarioDO user = tn_user.buscar(comunicado.getIdrem());
                    %>
                    <tr>
                        <td><%= user.getNome_Usuario() %></td>
                        <td><%= comunicado.getComunicado()%></td>
                        <td><%= comunicado.getData()%></td>
                    </tr>        
                    <%
                        } // for i      
                    %>        
                </table>            
                <%
                    } // contatos retornados
                %>
            </td>
        </tr>

    </table>

</div>
    
<%-- Rodape --%>
        <div id="footer">
            <p>PMR2490 - Sistemas de Informação
            <br>Escola Politécnida da USP</p>
        </div>
        </div>
    </body>
</html>
