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
      <title>Eventos - Perguntas frequentes</title>
	  <link rel="stylesheet" href="css/contrast.css">
   </head>
   <body class="bannerr acessibilidade">
        <header>
     
          <% String log = (String) request.getSession().getAttribute("login");
              boolean nova = session.isNew();
           if (nova){%>
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
            <div class="row">
               <div class="col-lg-12">
                  <div class="row mt-4">
                     <div class="container">
                        <div class="card  boxshadow">
                           <div class="card-header">
                              <h1 class="text-center">Perguntas frequentes</h1>
                           </div>
                           <div class="card-body">
                              <h6>Eu posso publicar um evento meu?</h6>
                              <p class="card-text text-left">
                                 Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                 Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                 Duis aute irure dolor in.
                              </p>
                              <hr>
                              <h6>Porque não consigo logar no site?</h6>
                              <p class="card-text text-left">
                                 Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                 Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                 Duis aute irure dolor in. 
                              </p>
                              <hr>
                              <h6>Só a secretaria pode inserir eventos?</h6>
                              <p class="card-text text-left">
                                 Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                 Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                 Duis aute irure dolor in.
                              </p>
                              <hr>
                              <h6>Como entrar em contato com o responsavel pelo evento ?</h6>
                              <p class="card-text text-left">
                                 Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                 Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                 Duis aute irure dolor in.
                              </p>
                              <hr>
                              <h6>Quem pode se cadastrar?</h6>
                              <p class="card-text text-left">
                                 Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                 Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                 Duis aute irure dolor in.
                              </p>
                              <hr>
                              <h6>Eventos necessitam de ingressos?</h6>
                              <p class="card-text text-left">
                                 Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                 Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                 Duis aute irure dolor in.
                              </p>
                              <hr>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </main>
      <footer class=" font-small text-center mt-4" style=" background: linear-gradient(#27408B,#4A708B);">
         <div class="container">
            <div class="row">
               <div class="col-4">
                  <a href="#">
                     <p class="text-white">
                        Mapa do Site
                     </p>
                  </a>
               </div>
               <div class="col-4">
                  <b>Links</b><br>
                  <a class="text-white" href="eventos_ajuda.jsp">
                  Ajuda
                  </a>
                  <br>
                  <a class="text-white" href="eventos_perguntasFrequentes.jsp">
                  FAQ
                  </a>
                  <br>
                  <a class="text-white" href="eventos_termosDeUso.jsp">
                  Termos de Uso
                  </a>
                  <br>
                  <a class="text-white" href="eventos_politicaDePrivacidade.jsp">
                  Política de Privacidade
                  </a>
               </div>
               <div class="col-4">
                  <b>Siga - nos</b>
                  <div class="social-icons">
                     <a class="text-white fa fa-facebook mr-2" href="https://www.facebook.com/PrefeituradoRio" style="text-decoration:none">
                     </a>
                     <a class="text-white fa fa-twitter mr-2" href="https://twitter.com/Prefeitura_Rio" style="text-decoration:none">
                     </a>
                     <a class="text-white fa fa-instagram mr-2" href="https://www.instagram.com/prefeitura_rio/" style="text-decoration:none">
                     </a>
                     <br>
                  </div>
               </div>
            </div>
            <hr>
            <div class="col-md-12">
               <a class="text-center">
               © 2018 Copyright - Todos os direitos reservados
               </a>
               <br>
               <a class="text-center" href="https://www.forsoft.org.br/" style="color:white">
               FORSOFT-RIO
               </a>
            </div>
            <div class="col-md-12">
            </div>
         </div>
      </footer>
      <!-- Optional JavaScript -->
      <!-- jQuery first, then Popper.js, then Bootstrap JS -->
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