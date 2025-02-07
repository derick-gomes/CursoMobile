package model;

public class professor extends Pessoa {
    //atributo
    private double salario;
    //construtor

    public professor(String nome, String cpf, double salario) {
        super(nome, cpf);
        this.salario = salario;
    }
    //getters and setters

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }
    @Override
    public void ExibirInformaçoes() {
        super.exibirinformações();
        System.out.println("salario "+salario);
    }

    
}
