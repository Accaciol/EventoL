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
      <title>Eventos - Relatório</title>
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
               <div class="row mt-4">
                  <div class="container">
                     <div class="card boxshadow">
                        <div class="card-header">
                           <h1 class="text-center">Relatório</h1>
                           <!-- titulo da pagina -->
                        </div>
                        <div class="card-body text-center">
                           <!-- texto da pagina -->
                           <h4 class="corazul">Fulano de Tal</h4>
                           <!-- Apenas o nome do funcionário -->
                           <!--table ou lista-->
                           <table class="table-bordered w-100" >
                              <thead>
                                 <tr>
                                    <th scope="col">Evento</th>
                                    <th scope="col">Status</th>
                                    <th scope="col" >Data</th>
                                    <th scope="col">Hora</th>
                                    <th scope="col">Funcionário</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <tr>
                                    <td rowspan="3" >
                                       <figure>
                                          <figcaption>SXSW 2018</figcaption>
                                          <img src="assets/evento2.jpg" width="150" height="145" />
                                       </figure>
                                    </td>
                                    <td>Publicação</td>
                                    <td>03/04/2018</td>
                                    <td>12:45</td>
                                    <td>Nome Sobrenome</td>
                                 </tr>
                                 <tr>
                                    <td>Edição</td>
                                    <td>04/04/2018</td>
                                    <td>11:00</td>
                                    <td>Nome Sobrenome</td>
                                 </tr>
                                 <tr>
                                    <td>Exclusão</td>
                                    <td>none</td>
                                    <td>none</td>
                                    <td>none</td>
                                 </tr>
                                 <tr>
                                    <td rowspan="3" >
                                       <figure>
                                          <figcaption>Palestra Gratuita</figcaption>
                                          <img src="assets/evento1.png" width="150" height="145" />
                                       </figure>
                                    </td>
                                    <td>Publicação</td>
                                    <td>03/04/2018</td>
                                    <td>13:45</td>
                                    <td>Nome Sobrenome</td>
                                 </tr>
                                 <tr>
                                    <td>Edição</td>
                                    <td>04/04/2018</td>
                                    <td>12:00</td>
                                    <td>Nome Sobrenome</td>
                                 </tr>
                                 <tr>
                                    <td>Exclusão</td>
                                    <td>none</td>
                                    <td>none</td>
                                    <td>none</td>
                                 </tr>
                                 <tr>
                                    <td rowspan="3">
                                       <figure>
                                          <figcaption>O Cluster</figcaption>
                                          <img src="assets/evento3.jpg" width="150" height="145" />
                                       </figure>
                                    </td>
                                    <td>Publicação</td>
                                    <td>03/04/2018</td>
                                    <td>14:45</td>
                                    <td>Nome Sobrenome</td>
                                 </tr>
                                 <tr>
                                    <td>Edição</td>
                                    <td>04/04/2018</td>
                                    <td>13:00</td>
                                    <td>Nome Sobrenome</td>
                                 </tr>
                                 <tr>
                                    <td>Exclusão</td>
                                    <td>none</td>
                                    <td>none</td>
                                    <td>none</td>
                                 </tr>
                                 <tr>
                                    <td rowspan="3" >
                                       <figure>
                                          <figcaption>10 anos de arte</figcaption>
                                          <img src="assets/evento4.jpg" width="150" height="145" />
                                       </figure>
                                    </td>
                                    <td>Publicação</td>
                                    <td>03/04/2018</td>
                                    <td>15:45</td>
                                    <td>Nome Sobrenome</td>
                                 </tr>
                                 <tr>
                                    <td>Edição</td>
                                    <td>04/04/2018</td>
                                    <td>14:00</td>
                                    <td>Nome Sobrenome</td>
                                 </tr>
                                 <tr>
                                    <td>Exclusão</td>
                                    <td>none</td>
                                    <td>none</td>
                                    <td>none</td>
                                 </tr>
                                 <tr>
                                    <td rowspan="3" >
                                       <figure>
                                          <figcaption>Festival RIO2C</figcaption>
                                          <img src="assets/evento5.jpg" width="150" height="145" />
                                       </figure>
                                    </td>
                                    <td>Publicação</td>
                                    <td>03/04/2018</td>
                                    <td>16:45</td>
                                    <td>Nome Sobrenome</td>
                                 </tr>
                                 <tr>
                                    <td>Edição</td>
                                    <td>04/04/2018</td>
                                    <td>15:00</td>
                                    <td>Nome Sobrenome</td>
                                 </tr>
                                 <tr>
                                    <td>Exclusão</td>
                                    <td>none</td>
                                    <td>none</td>
                                    <td>none</td>
                                 </tr>
                                 <tr>
                                    <td rowspan="3" >
                                       <figure>
                                          <figcaption>Contos do Mar</figcaption>
                                          <img src="assets/evento6.jpg" width="150" height="145" />
                                       </figure>
                                    </td>
                                    <td>Publicação</td>
                                    <td>03/04/2018</td>
                                    <td>17:45</td>
                                    <td>Nome Sobrenome</td>
                                 </tr>
                                 <tr>
                                    <td>Edição</td>
                                    <td>04/04/2018</td>
                                    <td>16:00</td>
                                    <td>Nome Sobrenome</td>
                                 </tr>
                                 <tr>
                                    <td>Exclusão</td>
                                    <td>none</td>
                                    <td>none</td>
                                    <td>none</td>
                                 </tr>
                              </tbody>
                              <tfoot>
                              </tfoot>
                           </table>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
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