<%@page import="java.sql.ResultSet"%>
<%@page import="persistence.DaoEvento"%>

<jsp:include page="eventos_verificalogin.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
      <title>Eventos - Editar evento</title>
	  <link rel="stylesheet" href="css/contrast.css">
   </head>
   <body class="bannerr acessibilidade">
   <header>
       <nav class="navbar navbar-expand-lg navbar-light  pl-5 " style=" background: linear-gradient(#27408B,#4A708B);">
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
                               <form id="form-login" method="POST" onsubmit="return logar()">
                                   <div class="form-group">
                                       <label for="user-login" class="col-form-label">
                                           Usuário:
                                       </label>
                                       <input type="text" class="form-control" id="user-login" required>
                                   </div>
                                   <div class="form-group">
                                       <label for="pass-login" class="col-form-label">
                                           Senha:
                                       </label>
                                       <input type="password" class="form-control" id="pass-login" required>
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
            <div class="row">
            </div>
            <div class="col-lg-12">
               <div class="row ">
                  <div class="container">
                     <div class="card mt-4  boxshadow">
                        <div class="card-header">
                           <h1 class="text-center">Editar evento</h1>
                        </div>
                        <div class="card-body">
                           <form action="AlterarEvento" method="post">
                            
                                 <% 
                            DaoEvento dao = new DaoEvento();
                            ResultSet rs = dao.consultar();
                            while(rs.next()){
                                
                            %>
                               
                               
                                     <label for="nomeEvento">Titulo:</label>
                                     <input type="text" id="nomeEvento" name="eventos" value="<%= rs.getString("Nome") %>" class="form-control input-md" required />
                                                                       
                                     <label for="fotosEventos">Imagem:</label>
                                    
                                     <input type="file" id="imagem" name="fotoseventos"  class="form-control input-md" required/>
                                      <div class="border border-primary mt-3 mb-3 p-3">
                                     <label for="dataInicial" class="mt-2">Data inicial: </label>
                                     <input type="date" name="dataInicial" id="dataInicial" class="form-control input-md" value="<%= rs.getString("DataInicial") %>"required />

                                     <label for="dataFinal" class="mt-2">Data final: </label>
                                     <input type="date" name="dataFinal" id="dataFinal" class="form-control input-md" value="<%= rs.getString("DataFinal") %>" required />

                                     <label for="horaInicial" class="mt-2">Hora inicial: </label>
                                     <input type="time" name="horaInicial" id="horaInicial" class="form-control input-md" value="<%= rs.getString("HoraInicial") %>" required />

                                     <label for="horaFinal" class="mt-2">Hora final: </label>
                                     <input type="time" name="horaFinal" id="horaFinal" class="form-control input-md" value="<%= rs.getString("HoraFinal") %>" required />

                                     
                                                         
                                     <label for="bairro" class="mt-2">Bairro:</label>
                                     <input type="text" id="bairro" name="bairro" class="form-control input-md" value="<%= rs.getString("Bairro") %>" required >
                                                                   
                                     <label for="rua" class="mt-2">Rua:</label>
                                     <input type="text" id="rua" name="rua" class="form-control input-md" value="<%= rs.getString("Rua") %>" required >
                                                            
                                     <label for="numero" class="mt-2">Numero:</label>
                                     <input type="text" id="numero" name="numero" class="form-control input-md" value="<%= rs.getString("Numero") %>" required >
                                      </div>
                                     


                                  <label for="classificacao">Classificação Indicativa:</label>
                                  <select name="classificacao" class="form-control input-md mt-2" id="classificacao" required>
                                      
                                      
                                      <% 
                                         if(rs.getString("ClassificacaoIndicativa").equals("livre")) {  %>
                                         <option value="livre" selected>livre</option>
                                          <option value="10anos">10 anos</option>
                                          <option value="12anos">12 anos</option>
                                          <option value="14anos">14 anos</option>
                                          <option value="16anos">16 anos</option>
                                          <option value="18anos">18 anos</option>
                                     <%}%>
                                          
                                       <% 
                                         if(rs.getString("ClassificacaoIndicativa").equals("10 anos")) {  %>
                                          <option value="livre">livre</option>
                                          <option value="10anos" selected>10 anos</option>
                                          <option value="12anos">12 anos</option>
                                          <option value="14anos">14 anos</option>
                                          <option value="16anos">16 anos</option>
                                          <option value="18anos">18 anos</option>
                                     <%}%>
                                     
                                      <% 
                                         if(rs.getString("ClassificacaoIndicativa").equals("12 anos")) {  %>
                                           <option value="livre">livre</option>
                                          <option value="10anos">10 anos</option>
                                          <option value="12anos" selected> 12 anos</option>
                                          <option value="14anos">14 anos</option>
                                          <option value="16anos">16 anos</option>
                                          <option value="18anos">18 anos</option>
                                     <%}%>
                                     
                                      <% 
                                         if(rs.getString("ClassificacaoIndicativa").equals("14 anos")) {  %>
                                          <option value="livre">livre</option>
                                          <option value="10anos">10 anos</option>
                                          <option value="12anos">12 anos</option>
                                          <option value="14anos" selected>14 anos</option>
                                          <option value="16anos">16 anos</option>
                                          <option value="18anos">18 anos</option>
                                     <%}%>
                                     
                                      <% 
                                         if(rs.getString("ClassificacaoIndicativa").equals("16 anos")) {  %>
                                          <option value="livre">livre</option>
                                          <option value="10anos">10 anos</option>
                                          <option value="12anos">12 anos</option>
                                          <option value="14anos">14 anos</option>
                                          <option value="16anos" selected>16 anos</option>
                                          <option value="18anos">18 anos</option>
                                     <%}%>
                                     
                                      <% 
                                         if(rs.getString("ClassificacaoIndicativa").equals("18 anos")) {  %>
                                          <option value="livre">livre</option>
                                          <option value="10anos">10 anos</option>
                                          <option value="12anos">12 anos</option>
                                          <option value="14anos">14 anos</option>
                                          <option value="16anos">16 anos</option>
                                          <option value="18anos" selected>18 anos</option>
                                     <%}%>
                                         
                                         
                                       
                                          
                                      </select>
                                  <label for="descricao">Descrição:</label>
                                  <textarea read rows="10" name="descricao" id="descricao" class="form-control input-md mt-2" required ><%= rs.getString("Descricao") %></textarea>
                              <div class="form-group mt-4">
                                 <button id="salvar" name="salvar" type="submit" class="btn btn-primary">
                                 Salvar
                                 </button>
                                 <button class="btn btn-primary" type="reset">
                                 Cancelar
                                 </button>
                              </div>
                            <%
                                  }
                              %>
                           </form>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <!-- /.row -->
         </div>
         <!-- /.col-lg-9 -->
      </main>
   <footer class="page-footer font-small stylish-color-dark text-center">
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