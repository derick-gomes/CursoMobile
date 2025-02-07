package model;

public class aluno extends Pessoa {
    //atributos
    private String matricula;
    private double nota;
    //contrutor
    public aluno(String nome, String cpf, String matricula, double nota) {
        super(nome, cpf);
        this.matricula = matricula;
        this.nota = nota;
    }
    //getters and setters
    public String getMatricula() {
        return matricula;
    }
    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }
    public double getNota() {
        return nota;
    }
    public void setNota(double nota) {
        this.nota = nota;
    }
    //exibir informações - SobreEscrita
    public void exibirInformaçoes(){
        super.exibirInformaçoes();
        System.out.println("Matricula: "+matricula);
        System.out.println("Nota"+nota);
    }
    //Avaliavel
    @Override
    public void avaliarDesempenho() {
        if (nota>=6) {
            System.out.println("aluno aprovado");
        }else{
            System.out.println("aluno reprovado");
        }
        }
    public void add(aluno aluno) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'add'");
    }
    }
}
