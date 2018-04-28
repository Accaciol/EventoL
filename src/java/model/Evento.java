/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
/**
 *
 * @author Amanda
 */
public class Evento {
    private int idEvento;
    private int idFuncionario;
    private String nome;
    private String descricao;
    private String classificacaoIndicativa;
    private String imagem;
    private Calendario data = new Calendario();
    private Local end = new Local();
    public Evento() {
      
    }

    
    
    
    
    public Local getEnd() {
        return end;
    }

    public void setEnd(String rua, String bairro, String numero) {
        this.end.setBairro(bairro);
        this.end.setNumero(numero);

        this.end.setRua(rua);
    }

    public Calendario getData() {
        return data;
    }

    public void setData(String datainicio, String datafinal, String horainicio, String horafinal) {
        this.data.setHoraInicial(horainicio);
        this.data.setDataFinal(datafinal);
        this.data.setDataInicial(datainicio);
        this.data.setHoraFinal(horafinal);
        
    }
   
    
    
    public int getIdEvento(){
        return idEvento;
    }
    public void setIdEvento(int idEvento){
        this.idEvento = idEvento;
    }

    public int getIdFuncionario() {
        return idFuncionario;
    }

    public void setIdFuncionario(int idFuncionario) {
        this.idFuncionario = idFuncionario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getClassificacaoIndicativa() {
        return classificacaoIndicativa;
    }

    public void setClassificacaoIndicativa(String classificacaoIndicativa) {
        this.classificacaoIndicativa = classificacaoIndicativa;
    }
    
    public String getImagem(){
        return imagem;
    }
    
    public void setImagem(String imagem){
        this.imagem = imagem;
    }
}
