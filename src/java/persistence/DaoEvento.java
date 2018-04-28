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
import javax.servlet.http.HttpServletResponse;
import model.Evento;

/**
 *
 * @author Amanda
 */  
public class DaoEvento  {
    
 
    private Connection conexao;

    public DaoEvento() throws ClassNotFoundException {
        ConnectionFactory cf = new ConnectionFactory(); // fazer a conexão com o banco
        conexao = cf.connect();
        
    }
    //Cadastrar Evento
    public void cadastrarEvento (Evento e) throws SQLException{
    //Define se todas as instruções executadas foram comitadas
        conexao.setAutoCommit(false);
        
        // query
        String sql = "insert into Evento(IDFuncionario, Nome, Descricao, ClassificacaoIndicativa) values ('"+e.getIdFuncionario()+"','"+e.getNome()+"','"+e.getDescricao()+"','"+e.getClassificacaoIndicativa()+"')"; 
        String local = "INSERT INTO Local (IDEvento,Rua, Bairro, Numero) VALUES ( ?, '"+e.getEnd().getRua()+"', '"+e.getEnd().getBairro()+"', '"+e.getEnd().getNumero()+"');";

        PreparedStatement ps = conexao.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
        PreparedStatement psl = conexao.prepareStatement(local,PreparedStatement.RETURN_GENERATED_KEYS);
  
        try{
        
            ps.executeUpdate();
            
            
            
            ResultSet rs = ps.getGeneratedKeys();
            

            
            rs.next();
            int id = rs.getInt(1);
            psl.setInt(1,rs.getInt(1));
            psl.executeUpdate();
 String hora = "INSERT INTO Calendario (IDEvento, DataInicial, DataFinal, HoraInicial, HoraFinal) VALUES ('"+id+"', '"+e.getData().getDataInicial()+"', '"+e.getData().getDataFinal()+"', '"+e.getData().getHoraInicial()+"', '"+e.getData().getHoraFinal()+"');";
              PreparedStatement psh = conexao.prepareStatement(hora,PreparedStatement.RETURN_GENERATED_KEYS);

            psh.executeUpdate();

            
            //Grava transações no banco
            conexao.commit();
             
        }catch (SQLException exp){
            //adicionar mensagem de erro ?
            //Descarta transações efetuadas
            conexao.rollback();
        }
        
        finally{
            //Fecha as conexões não nulas
            if (ps != null) {
                ps.close();
            }
            if (conexao != null) {
                conexao.close();
            }
        }                        
    }
    
    //Excluir Evento
   public void excluirEvento (Evento e) throws SQLException{
        //Define se todas as instruções executadas foram comitadas
        conexao.setAutoCommit(false);
        
        //query
        String sql3 = "delete from Calendario where IDEvento = "+e.getIdEvento()+"";
        String sql2 = "delete from Local where IDEvento = "+e.getIdEvento()+"";
        String sql = "delete from Evento where IDEvento = "+e.getIdEvento()+"";
        
        //Cria um objeto que representa a instrução SQL que será executada
        PreparedStatement ps3 = conexao.prepareStatement(sql3);
        PreparedStatement ps2 = conexao.prepareStatement(sql2);
        PreparedStatement ps = conexao.prepareStatement(sql);
        
        try{
            //Pega o id do evento a ser excluido
            
        
            /** Executa a instrução sql para inserção dos dados no banco
            * e retorna a quantidade de registros que são afetados pela execução do comando sql 
            */
            ps3.executeUpdate();
            ps2.executeUpdate();
            ps.executeUpdate();
        
            //Grava transações no banco
            conexao.commit();
             
        }catch (SQLException exp){
            //adicionar mensagem de erro ?
            //Descarta transações efetuadas
            conexao.rollback();
        }
        
        finally{
            //Fecha as conexões não nulas
            if (ps != null) {
                ps.close();
            }
            if (conexao != null) {
                conexao.close();
            }
        }
    }
    
    
    //Alterar evento
   public void alterarEvento (Evento e) throws SQLException{
        //Define se todas as instruções executadas foram comitadas
        conexao.setAutoCommit(false);
        
        //query
        String sql = "update Evento set Nome = ?, Descricao = ? , ClassificacaoIndicativa = ? , Imagem = ? where IDEvento = "+e.getIdEvento()+";";
        String sql2 = "update Calendario set DataInicial = ? , DataFinal = ? , HoraInicial = ? , HoraFinal = ? where IDEvento ="+e.getIdEvento()+";";
        String sql3 = "update Local set Rua = ? , Bairro = ? , Numero = ? where IDEvento = "+e.getIdEvento()+";";
        
        //Cria um objeto que representa a instrução SQL que será executada
        PreparedStatement ps = conexao.prepareStatement(sql);
         PreparedStatement rs = conexao.prepareStatement(sql2);
          PreparedStatement ts = conexao.prepareStatement(sql3);
        
        try{
            //Altera o valor do primeiro parâmetro da sql
            ps.setString(1,e.getNome());
            ps.setString(2, e.getDescricao());
            ps.setString(3, e.getClassificacaoIndicativa());
            ps.setString(4, e.getImagem());
            ps.executeUpdate();
            rs.setString(1, e.getData().getDataInicial());
            rs.setString(2, e.getData().getDataFinal());
            rs.setString(3, e.getData().getHoraInicial());
            rs.setString(4, e.getData().getHoraFinal());
            rs.executeUpdate();
            ts.setString(1, e.getEnd().getRua());
            ts.setString(2, e.getEnd().getBairro());
            ts.setString(3, e.getEnd().getNumero());
            ts.executeUpdate();
              
   
            //Grava transações no banco
            conexao.commit();
             
        }catch (SQLException exp){
          
            conexao.rollback();
        }
        
        finally{
            //Fecha as conexões não nulas
            if (ps != null) {
                ps.close();
            }
            if (conexao != null) {
                conexao.close();
            }
        }                         
    }

    //Consultar evento
     public ResultSet Carregar() throws SQLException{
 	Statement ps = conexao.createStatement();
 	String consulta = "select * from Evento e inner join Calendario c on e.IDEvento = c.IDEvento inner join Local l on e.IDEvento = l.IDEvento order by e.IDEvento desc;";
 	ResultSet rs = ps.executeQuery(consulta);

 	return rs;
   
 	}
      
      public ResultSet CarregarUnico(int id) throws SQLException{
 	Statement ps = conexao.createStatement();
 	String consulta = "select * from Evento e inner join Calendario c on e.IDEvento = c.IDEvento inner join Local l on e.IDEvento = l.IDEvento where l.IDEvento = '"+id+"'";
 	ResultSet rs = ps.executeQuery(consulta);

        return rs;
 	}
      
      
           public ResultSet consultar(String id) throws SQLException{
 	Statement ps = conexao.createStatement();
 	String consulta = "SELECT	e.Nome,\n" +
"		e.Descricao,\n" +
"        e.ClassificacaoIndicativa,\n" +
"		c.DataInicial, \n" +
"		c.DataFinal, \n" +
"        c.HoraInicial, \n" +
"        c.HoraFinal,\n" +
"        l.Rua,\n" +
"        l.Numero,\n" +
"        l.Bairro\n" +
"FROM Evento e        \n" +
"INNER JOIN Local l      ON l.IDEvento = e.IDEvento\n" +
"INNER JOIN Calendario c ON c.IDEvento = e.IDEvento\n" +
"WHERE e.IDEvento = "+id+";";
 	ResultSet rs = ps.executeQuery(consulta);

 	return rs;
   
 	}

    public void alterarEvento(Evento e, Evento ev) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


}