<%-- Comentário JSP com informações sobre o arquivo. --%>
<%--
    Document   : editar
    Created on : 19 de jul. de 2026, 19:29:14
    Author     : Sr. Zenker
--%>
<%-- Define o tipo de conteúdo e a codificação da página. --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- Importa todas as classes do pacote java.sql. --%>
<%@page import="java.sql.*"%>
<%-- Importa a classe responsável pela conexão com o banco. --%>
<%@page import="util.Conexao"%>
<%-- Inicia o bloco de código Java da JSP. --%>
<%
    // Recebe o id enviado pela URL e converte para inteiro.
    int id = Integer.parseInt(request.getParameter("id"));
    // Declara a variável da conexão com o banco.
    Connection con = null;
    // Declara a variável para executar comandos SQL.
    PreparedStatement ps = null;
    // Declara a variável para armazenar o resultado da consulta.
    ResultSet rs = null;
    // Declara a variável para armazenar o usuário.
    String usuario = "";
    // Declara a variável para armazenar a senha.
    String senha = "";
    // Declara a variável para armazenar o nome completo.
    String nomeCompleto = "";
    // Declara a variável para armazenar a idade.
    int idade = 0;
    // Declara a variável para armazenar o curso.
    String curso = "";
    // Inicia o tratamento de possíveis erros.
    try {
        // Abre a conexão com o banco de dados.
        con = Conexao.conectar();
        // Cria o comando SQL para buscar um aluno pelo id.
        String sql = "SELECT * FROM aluno WHERE id=?";
        // Prepara o comando SQL para execução.
        ps = con.prepareStatement(sql);
        // Define o valor do parâmetro id na consulta.
        ps.setInt(1, id);
        // Executa a consulta e armazena o resultado.
        rs = ps.executeQuery();
        // Verifica se encontrou um registro.
        if (rs.next()) {
            // Obtém o valor do campo usuário.
            usuario = rs.getString("usuario");
            // Obtém o valor do campo senha.
            senha = rs.getString("senha");
            // Obtém o valor do campo nome completo.
            nomeCompleto = rs.getString("nomeCompleto");
            // Obtém o valor do campo idade.
            idade = rs.getInt("idade");
            // Obtém o valor do campo curso.
            curso = rs.getString("curso");
        }
        // Captura qualquer erro ocorrido.
    } catch (Exception e) {
        // Exibe a mensagem do erro na página.
        out.println(e.getMessage());
    }
%>
<%-- Informa que o documento utiliza HTML5. --%>
<!DOCTYPE html>
<%-- Início do documento HTML. --%>
<html>
    <%-- Início do cabeçalho da página. --%>
    <head>
        <%-- Define a codificação de caracteres da página. --%>
        <meta charset="UTF-8">
        <%-- Define o título exibido na aba do navegador. --%>
        <title>Editar Aluno</title>
        <%-- Importa a biblioteca Bootstrap para estilização. --%>
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <%-- Fim do cabeçalho. --%>
    </head>
    <%-- Início do corpo da página. --%>
    <body>
        <%-- Cria um container Bootstrap. --%>
        <div class="container mt-4">
            <%-- Exibe o título da página. --%>
            <h2 class="text-center">Editar Aluno</h2>
            <%-- Inicia o formulário que enviará os dados para atualizar.jsp. --%>
            <form action="atualizar.jsp" method="post">
                <%-- Campo oculto que envia o id do aluno. --%>
                <input type="hidden" name="id" value="<%=id%>">
                <%-- Cria um grupo para o campo usuário. --%>
                <div class="form-group">
                    <%-- Exibe o texto do campo usuário. --%>
                    <label>Usuário</label>
                     <%-- Campo de texto para editar o usuário. --%>
                    <input
                        type="text"
                        name="usuario"
                        class="form-control"
                        value="<%=usuario%>"
                        required>
                    <%-- Fecha o grupo do campo usuário. --%>
                </div>
                <%-- Cria um grupo para o campo senha. --%>
                <div class="form-group">
                    <%-- Exibe o texto do campo senha. --%>
                    <label>Senha</label>
                    <%-- Campo de texto para editar a senha. --%>
                    <input
                        type="text"
                        name="senha"
                        class="form-control"
                        value="<%=senha%>"
                        required>
                    <%-- Fecha o grupo do campo senha. --%>
                </div>
                <%-- Cria um grupo para o campo nome completo. --%>
                <div class="form-group">
                    <%-- Exibe o texto do campo nome completo. --%>
                    <label>Nome Completo</label>
                    <%-- Campo de texto para editar o nome completo. --%>
                    <input
                        type="text"
                        name="nomeCompleto"
                        class="form-control"
                        value="<%=nomeCompleto%>"
                        required>
                    <%-- Fecha o grupo do campo nome completo. --%>
                </div>
                <%-- Cria um grupo para o campo idade. --%>
                <div class="form-group">

                    <%-- Exibe o texto do campo idade. --%>
                    <label>Idade</label>

                    <%-- Campo numérico para editar a idade. --%>
                    <input
                        type="number"
                        name="idade"
                        class="form-control"
                        value="<%=idade%>"
                        required>

                    <%-- Fecha o grupo do campo idade. --%>
                </div>

                <%-- Cria um grupo para o campo curso. --%>
                <div class="form-group">

                    <%-- Exibe o texto do campo curso. --%>
                    <label>Curso</label>

                    <%-- Cria a lista de opções de cursos. --%>
                    <select name="curso" class="form-control">

                        <%-- Opção do curso Informática. --%>
                        <option <%=curso.equals("Informática") ? "selected" : ""%>>
                            Informática
                        </option>

                        <%-- Opção do curso Administração. --%>
                        <option <%=curso.equals("Administração") ? "selected" : ""%>>
                            Administração
                        </option>

                        <%-- Opção do curso Design. --%>
                        <option <%=curso.equals("Design") ? "selected" : ""%>>
                            Design
                              </option>

                        <%-- Opção do curso Desenvolvimento de Sistemas. --%>
                        <option <%=curso.equals("Desenvolvimento de Sistemas") ? "selected" : ""%>>
                            Desenvolvimento de Sistemas
                        </option>

                        <%-- Fecha a lista de cursos. --%>
                    </select>

                    <%-- Fecha o grupo do campo curso. --%>
                </div>

                <%-- Cria o botão para atualizar os dados. --%>
                <button class="btn btn-primary">
                    Atualizar
                </button>

                <%-- Cria o botão para cancelar e voltar para a listagem. --%>
                <a href="listar.jsp" class="btn btn-secondary">
                    Cancelar
                </a>

                <%-- Fecha o formulário. --%>
            </form>

            <%-- Fecha o container. --%>
        </div>

        <%-- Fecha o corpo da página. --%>
    </body>

    <%-- Fecha o documento HTML. --%>
</html>

<%-- Retorna ao bloco de código Java da JSP. --%>
<%

    // Verifica se o ResultSet foi criado.
    if (rs != null) {

        // Fecha o ResultSet e libera memória.
        rs.close();

    }

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

%>
