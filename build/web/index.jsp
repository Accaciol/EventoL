<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="persistence.ConnectionFactory"%>
<%@page import="java.util.List"%>
<%@page import="model.Evento"%>
<%@page import="java.util.ArrayList"%>
<%@page import="persistence.DaoEvento"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<% request.getParameter("id");%>
<html lang="pt-br">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <link rel="stylesheet" href="css/bootstrap.css">
      <link rel="stylesheet" href="css/bootstrap-social.css">
      <link rel="stylesheet" href="css/style.css">
      <link rel="stylesheet" href="css/style2.css">
      <link rel="icon" href="assets/icon.png">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
      <title>Eventos - Página inicial</title>
	  <link rel="stylesheet" href="css/contrast.css">
   </head>
   <body class="bannerr acessibilidade">
      <header>
     
          <% String log = (String) request.getSession().getAttribute("login");
              boolean nova = session.isNew();
           if (nova){
          session.setAttribute("login", "false");
          %>
           
          <nav class="navbar navbar-expand-lg navbar-light" style=" background: linear-gradient(#27408B,#4A708B);">
            <a class="navbar-brand ml-auto mr-auto" href="index.jsp"> 
            <img src="assets/logo.png" alt="Logo Prefeitura Rio" width="240" height="42">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon">
            </span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
               <ul class="navbar-nav ml-auto ml-auto" id="login">


               </ul>
               <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                     <div class="modal-content">
                        <div class="modal-header">
                           <h5 class="modal-title" id="loginModalLabel">
                              Fazer o login
                           </h5>
                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                           </button>
                        </div>
                        <div class="modal-body">
                            <form id="form-login" method="POST" action="Login">
                              <div class="form-group">
                                 <label for="user-login" class="col-form-label">
                                 Usuário:
                                 </label>
                                 <input type="text" class="form-control" name="email" id="user-login" required>
                              </div>
                              <div class="form-group">
                                 <label for="pass-login" class="col-form-label">
                                 Senha:
                                 </label>
                                 <input type="password" class="form-control" name="senha" id="pass-login" required>
                                 <div class="text-right">
                                    <a href="eventos_recuperacaoSenha.jsp">
                                    Esqueci a senha
                                    </a>
                                 </div>
                              </div>
                              <div class="form-group text-center">
                                 <input type="submit" class="btn btn-success" id="btn-logar" value="Logar">
                              </div>
                              <br>
                           </form>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </nav>
          <% }else if (session.getAttribute("login").equals("true")){%>
           <nav class="navbar navbar-expand-lg navbar-light  pl-5 " style=" background: linear-gradient(#27408B,#4A708B);">
           <a class="navbar-brand ml-auto mr-auto" href="index.html">
               <img src="assets/logo.png" alt="Logo Prefeitura Rio" width="240" height="42">
           </a>
           <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon">
            </span>
           </button>
           <div class="collapse navbar-collapse" id="navbarSupportedContent">
               <ul class="navbar-nav ml-auto ml-auto ">
                   <li class="nav-item ">
                       <a class="itemnav ml-4" href="index.jsp" > Página inicial <span class="sr-only">(current)</span></a>
                   </li>
                   <li class="nav-item ">
                       <a class="itemnav  ml-4" href="eventos_sobre.jsp" > Sobre <span class="sr-only">(current)</span></a>
                   </li>

                   <li class="nav-item ">
                       <a class="itemnav ml-4" href="eventos_contato.jsp"> Contato <span class="sr-only">(current)</span></a>
                   </li>
                   <li class="nav-item ">
                       <a class="itemnav ml-4" href="eventos_funcionario.jsp"> ${nome} <span class="sr-only">(current)</span></a>
                   </li>
                   <!--<li class="nav-item ">
                       <a class="itemnav  ml-4 " href="#" data-toggle="modal" data-target="#loginModal" data-whatever="@getLogin"> Login <span class="sr-only">(current)</span></a>
                   </li>-->
                   <li class="nav-item ">
                       <a class="itemnav  ml-4  text-light" href="logout.jsp" style="cursor: pointer">Sair</a>
                   </li>
               </ul>
           </div>
       </nav>
         <%}else
          if ((log.equals("false")) || nova ){%>
              <nav class="navbar navbar-expand-lg navbar-light" style=" background: linear-gradient(#27408B,#4A708B);">
            <a class="navbar-brand ml-auto mr-auto" href="index.jsp"> 
            <img src="assets/logo.png" alt="Logo Prefeitura Rio" width="240" height="42">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon">
            </span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
               <ul class="navbar-nav ml-auto ml-auto" id="login">


               </ul>
               <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                     <div class="modal-content">
                        <div class="modal-header">
                           <h5 class="modal-title" id="loginModalLabel">
                              Fazer o login
                           </h5>
                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                           </button>
                        </div>
                        <div class="modal-body">
                            <form id="form-login" method="POST" action="Login">
                              <div class="form-group">
                                 <label for="user-login" class="col-form-label">
                                 Usuário:
                                 </label>
                                 <input type="text" class="form-control" name="email" id="user-login" required>
                              </div>
                              <div class="form-group">
                                 <label for="pass-login" class="col-form-label">
                                 Senha:
                                 </label>
                                 <input type="password" class="form-control" name="senha" id="pass-login" required>
                                 <div class="text-right">
                                    <a href="eventos_recuperacaoSenha.jsp">
                                    Esqueci a senha
                                    </a>
                                 </div>
                              </div>
                              <div class="form-group text-center">
                                 <input type="submit" class="btn btn-success" id="btn-logar" value="Logar">
                              </div>
                              <br>
                           </form>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </nav>
              <% }%>
      </header>
       
      <main>
	  <div class="text-right mr-5 mt-4">
            <button class="btn btn-light" onclick="fonte('d');">A-</button>
            <button class="btn btn-light" onclick="fonte('a');">A+</button>
            <a href="#altocontraste" id="altocontraste" accesskey="3" onclick="window.toggleContrast()" onkeydown="window.toggleContrast()" class="btn btn-light">
            <img src="assets/c.png" />
            <div id="recipiente"></div>
            </a>
        </div>
         <div class="container">
            <div class="row" >
               <div class="container mt-4">
                  <div class="row titlee justify-content-center text-center">
                     <h2 class="mt-4 w-100"> AGENDA DE EVENTOS </h2>
                     <h3 class="mt-4 mb-4"> Fique ligado em todos os eventos das secretarias do<br>Rio de Janeiro!</h3>
                      <form class="row mb-4 w-100 justify-content-center">
                          <input class="form-control mr-2 w-50 col-5" type="search" placeholder="Buscar evento" aria-label="Search" required>
                          <input class="btn btn-light col-3 col-lg-1 col-md-2 col-sm-2" type="submit" placeholder="Buscar" alt="botão de buscar">
                      </form>
                  </div>
               </div>
               
                
                
                
               <div class="col-lg-12 text-center">
                  <div class="row justify-content-center">
                      <% 
                            DaoEvento dao = new DaoEvento();
                            ResultSet rs = dao.Carregar();
                            while(rs.next()){
                                
                            %>

                     <div class="col-11 col-lg-4 col-md-6 col-sm-8 mb-4">
                        <div class="card h-70 boxshadow" >
                           <a href="eventos_descricaoEvento.jsp?id=<%=rs.getInt("IDEvento")%>"><img class="card-img-top" src="assets/evento2.jpg" width="200" height="200" alt="" ></a>
                           <div class="card-body ">
                              <h4 class="card-title">
                                 <a href="eventos_descricaoEvento.jsp?id=<%=rs.getInt("IDEvento")%>"><%= rs.getString("Nome") %></a>
                              </h4>
                              <div class="card-text corpocard"><img src="assets/data.png" alt="" width="18" height="18"> <%= rs.getString("DataInicial") %> até <%= rs.getString("DataFinal") %>
                                 <br><img src="assets/hora.png" alt="" width="18" height="18"> <%= rs.getString("HoraInicial") %> até <%= rs.getString("HoraFinal") %>
                              </div>
                           </div>
                           <div class="card-footer corpocard">
                              <img src="assets/local.png" alt="" width="20" height="20"> <%= rs.getString("Bairro") %> - <%= rs.getString("Rua") %>
                           </div>
                        </div>
                              
                              
                     </div>
                              <%
                                  }
                              %>
                      
                  </div>

                   <div class="row" id="eventos">


                   </div>
               </div>
            </div>
         </div>
      </main>
       
       
      <footer class="page-footer font-small stylish-color-dark text-center mt-5">
          <div class="container" style="font-size: 14px">


              <div class="row">
                  <div class="col">
                      <a href="#" class="text-light">Mapa do Site</a>
                  </div>
                  <nav class="col">
                      <a class="text-light dropdown-toggle" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                          Outros Links
                      </a>
                  </nav>
                  <div class="col">
                      <span>Siga - nos</span>
                      <div class="social-icons">
                          <a class="text-light fa fa-facebook mr-2" href="https://www.facebook.com/PrefeituradoRio" style="text-decoration:none">
                          </a>
                          <a class="text-light fa fa-twitter mr-2" href="https://twitter.com/Prefeitura_Rio" style="text-decoration:none">
                          </a>
                          <a class="text-light fa fa-instagram mr-2" href="https://www.instagram.com/prefeitura_rio/" style="text-decoration:none">
                          </a>
                      </div>
                  </div>
              </div>


              <div class="row ">
                  <div class="col justify-content-center nav-pills collapse" id="navbarToggleExternalContent">
                      <hr>
                      <a class="text-light col" href="eventos_ajuda.jsp">Ajuda</a>
                      <a class="text-light col" href="eventos_perguntasFrequentes.jsp">FAQ</a>
                      <a class="text-light col" href="eventos_termosDeUso.jsp">Termos de Uso</a>
                      <a class="text-light col" href="eventos_politicaDePrivacidade.jsp">Política de Privacidade</a>
                  </div>
              </div>

              <hr>
              <div class="col text-center">
                  <p>© 2018 Copyright - Todos os direitos reservados</p>
                  <a class="text-light" href="https://www.forsoft.org.br/">FORSOFT-RIO</a>
              </div>

          </div>
      </footer>
      <!-- Optional JavaScript -->
      <!-- jQuery first, then Popper.js, then Bootstrap JS -->
      <script src="js/bdLocal.js"></script>
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
	  <script src="js/zoomInOut.js"></script>
    <script src="js/acessibilidade.js"></script>
    <script src="http://arquivos.weblibras.com.br/auto/wl-min.js"></script>
    <script>
        var wl = new WebLibras({
            compatibilityMode: true
        });
    </script>
   </body>
</html>