package model;


public class Funcionario {
    
    private int IDFuncionario;
    private String Nome;
    private String Email;
    private String Senha;
    private String Matricula;
    private String Ativo;

    public Funcionario(String Nome, String Email, String Senha, String Matricula, String Ativo) {
        this.Nome = Nome;
        this.Email = Email;
        this.Senha = Senha;
        this.Matricula = Matricula;
        this.Ativo = Ativo;
    }

    public Funcionario() {
    }

    
    
    public Funcionario(int IDFuncionario, String Nome, String Email, String Senha, String Matricula, String Ativo) {
        this.IDFuncionario = IDFuncionario;
        this.Nome = Nome;
        this.Email = Email;
        this.Senha = Senha;
        this.Matricula = Matricula;
        this.Ativo = Ativo;
    }

    public int getIDFuncionario() {
        return IDFuncionario;
    }

    public void setIDFuncionario(int IDFuncionario) {
        this.IDFuncionario = IDFuncionario;
    }

    public String getNome() {
        return Nome;
    }

    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getSenha() {
        return Senha;
    }

    public void setSenha(String Senha) {
        this.Senha = Senha;
    }

    public String getMatricula() {
        return Matricula;
    }

    public void setMatricula(String Matricula) {
        this.Matricula = Matricula;
    }

    public String getAtivo() {
        return Ativo;
    }

    public void setAtivo(String Ativo) {
        this.Ativo = Ativo;
    }
 

}