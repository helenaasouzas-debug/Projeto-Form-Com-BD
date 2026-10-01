<%-- Comentário JSP com informações sobre o arquivo. --%>
<%--
    Document   : form
    Created on : 12 de jul. de 2026, 17:09:28
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

// Recebe o valor do campo nome enviado pelo formulário.
    String usuario = request.getParameter("nome");

// Recebe o valor do campo senha enviado pelo formulário.
    String senha = request.getParameter("senha");

// Recebe o valor do campo nome completo enviado pelo formulário.
    String nomeCompleto = request.getParameter("nomeCompleto");

// Recebe o valor do campo idade enviado pelo formulário.
    String idade = request.getParameter("idade");

// Recebe o valor do campo curso enviado pelo formulário.
    String curso = request.getParameter("curso");

// Declara a variável da conexão com o banco de dados.
    Connection con = null;

// Declara a variável para executar comandos SQL.
    PreparedStatement ps = null;

// Inicia o tratamento de possíveis erros.
    try {

        // Abre a conexão com o banco de dados.
        con = Conexao.conectar();

        // Cria o comando SQL para inserir um novo aluno.
        String sql = "INSERT INTO aluno (usuario, senha, nomeCompleto, idade, curso) VALUES (?, ?, ?, ?, ?)";

        // Prepara o comando SQL para execução.
        ps = con.prepareStatement(sql);

        // Define o primeiro parâmetro como o usuário.
        ps.setString(1, usuario);

        // Define o segundo parâmetro como a senha.
        ps.setString(2, senha);

        // Define o terceiro parâmetro como o nome completo.
        ps.setString(3, nomeCompleto);

        // Converte a idade para inteiro e define o quarto parâmetro.
        ps.setInt(4, Integer.parseInt(idade));

        // Define o quinto parâmetro como o curso.
        ps.setString(5, curso);

        // Executa o comando INSERT no banco de dados.
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
                <h3>Erro ao cadastrar!</h3>

                <%-- Exibe a mensagem da exceção gerada. --%>
                <p><%= e.getMessage()%></p>

                <%-- Fecha a caixa de alerta. --%>
            </div>

            <%-- Cria um botão para voltar à página inicial. --%>
            <a href="index.html" class="btn btn-primary">

                <%-- Texto exibido no botão. --%>
                Voltar

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
        if (ps != null) // Fecha o PreparedStatement e libera os recursos.
        {
            ps.close();
        }

        // Verifica se a conexão foi aberta.
        if (con != null) // Fecha a conexão com o banco de dados.
        {
            con.close();
        }

    }

%>
