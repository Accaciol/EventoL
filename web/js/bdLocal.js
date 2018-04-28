window.addEventListener('load', carregado);
window.addEventListener('load', acessoBD);
window.addEventListener('load', consultaBD);

var db = openDatabase('bdEventos', '1.0', 'MeuBanco', 2 * 1024 * 1024);
    db.transaction(function(tx) {
        tx.executeSql("CREATE TABLE IF NOT EXISTS logins (login VARCHAR NOT NULL, senha VARCHAR NOT NULL, acesso BOOLEAN);");
    });


function carregado(){

    document.getElementById('btn-salvar').addEventListener('click', salva);
    document.getElementById('btn-logar').addEventListener('click', logar);

}

function logar(){
    var user = document.getElementById("user-login").value;
    var pass = document.getElementById("pass-login").value;

    db.transaction(function(tx){
        tx.executeSql("SELECT * FROM logins", [], function(tx, resultado){
            var rows = resultado.rows;
            var cols = resultado.cols;
            var result;

            if (user !='' && pass !='' ){
                for(var i = 0;i < rows.length; i++) {
                    if ((rows[i].login == user) && (rows[i].senha == pass)) {
                        result = "Acesso concedido, Bem Vindo" + rows[i].login;
                        tx.executeSql("UPDATE logins SET acesso=? WHERE login=?", [true, rows[i].login]);
                        acessoBD();
                        //location.reload();
                        break;
                    } else {
                        result = "Usuario e/ou senha incoretos!";
                    }
                }
            }
            alert(result);
        });
    },erro);
}

function sair(){
    db.transaction(function(tx){
        tx.executeSql("UPDATE logins SET acesso=? WHERE acesso=?", [false, true]);
        location.reload();
		window.location.href="index.jsp"
    },erro);
}

function salva(){
    var user = document.getElementById("nome").value;
    var pass = document.getElementById("senha").value;

    if (user !='' && pass !='' ){
        db.transaction(function(tx) {
            tx.executeSql("INSERT INTO logins (login, senha, acesso) VALUES (?,?,?);",[user, pass, false]);
        },erro);
    }
}

function acessoBD(){
    var inf = document.getElementById('nav');

    db.transaction(function(tx) {
        tx.executeSql("SELECT * FROM logins", [], function (tx, resultado) {
            var rows = resultado.rows;
            var nome = "";
            var nav = document.getElementById("login");
            var h5 = document.getElementById("user");

            for(var i = 0;i < rows.length; i++){
                if (rows[i].acesso == 'true'){
                    nome = rows[i].login;
                }
            }
            if (nome != ""){
                nav.innerHTML = "<li class='nav-item '><a class='itemnav ml-4 text-light' href='index.jsp' > Página inicial <span class='sr-only'>(current)</span></a> </li><li class='nav-item '><a class='itemnav  ml-4 text-light' href='eventos_sobre.jsp' > Sobre <span class='sr-only'>(current)</span></a></li><li class='nav-item '><a class='itemnav ml-4 text-light' href='eventos_contato.jsp'> Contato <span class='sr-only'>(current)</span></a></li><li class='nav-item '><a id='user' class='itemnav ml-4 text-light' href='eventos_funcionario.jsp'>" + nome + "</a></li><li class='nav-item'><a id='sair' onclick='sair()' class='itemnav ml-4 text-light' style='cursor: pointer'>Sair</a></li>";
                h5.innerHTML = "Bem vindo, "+  nome;
            } else {
                nav.innerHTML = "<li class='nav-item'><a class='itemnav ml-4 text-light' href='index.jsp' > Página inicial <span class='sr-only'>(current)</span></a> </li><li class='nav-item '><a class='itemnav  ml-4 text-light' href='eventos_sobre.jsp' > Sobre <span class='sr-only'>(current)</span></a></li><li class='nav-item '><a class='itemnav ml-4 text-light' href='eventos_contato.jsp'> Contato <span class='sr-only'>(current)</span></a></li><li class='nav-item '><a class='itemnav  ml-4 text-light' href='#' data-toggle='modal' data-target='#loginModal' data-whatever='@getLogin'> Login <span class='sr-only'>(current)</span></a></li><li class='nav-item'><a class='itemnav ml-4 text-light' href='eventos_cadastrofuncionario.jsp'>Cadastre-se</a></li>";







            }


        })
    }, erro);

}

function consultaBD() {

    var table = document.getElementById('consulta');

    db.transaction(function(tx){
        tx.executeSql("SELECT * FROM logins", [], function(tx, resultado){
            var rows = resultado.rows;
            var cols = resultado.cols;

            if (rows.length < 1){
                tx.executeSql("INSERT INTO logins (login, senha, acesso) VALUES (?,?,?);",["adm", "123", "false"]);
            }

            var table = "";
            for(var i = 0;i < rows.length; i++){
                table += '<tr scope="row">';
                table += '<th>' + (i+1) + '</th>';
                table += '<td>' + rows[i].login + '</td>';
                table += '<td>' + rows[i].senha + '</td>';
                table += '<td>' + rows[i].acesso + '</td>';
                table += '<td><button type="button" onclick="deletar(this.value)" class="btn-danger del" value="'+ rows[i].login +'">X</button></td>';
                table += '</tr>';
            }
            nr.innerHTML = rows.length +'#';
            consulta.innerHTML = table;
        });
    },erro);
}

function atualizar(){

}

function deletar(value){
    db.transaction(function(tx) {
        tx.executeSql("DELETE FROM logins WHERE login=?", [value]);
    },erro);
    consultaBD();
}

function erro(tx,falha){
    document.getElementsByTagName("body").innerHTML = "<div class='position-absolute w-100 h-100' style='background: background-image: linear-gradient(to top, rgba(219, 220, 215, 0.50) 0%, rgba(221, 220, 215, 0.51) 24%, rgba(226, 201, 204, 0.51) 30%, rgba(231, 98, 125, 0.50) 46%, rgba(184, 35, 90, 0.51) 59%, #801357 71%, #3d1635 84%, #1c1a27 100%);'><img class='position-relative mx-auto' src='img/erro.gif'></div>";
    alert(falha.message);
}

var verador = "";
var contador=0;
function eventos(){
    var eventos = document.getElementById("eventos");
	var img;
        
    for(var  i = 0;i < 9;i++){
		if (contador % 2 == 1){
            img = "inovacao.jpg";
            contador++;
        } else {
            img = "project.png";
            contador++;
        }
        verador += "<div class='col-11 col-lg-4 col-md-6 col-sm-8 mb-4'> <div class='card h-70 boxshadow' > <a href='eventos_descricaoEvento.jsp'><img class='card-img-top' src='assets/"+img+"' width='200' height='200' alt='' ></a> <div class='card-body '> <h4 class='card-title'> <a href='eventos_descricaoEvento.jsp'>Palestra 2018</a> </h4> <div class='card-text corpocard'><img src='assets/data.png' alt='' width='18' height='18'> 20/05/2018 <br><img src='assets/hora.png' alt='' width='18' height='18'> 19h </div> </div> <div class='card-footer corpocard'><img src='assets/local.png' alt='' width='20' height='20'> Laranjeiras - Espaço Saude </div> </div> </div>";
    }
    eventos.innerHTML = verador;
}

var contador = 1;
function addEventos() {
    var addEventos = document.getElementById("gerador");

    verador += "<div class='border border-primary mt-3 mb-3 p-3'>\n\
<label for='dataInicial'>Data inicial: </label>\n\
<input type='date' name='dataInicial"+contador+"' id='dataInicial"+contador+"' class='form-control input-md' required />\n\
<label for='dataFinal'>Data final: </label> \n\
<input type='date' name='dataFinal"+contador+"' id='dataFinal"+contador+"' class='form-control input-md' required /> \n\
\n\
<label for='horaInicial'>Hora inicial: </label> \n\
<input type='time' name='horaInicial"+contador+"' id='horaInicial"+contador+"' class='form-control input-md' required /> \n\
<label for='horaFinal'>Hora final: </label> \n\
<input type='time' name='horaFinal"+contador+"' id='horaFinal"+contador+"' class='form-control input-md' required /> \n\
<label for='bairro' class='mt-2'>Bairro:</label>\n\
<input type='text' id='bairro"+contador+"' name='bairro"+contador+"' class='form-control input-md' required >\n\
<label for='rua' class='mt-2'>Rua:</label>\n\
<input type='text' id='rua"+contador+"' name='rua"+contador+"' class='form-control input-md' required >\n\
\n\<label for='numero' class='mt-2'>Numero:</label>\n\
<input type='text' id='numero"+contador+"' name='numero"+contador+"' class='form-control input-md' required >\n\
</div>";

    
    
    addEventos.innerHTML = verador;
    contador++;

}             