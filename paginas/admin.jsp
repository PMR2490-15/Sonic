
<%-- 
    Document   : admin.jsp
    Created on : 01/10/2009, 18:45:32
    Author     : MB
--%>

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
    // VERIFICACAO MANUAL DO LOGIN
    /*if ( session.getAttribute("user_name") == null) {
       pageContext.forward("index.jsp");
    }
    */
    String nome = (String)session.getAttribute("user_name");
%>

        <div id="poli">
            <h1>POLI GAMES</h1>
        </div>
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
            <a href="./insert.jsp">Cadastrar Item</a>
        </div> 
        <div class="options">
            <a href="./remove.jsp">Comunicados</a>
        </div>
        <div class="options"> 
            <a href="./insert.jsp">Editar Conta</a>
        </div> 
</div>  

                        <%--Centro--%>
        <div id="center">
            
        </div>
        
        <%-- Rodape --%>
        <div id="footer">
            <p>PMR2490 - Sistemas de Informação
            <br>Escola Politécnida da USP</p>
        </div>
        </div>
    </body>
</html>
