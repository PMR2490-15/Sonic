/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

/**
 *
 * @author aluno
 */
public class AdministradorDO {
    
  private int Usuario_id;
  private String _Nome;
  private String _CPF;
  private String _Email;
  private String _Telefone;

  public int getUsuarioId() {
     return Usuario_id;
  } // getId

  public void setUsuarioId(int id) {
    Usuario_id=id;
  } // setId
  
  public String getNome() {
    return _Nome;
  } // getNome

  public void setNome(String nome) {
    _Nome = nome;
  } // setNome
  
  public String getCPF() {
     return _CPF;
  } // getCPF

  public void setCPF(String cpf) {
    _CPF = cpf;
  } // setCPF

  public String getEmail() {
    return _Email;
  } // obterEmail

  public void setEmail(String email) {
    _Email = email;
  } // setEmail

  public String getTelefone() {
    return _Telefone;
  } // getTelefone

  public void setTelefone(String tel) {
    _Telefone = tel;
  } // setTelefone
  
}
