<%@page import="persistence.DaoEvento"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="persistence.DaoFuncionario"%>
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
    <title>Eventos - Funcionário</title>
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
          <form action="eventos_editarEventos.jsp" method="post">       
	<div class="text-right mr-5 mt-4">
            <button class="btn btn-light" onclick="fonte('d');">A-</button>
            <button class="btn btn-light" onclick="fonte('a');">A+</button>
            <a href="#altocontraste" id="altocontraste" accesskey="3" onclick="window.toggleContrast()" onkeydown="window.toggleContrast()" class="btn btn-light">
            <img src="assets/c.png" />
            <div id="recipiente"></div>
            </a>
        </div>
        <div class="container">
            <div class="row justify-content-center">
                <div class="card mt-4 boxshadow col-lg-8 mx-0 p-0">

                    <div class="card-header">
                        <h1 class="display-4 text-center ">Eventos</h1>
                    </div>

                    <div class="card-body text-center">
                        <div class="row justify-content-center mb-2">
                            <h5 class="m-2" id="user"></h5>
                            <div class="dropdown ml-2 ">
                                <span class="oi oi-wrench dropdown" data-toggle="dropdown"></span>
                                <ul class="dropdown-menu border-0 ml-4">
                                    <li><a href="eventos_alterarSenha.jsp" class="btn btn-primary mr-3 border-light text-white  btn-block text-center btn-sm">Alterar Senha</a></li>
                                    <li><a href="eventos_desativarConta.jsp" class="btn btn-primary mr-3 border-light text-white btn-block text-center btn-sm">Desativar Conta</a></li>
                                </ul>
                            </div>
                            
                           
                            <div class="dropdown ml-2 text-center">
                                <img src="assets/config.png" alt="Configurações de cadastro" class="dropdown" data-toggle="dropdown">
                                <ul class="dropdown-menu border-0 ml-4">
                                    <li><a href="eventos_alterarSenha.jsp" class="btn btn-primary mr-3 border-light text-white  btn-block text-center btn-sm">Alterar Senha</a></li>
                                    <li><a href="eventos_desativarConta.jsp" class="btn btn-primary mr-3 border-light text-white btn-block text-center btn-sm">Desativar Conta</a></li>
                                </ul>
                            </div>
                        </div>
                        
                        <% DaoFuncionario dao = new DaoFuncionario();
                            int id = (Integer)(session.getAttribute("id"));
                            ResultSet rs = dao.consultarFuncionario(id);
                            boolean test = rs.next();
                        %>
                        
                        <h5><label>Matrícula:</label> <label class="corazul"><%= rs.getString("Matricula") %></label></h5>
                        <h5><label>E-mail:</label> <label class="corazul"><%= rs.getString("Email")%> </label></h5>
                        <!--Informações vindas do controller do angular-->
                        <div class="row">
                            <%   
                    ResultSet rset = dao.carregareventos(id);
                    
                   %>
                            <a href="eventos_adicionarEventos.jsp" class="col btn btn-primary mr-3 border-light text-white">Adicionar</a>
       
                            <input  type="submit"  value = "Editar" class="col btn btn-primary mr-3 border-light text-white">

                              <input type="submit" formaction = "ExcluirEvento" value = "Excluir" class="col btn btn-primary mr-3 border-light text-white">
  
                            <% //<a href="eventos_relatorio.jsp" class="col btn btn-primary mr-3 border-light text-white">Relatório</a> %>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-2"></div>
        <br>
        <!--Barra de pesquisa-->
        <!--Eventos-->
        <div class="container">
            <div class="row">
                <% 
                    while(rset.next()){
                         
                %>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-70 boxshadow">
                        <input class="form-check-input" type="checkbox" name="ide" value="<%=rset.getInt("IdEvento") %>">
                        <a href="eventos_descricaoEvento.jsp?id=<%=rset.getInt("IdEvento")%>"><img class="card-img-top" src="assets/evento2.jpg" width="200" height="200" alt=""></a>
                        <div class="card-body ">
                            <h4 class="card-title">
                           <a href="eventos_descricaoEvento.jsp?id=<%=rset.getInt("IdEvento")%>"><%= rset.getString("Nome")%></a>
                        </h4>
                           <div class="card-text corpocard"><img src="assets/data.png" alt="" width="18" height="18"> <%=rset.getString("DataInicial")%> - <%= rset.getString("DataFinal") %>
                                <br><img src="assets/hora.png" alt="" width="18" height="18"> <%= rset.getString("HoraInicial")%> - <%= rset.getString("HoraFinal")%>
                            </div>
                        </div>
                        <div class="card-footer corpocard">
                            <img src="assets/local.png" alt="" width="20" height="20"> <%= rset.getString("Bairro") %> - <%= rset.getString("Rua") %>
                        </div>
                    </div>
                </div>
                            <% } %>
            </div>
        </div>
            
            </form>
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