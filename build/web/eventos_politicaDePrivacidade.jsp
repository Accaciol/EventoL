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
      <title>Eventos - Políticas de privacidade</title>
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
                  <div class="row mt-4 mb-5">
                     <div class="container">
                        <div class="card boxshadow">
                           <div class="card-header">
                              <h1 class="text-center">Políticas de privacidade</h1>
                           </div>
                           <div class="card-body" >
                              <p class="card-text text-justify podepri">
                                 Privacidade das listas de e-mail: Conforme foi mencionado, fazemos uso de listas de e-mail para manter aqueles que 
                                 permitem, desejam e têm interesse em se manter informados sobre tópicos importantes, para as quais estes devem solicitar 
                                 inclusão. O programa do servidor destas listas é configurado de modo a recusar a divulgação dos endereços de e-mail de 
                                 nossa lista de inscritos a qualquer outro que não aquele autorizado por nós. No entanto, não somos autores do programa e,
                                 portanto, responsáveis por quaisquer falhas no programa para preservar o anonimato do inscrito. 
                                 Segurança: Fazemos uso de uma série de garantias físicas, eletrônicas e metodológicas para proteger informações pessoais.
                                 Fazemos uso de ferramentas e técnicas comerciais para garantir a proteção contra acessos não-autorizados ao nosso sistema.
                                 Também restringimos o acesso à informação pessoal àqueles que a necessitam no decorrer de suas atividades para nós. 
                                 Suas próprias garantias para fazer a proteção contra acessos não-autorizados têm papel importante na proteção da segurança
                                 de suas informações pessoais. Sempre que terminar de usar um computador compartilhado, saia de sua conta e sempre faça 
                                 log out de qualquer site no qual seja possível visualizar suas informações pessoais. É possível que tenhamos links para 
                                 sites exteriores dos quais não temos controle. Não somos responsáveis pelo conteúdo ou pela política de privacidade de 
                                 tais sites. Usuários devem checar a política de privacidade de cada site.
                                 Mudanças nesta política de privacidade: Esta política de privacidade será revisada e atualizada se mudanças ocorrerem
                                 em nossas práticas, ou se desejarmos uma melhor maneira de lhe informarmos sobre estas. Visite esta página constantemente
                                 para obter informações atualizadas, assim como a data de quaisquer mudanças. Se esta política de privacidade for alterada,
                                 nova política de privacidade será colocada no Portal da Prefeitura com a devida alteração da data no fim da página. 
                                 Mudanças nesta política de privacidade não se aplicam de modo retroativo.
                                 Caso haja qualquer dúvida, por favor, entre em contato conosco.
                              </p>
                           </div>
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