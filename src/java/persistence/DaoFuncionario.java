/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Funcionario;

/**
 *
 * @author Amanda
 */
public class DaoFuncionario {

 
    private Connection conexao;

    public DaoFuncionario() throws ClassNotFoundException {
        ConnectionFactory cf = new ConnectionFactory(); // fazer a conexão com o banco
        conexao = cf.connect();
        
    }
    //Cadastrar funcionário
    public void cadastrarFuncionario(Funcionario f) throws SQLException {
        
         String sqle = "select * from Funcionario where '" +f.getEmail()+"'";
        
         PreparedStatement pse = conexao.prepareStatement(sqle);
         ResultSet rse = pse.executeQuery();
         
         
        
        
        if (!rse.next()){
            
            
        
        int ativ = 1;
        //Define se todas as instruções executadas foram comitadas
        conexao.setAutoCommit(false);

        // query
        String sql = "insert into Funcionario(Nome,Email,Senha,Matricula,Ativo)" + "values (?,?,?,?,?)";

        //Cria um objeto que representa a instrução SQL que será executada
        PreparedStatement ps = conexao.prepareStatement(sql);


                try {

                    //Adiciona o valor do 1 parâmetro da sql
                    //IdFuncionario é incremental
                    ps.setString(1, f.getNome());

                    //Adiciona o valor do 2 parâmetro da sql
                    ps.setString(2, f.getEmail());

                    //Adiciona o valor do 3 parâmetro da sql
                    ps.setString(3, f.getSenha());

                    //Adiciona o valor do 4 parâmetro da sql
                    ps.setString(4, f.getMatricula());

                    //Adiciona o valor do 5 parâmetro da sql
                    ps.setInt(5, ativ);

                    /**
                     * Executa a instrução sql para inserção dos dados no banco
                     * e retorna a quantidade de registros que são afetados pela
                     * execução do comando sql
                     */
                    ps.executeUpdate();

                    //Grava transações no banco
                    conexao.commit();

                } catch (SQLException exp) {
                    //adicionar mensagem de erro ?
                    //Descarta transações efetuadas
                    conexao.rollback();
                } finally {
                    //Fecha as conexões não nulas
                    if (ps != null) {
                        ps.close();
                    }
                    if (conexao != null) {
                        conexao.close();
                    }
                }
            }

        else{
           
          
            
        }

    }

    //Excluir funcionario
    public void excluirFuncionario(Funcionario f) throws SQLException {

        //Define se todas as instruções executadas foram comitadas
        conexao.setAutoCommit(false);

        //query
        String sql = "delete from Funcionario where IDFuncionario=?";

        //Cria um objeto que representa a instrução SQL que será executada
        PreparedStatement ps = conexao.prepareStatement(sql);

        try {

            //Pega o id do funcionario a ser excluido
            ps.setInt(1, f.getIDFuncionario());

            /**
             * Executa a instrução sql para inserção dos dados no banco e
             * retorna a quantidade de registros que são afetados pela execução
             * do comando sql
             */
            ps.executeUpdate();

            //Grava transações no banco
            conexao.commit();

        } catch (SQLException exp) {
            //adicionar mensagem de erro ?
            //Descarta transações efetuadas
            conexao.rollback();
        } finally {
            //Fecha as conexões não nulas
            if (ps != null) {
                ps.close();
            }
            if (conexao != null) {
                conexao.close();
            }

        }

    }

    //Consultar funcionarios
    public ResultSet consultarFuncionario(int id) throws SQLException {
        //Cria um ArrayList do tipo Funcionario
        //query
        String sql = "select * from Funcionario where IDFuncionario = '" +id+ "'";

        //Cria um objeto que representa a instrução SQL que será executada
        PreparedStatement ps = conexao.prepareStatement(sql);

        /* Executa a query (recupera os dados no banco) 
        // executeQuery retorna um objeto do tipo ResultSet que é um conjunto de resultados de uma tabela no banco de dados
         */

        ResultSet rset = ps.executeQuery();

        

        //Retorna a lista funcionarios
        return rset;
    }

    //Alterar funcionario
public void alterarSenhaFuncionario(Funcionario f, int id) throws SQLException {
        //Define se todas as instruções executadas foram comitadas
        conexao.setAutoCommit(false);

        
        //query
        String sql = "UPDATE Funcionario  set Senha = ? WHERE IDFuncionario = "+ id + ";";

        //Cria um objeto que representa a instrução SQL que será executada
        PreparedStatement ps = conexao.prepareStatement(sql);

        try {
            //Adiciona o valor do terceiro parâmetro da sql
            ps.setString(1, f.getSenha());

            /**
             * Executa a instrução sql para inserção dos dados no banco e
             * retorna a quantidade de registros que são afetados pela execução
             * do comando sql
             */
            ps.executeUpdate();

            //Grava transações no banco
            conexao.commit();

        } catch (SQLException exp) {
            //adicionar mensagem de erro ?
            //Descarta transações efetuadas
            conexao.rollback();
        } finally {
            //Fecha as conexões não nulas
            if (ps != null) {
                ps.close();
            }
            if (conexao != null) {
                conexao.close();
            }
        }
    }

    //Login
    public void login(HttpServletRequest request, HttpServletResponse response, Funcionario f) throws IOException, SQLException {
        //query
        String sql = "select * from Funcionario where Email = '" + f.getEmail() + "' and Senha = '" + f.getSenha() + "'";

        //Declara um objeto statement - usado para implementar instruções SQL simples sem parâmetros.
        Statement st;

        //Pega a sessão do usuario
        HttpSession session = request.getSession();

        try {
            //Cria um objeto que representa a instrução SQL que será executada
            st = conexao.createStatement();

            // Executa a query (recupera os dados no banco) 
            // executeQuery retorna um objeto do tipo ResultSet que é um conjunto de resultados de uma tabela no banco de dados
            ResultSet rset = st.executeQuery(sql);

            // Se existir dados no banco
            if (rset.next()) {
                if (rset.getInt("Ativo") == 1) {
                    int id = rset.getInt("IDFuncionario");
                    session.setAttribute("id", id);
                    session.setAttribute("login", "true");
                    String teste = rset.getString("Nome");
                   
                    session.setAttribute("nome", rset.getString("Nome"));
                } else {
                    session.setAttribute("message", "Usuario Desativado.");
                    
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    //Logout
    public void logout (HttpServletRequest request, HttpServletResponse response, Funcionario f) throws IOException, SQLException{
        HttpSession session = request.getSession();
        session.setAttribute("Login", "false");
        response.sendRedirect("index.jsp");
    }
    
    
    
    public ResultSet carregareventos(int id) throws SQLException{
        Statement ps = conexao.createStatement();
 	String consulta = "select * from Evento e\n" +
"inner join Calendario c on c.IDEvento = e.IDEvento inner join Local l on l.IDEvento = e.IDEvento inner join funcionario f on e.IDFuncionario = f.IDFuncionario where e.IDFuncionario = "+id+" order by e.IDEvento desc;";
 	ResultSet rs = ps.executeQuery(consulta);
        
        
        return rs;
        
    }


}
