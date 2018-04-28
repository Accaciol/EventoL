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
import javax.servlet.http.HttpSession;
import model.Funcionario;
import persistence.DaoFuncionario; 
import static sun.security.jgss.GSSUtil.login;

/**
 *
 * @author Amanda
 */
public class Login extends HttpServlet {

    @Override
    public void init() throws ServletException{
  try {
  //Carrega o driver especificado
  Class.forName("com.mysql.jdbc.Driver");
  } catch (ClassNotFoundException e) {
  System.out.println("Driver não encontrado!"+e);
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
            Funcionario func = new Funcionario();
            HttpSession session = req.getSession();
            session.setAttribute("login", "false");
            func.setEmail(req.getParameter("email"));
            func.setSenha(req.getParameter("senha"));
            DaoFuncionario dao = new DaoFuncionario();
            dao.login(req, response, func);
            if (session.getAttribute("login").equals("true")) {
                response.sendRedirect("eventos_funcionario.jsp");     
            }else{
                 response.sendRedirect("index.jsp"); 
            }
        }catch(SQLException e){
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception exc){
            exc.printStackTrace();
        }
  
    }
    
}
