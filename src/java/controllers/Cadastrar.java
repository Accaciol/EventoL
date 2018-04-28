package controllers;


import model.Evento;
import model.Funcionario;
import model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistence.DaoFuncionario;



public class Cadastrar extends HttpServlet {

    @Override
    public void init() throws ServletException{
  try {
  //Carrega o driver especificado
  Class.forName("com.mysql.jdbc.Driver");
  } catch (ClassNotFoundException e) {
  System.out.println("Driver não encontrado!"+e);
  } 
  }

    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response)
            throws ServletException, IOException {
        
 try{
     
        Funcionario fun = new Funcionario();
        fun.setNome(req.getParameter("nome"));
        fun.setMatricula(req.getParameter("matricula"));
        fun.setEmail(req.getParameter("email"));
        fun.setSenha(req.getParameter("senha"));
        
        
        
       
                

        DaoFuncionario dao = new DaoFuncionario();
                    dao.cadastrarFuncionario(fun);
                    
         String redirectURL = "index.jsp";
         response.sendRedirect(redirectURL);
                    
            } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
}       catch (ClassNotFoundException ex) {       
            Logger.getLogger(Cadastrar.class.getName()).log(Level.SEVERE, null, ex);
        }       
}

    }



