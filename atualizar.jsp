<%-- Comentário JSP com informações sobre o arquivo. --%>
<%--
    Document   : atualizar
    Created on : 19 de jul. de 2026, 19:31:01
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
    // Recebe o parâmetro "id" da URL e converte para inteiro.
    int id = Integer.parseInt(request.getParameter("id"));
    // Recebe o valor do campo usuário enviado pelo formulário.
    String usuario = request.getParameter("usuario");
    // Recebe o valor do campo senha enviado pelo formulário.
    String senha = request.getParameter("senha");
    // Recebe o valor do campo nome completo enviado pelo formulário.
    String nomeCompleto = request.getParameter("nomeCompleto");
    // Recebe o valor da idade e converte para inteiro.
    int idade = Integer.parseInt(request.getParameter("idade"));
    // Recebe o valor do campo curso enviado pelo formulário.
    String curso = request.getParameter("curso");
    // Declara a variável que armazenará a conexão com o banco.
    Connection con = null;
    // Declara a variável que executará o comando SQL.
    PreparedStatement ps = null;
    // Inicia o bloco de tratamento de erros.
    try {
        // Abre a conexão com o banco de dados.
        con = Conexao.conectar();
        // Cria o comando SQL para atualizar um aluno.
        String sql = "UPDATE aluno SET usuario=?, senha=?, nomeCompleto=?, idade=?, curso=? WHERE id=?";
        // Prepara o comando SQL para execução.
        ps = con.prepareStatement(sql);
        // Define o primeiro parâmetro como o usuário.
        ps.setString(1, usuario);
        // Define o segundo parâmetro como a senha.
        ps.setString(2, senha);
        // Define o terceiro parâmetro como o nome completo.
        ps.setString(3, nomeCompleto);
        // Define o quarto parâmetro como a idade.
        ps.setInt(4, idade);
        // Define o quinto parâmetro como o curso.
        ps.setString(5, curso);
        // Define o sexto parâmetro como o id do aluno.
        ps.setInt(6, id);
        // Executa o comando UPDATE no banco de dados.
        ps.executeUpdate();
        // Redireciona o usuário para a página de listagem.
        response.sendRedirect("listar.jsp");
        // Encerra a execução da página.
        return;
        // Captura qualquer erro ocorrido durante a execução.
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

        <%-- Define o título da página exibido na aba do navegador. --%>
        <title>Erro</title>

        <%-- Importa a biblioteca Bootstrap para estilização. --%>
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <%-- Fim do cabeçalho. --%>
    </head>

    <%-- Início do corpo da página. --%>
    <body>

        <%-- Cria um container Bootstrap com margem superior. --%>
        <div class="container mt-5">

            <%-- Cria uma caixa de alerta na cor vermelha. --%>
            <div class="alert alert-danger">

                <%-- Exibe o título da mensagem de erro. --%>
                <h3>Erro ao atualizar o cadastro!</h3>

                <%-- Insere uma linha horizontal de separação. --%>
                <hr>

                <%-- Exibe a mensagem da exceção gerada. --%>
                <%= e.getMessage()%>

                <%-- Fecha a caixa de alerta. --%>
            </div>

            <%-- Cria um botão para voltar à listagem. --%>
            <a href="listar.jsp" class="btn btn-primary">

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

<%-- Retorna ao código Java da JSP. --%>
<%

    // Finaliza o bloco try/catch e executa sempre este trecho.
    } finally {

        // Verifica se o PreparedStatement foi criado.
        if (ps != null) {

            // Fecha o PreparedStatement e libera recursos.
            ps.close();

        }

        // Verifica se a conexão foi aberta.
        if (con != null) {

            // Fecha a conexão com o banco de dados.
            con.close();

        }

    }

%>
