<%-- Comentário JSP com informações sobre o arquivo. --%>
<%--
    Document   : excluir
    Created on : 19 de jul. de 2026, 19:36:59
    Author     : Sr. Zenker
--%>

<%-- Define o tipo de conteúdo e a codificação da página. --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- Importa a classe de conexão com o banco de dados. --%>
<%@page import="java.sql.Connection"%>

<%-- Importa a classe para executar comandos SQL. --%>
<%@page import="java.sql.PreparedStatement"%>

<%-- Importa a classe responsável pela conexão com o banco. --%>
<%@page import="util.Conexao"%>

<%-- Inicia o bloco de código Java da JSP. --%>
<%

// Recebe o id enviado pela página listar.jsp e converte para inteiro.
    int id = Integer.parseInt(request.getParameter("id"));

// Declara a variável da conexão com o banco de dados.
    Connection con = null;

// Declara a variável que executará o comando SQL.
    PreparedStatement ps = null;

// Inicia o tratamento de possíveis erros.
    try {

        // Abre a conexão com o banco de dados.
        con = Conexao.conectar();

        // Cria o comando SQL para excluir um aluno.
        String sql = "DELETE FROM aluno WHERE id = ?";

        // Prepara o comando SQL para execução.
        ps = con.prepareStatement(sql);

        // Define o valor do parâmetro id.
        ps.setInt(1, id);

        // Executa o comando DELETE no banco de dados.
        ps.executeUpdate();

        // Redireciona o usuário para a página de listagem.
        response.sendRedirect("listar.jsp");

        // Encerra a execução da página.
        return;

// Captura qualquer erro ocorrido.
    } catch (Exception e) {

%>
<%-- Início do código HTML exibido em caso de erro. --%>
<!DOCTYPE html>

<%-- Início do documento HTML. --%>
<html>

    <%-- Início do cabeçalho da página. --%>
    <head>

        <%-- Define a codificação de caracteres da página. --%>
        <meta charset="UTF-8">

        <%-- Define o título exibido na aba do navegador. --%>
        <title>Erro</title>

        <%-- Importa a biblioteca Bootstrap para estilização da página. --%>
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <%-- Fecha o cabeçalho da página. --%>
    </head>

    <%-- Início do corpo da página. --%>
    <body>

        <%-- Cria um container Bootstrap com margem superior. --%>
        <div class="container mt-5">

            <%-- Cria uma caixa de alerta para exibir o erro. --%>
            <div class="alert alert-danger">

                <%-- Exibe o título da mensagem de erro. --%>
                <h3>Erro ao excluir o registro!</h3>

                <%-- Insere uma linha horizontal de separação. --%>
                <hr>

                <%-- Exibe o texto "Detalhes do erro:". --%>
                <strong>Detalhes do erro:</strong>

                <%-- Insere duas quebras de linha. --%>
                <br><br>

                <%-- Exibe a mensagem da exceção gerada. --%>
                <%= e.getMessage()%>

                <%-- Fecha a caixa de alerta. --%>
            </div>

            <%-- Cria um botão para retornar à listagem. --%>
            <a href="listar.jsp" class="btn btn-primary">

                <%-- Texto exibido no botão. --%>
                Voltar para a Listagem

                <%-- Fecha o botão. --%>
            </a>

            <%-- Fecha o container. --%>
        </div>

        <%-- Fecha o corpo da página. --%>
    </body>

    <%-- Fecha o documento HTML. --%>
</html>

<%-- Retorna ao bloco de código Java da JSP. --%>
<%

        // Executa este bloco ocorrendo erro ou não.
    } finally {

        // Verifica se o PreparedStatement foi criado.
        if (ps != null) {

            // Fecha o PreparedStatement e libera os recursos.
            ps.close();

        }

        // Verifica se a conexão foi aberta.
        if (con != null) {

            // Fecha a conexão com o banco de dados.
            con.close();

        }

    }

%>
