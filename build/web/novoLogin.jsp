<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="pt-br" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="sortcut icon" href="img/aspiraN3.ico" type="text/x-icon"/>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap-social.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <title>Eventos - Index</title>
    <style type="text/css">
        .animate-svg{
            width: 160pt;
        }
        @media (min-width: 768px) and (max-width: 991px) {
            .animate-svg{
                width: 30%;
                margin: 0 auto;
                margin-left: 100px;
                margin-right: 100px;
            }
        }
        @media (min-width: 546px) and (max-width: 767px) {
            .animate-svg{
                width: 40%;
                margin: 0 auto;
                margin-left: 100px;
                margin-right: 100px;
            }
        }
        .animate-svg svg{
            stroke-width: 1px;
            stroke: #111;
            width: 100%;
            height: 100%;
            stroke-dashoffset: 0;
            stroke-dasharray: 1000;
            animation: svganimation 7s ease-in-out forwards infinite;
        }
        @keyframes svganimation {
            0%{
                stroke-dashoffset: 1000;
            }
            75%{
                stroke-dashoffset: 0;
                color: #004085;
            }
            100%{
                stroke-dashoffset: 0;
            }
        }
    </style>
</head>
<body>
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
            <ul class="navbar-nav ml-auto" id="login">


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
                            <form id="form-login" method="POST" action="/Cadastrar" onsubmit="return logar()">
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

            <div class="row mt-5 mb-3">


                <div class="card col-10 col-sm-5 col-md-4 col-lg-3 mb-3 mx-auto bg-dark">

                    <form method="post" onsubmit="return salva()" id="form-novologin" class="text-light">
                        <h5 class="text-center text-warning">Add+ Acesso</h5>
                        <div class="form-group">
                            <label for="nome" class="col-form-label">Novo Usuário:</label>
                            <input type="text" class="form-control" id="nome" name="nome" required>
                        </div>
                        <div class="form-group">
                            <label for="senha" class="col-form-label">Senha:</label>
                            <input type="password" class="form-control" id="senha" name="senha" required>
                        </div>
                        <div class="form-group" align="center">
                            <input type="submit" id="btn-salvar" class="btn " value="Logar">
                        </div>

                    </form>
                </div>

                <div class="col-lg-8 col-md-7 mx-auto text-center">
                    <table class="table table-hover">
                        <thead>
                        <tr class="bg-dark text-light">
                            <th scope="col" class="text-warning" id="nr"></th>
                            <th scope="col">Login</th>
                            <th scope="col">Senha</th>
                            <th scope="col">Logado</th>
                            <th scope="col">Lixo</th>
                        </tr>
                        </thead>
                        <tbody id="consulta">

                        </tbody>
                    </table>
                </div>


            </div>

    </main>

    <script src="js/bdLocal.js"></script>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>