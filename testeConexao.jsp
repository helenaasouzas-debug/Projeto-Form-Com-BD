<%-- Comentário JSP com informações sobre o arquivo. --%>
<%--
    Document   : testeConexao
    Created on : 19 de jul. de 2026, 18:53:36
    Author     : Sr. Zenker
--%>

<%-- Importa a classe de conexão com o banco de dados. --%>
<%@page import="java.sql.Connection"%>

<%-- Importa a classe responsável pela conexão com o banco. --%>
<%@page import="util.Conexao"%>

<%-- Inicia o bloco de código Java da JSP. --%>
<%

    // Abre uma conexão com o banco de dados.
    Connection con = Conexao.conectar();

    // Verifica se a conexão foi realizada com sucesso.
    if (con != null) {

        // Exibe uma mensagem informando que a conexão foi realizada.
        out.println("<h2>Conectado com sucesso!</h2>");

        // Executa este bloco caso a conexão falhe.
    } else {

        // Exibe uma mensagem informando que ocorreu erro na conexão.
        out.println("<h2>Erro na conexão!</h2>");

    }

%>
