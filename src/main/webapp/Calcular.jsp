<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="jakarta.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.print.attribute.standard.PrinterMessageFromOperator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	double peso = 0;
	double altura = 0;
	Double resultado = 0.0;
	String resultadoString = "";
	String msg = "";
	DecimalFormat df = new DecimalFormat("#,###.00");
	   				
	if(request.getParameter("submit") != null) {
		peso = Double.parseDouble(request.getParameter("peso"));
		altura = Double.parseDouble(request.getParameter("altura"));
		resultado = peso / (altura * altura);
		resultadoString = String.format("%.2f", resultado);	
	}
	
	if(resultado < 18.5){
		msg = "(Magreza)";
	} else if(resultado < 25) {
		msg = "(Peso normal)";
	} else if(resultado < 30) {
		msg = "(Sobrepeso)";
	} else if(resultado < 35) {
		msg = "(Obesidade I)";
	} else if (resultado < 40) {
		msg = "(Obesidade II)";
	} else {
		msg = "(Obesidade III)";
	}
				
%>
    
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="ISO-8859-1">
			<title>Insert title here</title>
			<link rel="stylesheet" type="text/css" href="style.css">
		</head>
		<body>
		
			<form method="post">
				<div class="header">
					<h1>Calculadora de IMC</h1>
				</div>
				
				<div class="inputs">
					<label for="peso">Peso</label>
					<input type="number" required name="peso" value="<%=peso%>" min="10">
					<label for="altura">Altura</label>
					<input type="number" required name="altura" value="<%=altura%>" min="0" step="0.010">
				</div>
				
				<div class="footer">
					<input type="SUBMIT" name="submit" value="Calcular">
					<p>IMC: <%=resultadoString + " - " + msg%></p>
				</div>
			</form>
		
		</body>
	</html>