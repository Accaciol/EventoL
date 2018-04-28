/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence;

/**
 *
 * @author Amanda
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
    
    // Método para criar a conexão com o banco
    public static Connection connect() throws ClassNotFoundException{
        Connection conexao = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //String de conexão JDBC indica a qual banco desejamos nos conectar jdbc:mysql://ip/nome_do_banco
            String url = "jdbc:mysql://localhost:3306/Evento";
            
            String user = "root";        // Usuario MySQL
        
            String password = "";       //Senha MySQL
        
            // Abrindo conexão com o banco de dados, utilizando o driver
            conexao = DriverManager.getConnection(url, user, password);
     
        }catch(SQLException e){
            throw new RuntimeException(e);	 
        }
        return conexao;
    }
}
