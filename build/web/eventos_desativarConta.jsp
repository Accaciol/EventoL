<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="eventos_verificalogin.jsp" />
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
    <title>Eventos - Desativar Conta</title>
	<link rel="stylesheet" href="css/contrast.css">
</head>
<body class="bannerr acessibilidade">
<header>
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
                   <!--<li class="nav-item ">
                       <a class="itemnav  ml-4 " href="#" data-toggle="modal" data-target="#loginModal" data-whatever="@getLogin"> Login <span class="sr-only">(current)</span></a>
                   </li>-->
                   <li class="nav-item ">
                       <a class="itemnav  ml-4  text-light" href="logout.jsp" style="cursor: pointer">Sair</a>
                   </li>
               </ul>
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
    <div class="container" style="margin-bottom: 350px">
    <div class="row">
    </div>
    <div class="col-lg-12">
        <div class="row ">
            <div class="container">
                <div class="card mt-4  boxshadow">
                    <div class="card-header">
                        <h1 class="display-4 text-center ">Desativar conta</h1>
                    </div>
                    <div class="card-body text-center">
                        <h5 class="m-2"> Deseja desativar a conta ? </h5>
                        <% int ida = (Integer)(session.getAttribute("id")); %>
                        <form action="Desativa">
                        <button  class="btn btn-primary mr-3 border-light text-white"  >Sim</button>
                        </form>
                        <a href="eventos_funcionario.jsp" class="btn btn-primary mr-3 border-light text-white" >Não</a>

                        
                        
                      
                        
                    </div>
                </div>
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
