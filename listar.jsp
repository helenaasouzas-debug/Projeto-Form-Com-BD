<%-- Comentário JSP com informações sobre o arquivo. --%>
<%--
    Document   : listar
    Created on : 19 de jul. de 2026, 19:22:45
    Author     : Sr. Zenker
--%>

<%-- Define o tipo de conteúdo e a codificação da página. --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- Importa a classe de conexão com o banco de dados. --%>
<%@page import="java.sql.Connection"%>

<%-- Importa a classe para executar comandos SQL. --%>
<%@page import="java.sql.PreparedStatement"%>

<%-- Importa a classe que armazena os resultados da consulta. --%>
<%@page import="java.sql.ResultSet"%>

<%-- Importa a classe responsável pela conexão com o banco. --%>
<%@page import="util.Conexao"%>

<%-- Informa que o documento utiliza HTML5. --%>
<!DOCTYPE html>

<%-- Início do documento HTML. --%>
<html>

    <%-- Início do cabeçalho da página. --%>
    <head>

        <%-- Define a codificação de caracteres da página. --%>
        <meta charset="UTF-8">

        <%-- Define o título exibido na aba do navegador. --%>
        <title>Listagem de Alunos</title>

        <%-- Importa a biblioteca Bootstrap para estilizar a página. --%>
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <%-- Fecha o cabeçalho da página. --%>
    </head>

    <%-- Início do corpo da página. --%>
    <body>

        <%-- Cria um container Bootstrap com margem superior. --%>
        <div class="container mt-4">

            <%-- Exibe o título da página. --%>
            <h2 class="text-center">Alunos Cadastrados</h2>

            <%-- Cria um botão para abrir a página de cadastro. --%>
            <a href="index.html" class="btn btn-success mb-3">

                <%-- Texto exibido no botão. --%>
                Novo Cadastro

                <%-- Fecha o botão. --%>
            </a>

            <%-- Cria uma tabela para listar os alunos. --%>
            <table class="table table-bordered table-hover table-striped">

                <%-- Início do cabeçalho da tabela. --%>
                <thead class="thead-dark">

                    <%-- Cria uma linha no cabeçalho da tabela. --%>
                    <tr>

                        <%-- Coluna para o ID. --%>
                        <th>ID</th>

                        <%-- Coluna para o usuário. --%>
                        <th>Usuário</th>

                        <%-- Coluna para a senha. --%>
                        <th>Senha</th>

                        <%-- Coluna para o nome completo. --%>
                        <th>Nome Completo</th>

                        <%-- Coluna para a idade. --%>
                        <th>Idade</th>

                        <%-- Coluna para o curso. --%>
                        <th>Curso</th>

                        <%-- Coluna para os botões de ação. --%>
                        <th>Ações</th>

                        <%-- Fecha a linha do cabeçalho. --%>
                    </tr>

                    <%-- Fecha o cabeçalho da tabela. --%>
                </thead>

                <%-- Início do corpo da tabela. --%>
                <tbody>

                    <%-- Inicia o bloco de código Java da JSP. --%>
                    <%

                        // Declara a variável da conexão com o banco de dados.
                        Connection con = null;

                        // Declara a variável para executar comandos SQL.
                        PreparedStatement ps = null;

                        // Declara a variável para armazenar os resultados da consulta.
                        ResultSet rs = null;

                        // Inicia o tratamento de possíveis erros.
                        try {

                            // Abre a conexão com o banco de dados.
                            con = Conexao.conectar();

                            // Cria o comando SQL para listar todos os alunos.
                            String sql = "SELECT * FROM aluno ORDER BY id";

                            // Prepara o comando SQL para execução.
                            ps = con.prepareStatement(sql);

                            // Executa a consulta e armazena o resultado.
                            rs = ps.executeQuery();

                            // Percorre todos os registros encontrados.
                            while (rs.next()) {

                    %>
                    <%-- Cria uma nova linha na tabela para cada aluno. --%>
                    <tr>

                        <%-- Exibe o id do aluno. --%>
                        <td><%= rs.getInt("id")%></td>

                        <%-- Exibe o usuário do aluno. --%>
                        <td><%= rs.getString("usuario")%></td>

                        <%-- Exibe a senha do aluno. --%>
                        <td><%= rs.getString("senha")%></td>

                        <%-- Exibe o nome completo do aluno. --%>
                        <td><%= rs.getString("nomeCompleto")%></td>

                        <%-- Exibe a idade do aluno. --%>
                        <td><%= rs.getInt("idade")%></td>

                        <%-- Exibe o curso do aluno. --%>
                        <td><%= rs.getString("curso")%></td>

                        <%-- Cria a coluna dos botões de ação. --%>
                        <td>

                            <%-- Cria o botão para editar o aluno. --%>
                            <a href="editar.jsp?id=<%= rs.getInt("id")%>"
                               class="btn btn-warning btn-sm">

                                <%-- Texto exibido no botão. --%>
                                Editar

                                <%-- Fecha o botão Editar. --%>
                            </a>

                            <%-- Cria o botão para excluir o aluno. --%>
                            <a href="excluir.jsp?id=<%= rs.getInt("id")%>"
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('Deseja realmente excluir este aluno?');">

                                <%-- Texto exibido no botão. --%>
                                Excluir

                                <%-- Fecha o botão Excluir. --%>
                            </a>

                            <%-- Fecha a coluna de ações. --%>
                        </td>

                        <%-- Fecha a linha da tabela. --%>
                    </tr>

                    <%-- Retorna ao código Java da JSP. --%>
                    <%

                            // Fecha o laço while.
                        }

                        // Captura qualquer erro ocorrido.
                    } catch (Exception e) {

                    %>

                    <%-- Cria uma linha para exibir a mensagem de erro. --%>
                    <tr>

                        <%-- Cria uma célula ocupando as sete colunas da tabela. --%>
                        <td colspan="7">

                            <%-- Cria uma caixa de alerta Bootstrap. --%>
                            <div class="alert alert-danger">

                                <%-- Exibe o texto "Erro:". --%>
                                <strong>Erro:</strong>

                                <%-- Exibe a mensagem da exceção gerada. --%>
                                <%= e.getMessage()%>

                                <%-- Fecha a caixa de alerta. --%>
                            </div>

                            <%-- Fecha a célula da tabela. --%>
                        </td>

                        <%-- Fecha a linha da tabela. --%>
                    </tr>

                    <%-- Retorna ao código Java da JSP. --%>
                    <%

                            // Executa este bloco ocorrendo erro ou não.
                        } finally {

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

                        }

                    %>

                    <%-- Fecha o corpo da tabela. --%>
                </tbody>

                <%-- Fecha a tabela. --%>
            </table>

            <%-- Fecha o container. --%>
        </div>

        <%-- Fecha o corpo da página. --%>
    </body>

    <%-- Fecha o documento HTML. --%>
</html>
