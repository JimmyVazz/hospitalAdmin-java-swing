/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app;
import java.awt.Dimension;
import java.awt.Toolkit;
import java.sql.*;
import java.time.LocalTime;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
/**
 *
 * @author Erendira Luna
 */
public class Asistencia extends javax.swing.JFrame {
    
  PreparedStatement ps;
   ResultSet rs;
   Connection con = null;

    /**
     * Creates new form Empleado
     */
    public Asistencia() {
        initComponents();
        Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
this.setLocation(dim.width/2-this.getSize().width/2, dim.height/2-this.getSize().height/2);
    }
    
    private void limpiarCaja(){
        txtClave.setText(null);
        txthoraComidaInicio.setText(null);
        txthoraComidafin.setText(null);
        txtIdVacaciones.setText(null);
        txtFalta.setText(null);
        txthoraEntrada.setText(null);
        txtHoraSalida.setText(null);
        txtFecha.setText(null);
        txtIncapacidades.setText(null);
       
        txtIdEmpleado.setText(null);
       
        txtIdTurno.setText(null);
        txtIdCargo.setText(null);
    }
    
    private void guardarDatos() throws SQLException{
        
       Connection con = null;
        
        
        try {
            con = databaseControl.DatabaseHandler.getConnection();
           //ESTA PARTE DE INSERT INTO MODIFICAR
            ps = con.prepareStatement("insert into empleados (clave, Nombre, ApPat, ApMat, Fecha_Nac, Calle, Noext, Noint, Colonia, Municipio, Estado, RFC, CURP, Genero, Cedula_profesional, Telefono, Email) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, txtClave.getText());
            ps.setString(2, txtIdEmpleado.getText());
            ps.setString(3, txtIdCargo.getText());
            ps.setString(4, txtIdTurno.getText());
            ps.setString(5,txtIncapacidades.getText());
           // ps.setDate(5, Date.valueOf(txtIncapacidades.getText()));
            ps.setString(6, txtIdVacaciones.getText());
            //ps.setInt(7, Integer.parseInt(txtFecha.getText()));
            ps.setDate(8,Date.valueOf(txtFecha.getText()));
            ps.setTime(9, Time.valueOf(txthoraEntrada.getText()));
           
            ps.setTime(10,Time.valueOf( txtHoraSalida.getText()));
           
            ps.setTime(11,Time.valueOf( txthoraComidaInicio.getText()));
            ps.setTime(12,Time.valueOf( txthoraComidafin.getText()));
            ps.setBoolean(13, Boolean.parseBoolean(txtFalta.getText()));
           
            
            int res = ps.executeUpdate();
            
            if (res > 0) {
                JOptionPane.showMessageDialog(null, "Asistencia se registro con éxito!");
                limpiarCaja();
            }else{
               JOptionPane.showMessageDialog(null, "Hubo un error al guardar!"); 
               
            }
            
            con.close();
            
        } catch (Exception e) {
            System.err.println(e);
        }
        
        
    }
    
    public void eliminarDatos(){
        Connection con = null;
        try {
            con = databaseControl.DatabaseHandler.getConnection();
            
            ps = con.prepareStatement("delete from asistencia where clave = ?");
            ps.setString(1, txtClave.getText());
            int res = ps.executeUpdate();
            if (res > 0) {
              JOptionPane.showMessageDialog(null, "Se elimino el registro de asistencia con clave: "+txtClave.getText() + " de forma exitosa!"); 
              limpiarCaja();
            }else{
                JOptionPane.showMessageDialog(null, "Hubo un error al eliminar!"); 
            }
            
            con.close();
            
        } catch (Exception e) {
        }
    }
    
    public void buscarDatos(){
         Connection con = null;
        try {
            con = databaseControl.DatabaseHandler.getConnection();
            
            ps = con.prepareStatement("select * from asistencia where clave = ?");
            ps.setString(1, txtClave.getText());
           
           rs = ps.executeQuery();
          
            if (rs.next() ) {
              txtIdEmpleado.setText(rs.getString("IdEmpleado"));
              txtIdCargo.setText(rs.getString("IdCargo"));
              txtIdTurno.setText(rs.getString("IdTurno"));
              txthoraComidaInicio.setText(rs.getString("horaComidaInicio"));
             
              txtIdVacaciones.setText(rs.getString("IdVacaciones"));
              txtFalta.setText(Integer.toString(rs.getInt("Falta")));
              txthoraEntrada.setText(rs.getString("HoraEntrada"));
              txtHoraSalida.setText(rs.getString("HoraSalida"));
              txtFecha.setText(Integer.toString(rs.getInt("Fecha")));
              
         
            }else{
                JOptionPane.showMessageDialog(null, "Hubo un error al buscar!"); 
            }
            
            con.close();
            
        } catch (Exception e) {
        }
        
        
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        txtClave = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        txtIdEmpleado = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        txtIdCargo = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        txtIdTurno = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        txtIncapacidades = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        txtIdVacaciones = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        txtFecha = new javax.swing.JTextField();
        jLabel9 = new javax.swing.JLabel();
        txthoraEntrada = new javax.swing.JTextField();
        jLabel11 = new javax.swing.JLabel();
        txtHoraSalida = new javax.swing.JTextField();
        jLabel13 = new javax.swing.JLabel();
        txthoraComidaInicio = new javax.swing.JTextField();
        jLabel15 = new javax.swing.JLabel();
        txtFalta = new javax.swing.JTextField();
        btnGuardar = new javax.swing.JButton();
        btnActualizar = new javax.swing.JButton();
        btnEliminar = new javax.swing.JButton();
        btnLimpiar = new javax.swing.JButton();
        btnBuscar = new javax.swing.JButton();
        jLabel14 = new javax.swing.JLabel();
        txthoraComidafin = new javax.swing.JTextField();
        txtBackj = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setText("Clave:");

        jLabel2.setText("ID Empleado :");

        jLabel3.setText("ID cargo :");

        jLabel4.setText("ID turno: ");

        jLabel5.setText("ID incapacidades:");

        jLabel6.setText("ID vacaciones: ");

        jLabel7.setText("Fecha: ");

        txtFecha.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtFechaActionPerformed(evt);
            }
        });

        jLabel9.setText("Hora de entrada: ");

        jLabel11.setText("Hora de salida: ");

        jLabel13.setText("Hora de comida inicio: ");

        jLabel15.setText("Falta: ");

        btnGuardar.setText("Guardar");
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGuardarActionPerformed(evt);
            }
        });

        btnActualizar.setText("Actualizar");

        btnEliminar.setText("Eliminar");
        btnEliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEliminarActionPerformed(evt);
            }
        });

        btnLimpiar.setText("Limpiar");
        btnLimpiar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnLimpiarActionPerformed(evt);
            }
        });

        btnBuscar.setText("Buscar");

        jLabel14.setText("Hora de comida fin: ");

        txtBackj.setText("Regresar al home");
        txtBackj.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtBackjActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel15)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txtFalta))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txtClave))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txtIdEmpleado, javax.swing.GroupLayout.PREFERRED_SIZE, 375, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel3)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txtIdCargo))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel4)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txtIdTurno))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel5)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txtIncapacidades))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel9)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txthoraEntrada))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel11)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txtHoraSalida))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel13)
                        .addGap(18, 18, 18)
                        .addComponent(txthoraComidaInicio))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel6)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txtIdVacaciones))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel7)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txtFecha))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel14)
                        .addGap(18, 18, 18)
                        .addComponent(txthoraComidafin)))
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 91, Short.MAX_VALUE)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(btnGuardar)
                            .addComponent(btnActualizar)
                            .addComponent(btnEliminar)
                            .addComponent(btnLimpiar)
                            .addComponent(btnBuscar))
                        .addGap(53, 53, 53))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(74, 74, 74)
                        .addComponent(txtBackj)
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel1)
                            .addComponent(txtClave, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(21, 21, 21)
                        .addComponent(btnBuscar)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel2)
                            .addComponent(txtIdEmpleado, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(21, 21, 21)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel3)
                            .addComponent(txtIdCargo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(19, 19, 19)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel4)
                            .addComponent(txtIdTurno, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(btnGuardar, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(btnActualizar)
                        .addGap(30, 30, 30)))
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(txtIncapacidades, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnEliminar))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(txtIdVacaciones, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel7)
                            .addComponent(txtFecha, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(1, 1, 1)
                        .addComponent(btnLimpiar)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel9)
                    .addComponent(txthoraEntrada, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel11)
                    .addComponent(txtHoraSalida, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel13)
                            .addComponent(txthoraComidaInicio, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel14)
                            .addComponent(txthoraComidafin, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(txtBackj)
                        .addGap(20, 20, 20)))
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel15)
                    .addComponent(txtFalta, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txtFechaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtFechaActionPerformed
        // TODO add your handling code here:
        
    }//GEN-LAST:event_txtFechaActionPerformed

    private void btnEliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEliminarActionPerformed
        // TODO add your handling code here:
        eliminarDatos();
    }//GEN-LAST:event_btnEliminarActionPerformed

    private void btnLimpiarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLimpiarActionPerformed
        // TODO add your handling code here:
        limpiarCaja();
    }//GEN-LAST:event_btnLimpiarActionPerformed

    private void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarActionPerformed
        // TODO add your handling code here:
        try {
            guardarDatos();
        } catch (Exception e) {
            
        }
        
    }//GEN-LAST:event_btnGuardarActionPerformed

    private void txtBackjActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtBackjActionPerformed
Home home = new Home();
           home.setVisible(true);
           this.setVisible(false);        // TODO add your handling code here:
    }//GEN-LAST:event_txtBackjActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Empleado.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Empleado.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Empleado.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Empleado.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Asistencia().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnActualizar;
    private javax.swing.JButton btnBuscar;
    private javax.swing.JButton btnEliminar;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JButton btnLimpiar;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JButton txtBackj;
    private javax.swing.JTextField txtClave;
    private javax.swing.JTextField txtFalta;
    private javax.swing.JTextField txtFecha;
    private javax.swing.JTextField txtHoraSalida;
    private javax.swing.JTextField txtIdCargo;
    private javax.swing.JTextField txtIdEmpleado;
    private javax.swing.JTextField txtIdTurno;
    private javax.swing.JTextField txtIdVacaciones;
    private javax.swing.JTextField txtIncapacidades;
    private javax.swing.JTextField txthoraComidaInicio;
    private javax.swing.JTextField txthoraComidafin;
    private javax.swing.JTextField txthoraEntrada;
    // End of variables declaration//GEN-END:variables
}
