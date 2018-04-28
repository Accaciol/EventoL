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
import model.Evento;
import persistence.DaoEvento;

/**
 *
 * @author Lluiz
 */
public class CadastrarEvento extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Evento e = new Evento();

 
                          e.setNome(request.getParameter("eventos"));
            e.setData(request.getParameter("dataInicial"), request.getParameter("dataFinal"), request.getParameter("horaInicial"), request.getParameter("horaFinal"));
            e.setEnd(request.getParameter("rua"), request.getParameter("bairro"), request.getParameter("numero"));
            e.setClassificacaoIndicativa(request.getParameter("classificacao"));

            
            
            e.setDescricao(request.getParameter("descricao"));

            HttpSession session = request.getSession();

            DaoEvento dao = new DaoEvento();
                   e.setIdFuncionario((Integer)(session.getAttribute("id")));
            dao.cadastrarEvento(e);
            response.sendRedirect("eventos_funcionario.jsp");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CadastrarEvento.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CadastrarEvento.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception exc) {
            exc.printStackTrace();
        }

    }

}
