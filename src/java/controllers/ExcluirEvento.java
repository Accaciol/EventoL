/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import model.Evento;
import persistence.DaoEvento;

/**
 *
 * @author DesenvolvedorJava
 */
public class ExcluirEvento extends HttpServlet {
    
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Evento ev = new Evento();
            String oi = "";
                    oi = request.getParameter("ide");
            ev.setIdEvento(Integer.parseInt(request.getParameter("ide")));
 
            DaoEvento dao = new DaoEvento();
            dao.excluirEvento(ev);
            
            
          response.sendRedirect("eventos_funcionario.jsp");


    } catch (ClassNotFoundException | SQLException ex) {
        Logger.getLogger(ExcluirEvento.class.getName()).log(Level.SEVERE, null, ex);
    } catch (Exception exc){
        exc.printStackTrace();
    }
    
   }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
