package model;

import java.util.ArrayList;
import java.util.List;

public class Cursos {
    //atributos
    private String nomeCurso;
    private professor professor;
    private List <aluno> alunos;
    //construtor
    public Cursos(String nomeCurso, professor professor, List<aluno> alunos) {
        this.nomeCurso = nomeCurso;
        this.professor = professor;
        this.alunos= new ArrayList<>();
    }
    //adiconarAlunos
    public void adiconarAlunos(aluno aluno){
        aluno.add(aluno);
    }

    //informaçoes do curso
    public void exibirInformaçoesCurso(){
        System.out.println("nome do curso: "+nomeCurso);
        System.out.println("========");
        System.out.println("nome do Professor"+professor);
        System.out.println("==================");
        System.out.println("Lista de Alunos");
        int i = 1;
    }

    
    
}
