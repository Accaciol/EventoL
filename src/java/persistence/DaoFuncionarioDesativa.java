
package persistence;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Funcionario;

public class DaoFuncionarioDesativa extends HttpServlet {

    private Connection conexao;

    public DaoFuncionarioDesativa() throws ClassNotFoundException {
        ConnectionFactory cf = new ConnectionFactory(); // fazer a conexão com o banco
        conexao = cf.connect();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    public void DesativaFuncionario(int id) throws SQLException {
        //Define se todas as instruções executadas foram comitadas
        conexao.setAutoCommit(false);

        //query
        
        String sql = "UPDATE funcionario SET Ativo = 0 WHERE IDFuncionario = '" + id + "'";

        //Cria um objeto que representa a instrução SQL que será executada
        PreparedStatement ps = conexao.prepareStatement(sql);

        ps.executeUpdate();
        
        conexao.commit();
        
        
        if (ps != null) {
            ps.close();
        }
        if (conexao != null) {
            conexao.close();
            
        }
    }
}