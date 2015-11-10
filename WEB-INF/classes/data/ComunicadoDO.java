/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

/**
 *
 * @author Juliana
 */
public class ComunicadoDO {
    
     private int _idrem;
  private int _iddest;
  private String _comun;
  private String _data;

  public int getIdrem() {
     return _idrem;
  } // getId do remetente

  public void setIdrem(int idr) {
    _idrem = idr;
  } // setId do remetente
  
  public int getIdDest() {
     return _iddest;
  } // getId do Destinatário

  public void setIdDest(int idd) {
    _iddest = idd;
  } // setId do Destinatário

  public String getComunicado() {
    return _comun;
  } // obterComunicado

  public void setComunicado(String comunicado) {
    _comun = comunicado;
  } // setComunicado


  public String getData() {
    return _data;
  } // getData

  public void setData(String dat) {
    _data = dat;
  } // setData
    
} // Comunicado
