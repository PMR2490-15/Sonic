<%@page import="data.UsuarioDO"%>
<%@page import="transacoes.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="Stylesheet" href="css/StyleSheetLogin.css"/>
        <title>Pagina de Logout</title>
    </head>
    <body>
        <div style="background-image:url('images/spm2.jpg'); padding: 1px  ">
    
    <div id="poli">
        <h1>POLI GAMES</h1>
    </div>
    
    <p> Tem certeza que deseja sair? :( </p>
        
    <div id="left"> 
        <div id="left2">
<%          String action = request.getParameter("action");
            if ( null == action ) {
                action = "showLogoutForm";
%>
                <table>
                    <tr>
                        <td><input type="hidden" name="action" value="Logout! :(" /></td>
                        <td><input type="hidden" name="action" value="Pensando bem... :D" /></td>
                    </tr>
                </table>
<%        
            }

            if (action.equals("Pensando bem... :D")) {
                Usuario tn = new Usuario();
                UsuarioDO user = tn.buscar(Integer.parseInt("User_ID"));
                if (user.getTipo() == 1) {
                    pageContext.forward("./gamer.jsp");
                }
                if (user.getTipo() == 2) {
                    pageContext.forward("./loja.jsp");
                }
                if (user.getTipo() == 1) {
                    pageContext.forward("./admin.jsp");
                }
            }

            if (action.equals("Logout! :(")) {
                session.invalidate();
                pageContext.forward("./index.jsp");
            }
%>
</div>
    </div>
    <div id="right">
    </div>
    <div id="charizard"> 
            <%--        <img  class="charizard" src="images/Logo.png"> --%>
    </div>
    <div id="footer">
	<p>PMR2490 - Sistemas de Informação
        <br>Escola Politécnida da USP</p>
    </div>
        </div>    
    </body>
</html>
