package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Funcionario;
import persistence.DaoFuncionario;
import persistence.DaoFuncionarioDesativa;

public class Desativa extends HttpServlet {

    @Override
    public void init() throws ServletException {
        try {
            //Carrega o driver especificado
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Driver não encontrado!" + e);
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
       
        
        try{
     
        Funcionario fun = new Funcionario();
        
        HttpSession session = request.getSession();
        
        DaoFuncionarioDesativa dao = new DaoFuncionarioDesativa();
                    dao.DesativaFuncionario((Integer)(session.getAttribute("id")));


         String redirectURL = "index.jsp";
         response.sendRedirect(redirectURL);
                    
            } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
}       catch (ClassNotFoundException ex) {
            Logger.getLogger(Desativa.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
