package model;

public class Pessoa {
    private String nome;
    private String cpf;
    //Métodos
    //Construtor
    public Pessoa(String nome, String cpf) {
        this.nome = nome;
        this.cpf = cpf;
    } 
    // getters and setters
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public String getCpf() {
        return cpf;
    }
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    //Método exibir informações
    public void exibirinformações() {
        System.out.println("nome:"+nome);
        System.out.println("CPF:" + cpf);
    }
}
