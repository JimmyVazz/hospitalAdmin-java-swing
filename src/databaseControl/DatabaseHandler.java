package databaseControl;
import java.sql.*;
import java.sql.Connection;          //Aqui obtenemos el metodo conectar
import java.sql.DriverManager;       //Aqui obtenemos el manejo del driver de java a mysql
import java.sql.PreparedStatement;   //Aqui obtenemos una sintaxis facil de crear sentencias sql
import java.sql.SQLException;        //Aqui obtenemos los metodo para manejo de excepciones
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *Clase principal de la conexion a la BD
 * @author jimmy
 * @version 0.1
 */
public class DatabaseHandler {
   
    
    /**
     * Objeto ensapsulado con donde se guarda el estado de la conexion a la BD
     * @return 
     */
    private static Connection con;   
    
    /***
     * Contructor vacio que manda un mensaje del estado de la BD
     */
    public DatabaseHandler(){
        System.out.println("Base de datos conectada");
    }
   
    /***
     * Metodo estatico connection para realizar la conexion a la BD
     * Try
     * Catch
     * Para manejar las excepciones
     * @return retorna la conexion o un null
     */
    public static Connection getConnection() {
        if(con == null){
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "");
            }catch (ClassNotFoundException ex){
                Logger.getLogger(DatabaseHandler.class.getName()).log(Level.SEVERE, null, ex);
            }catch(SQLException ex){
                Logger.getLogger(DatabaseHandler.class.getName()).log(Level.SEVERE, null, ex);
            
            }
        }
        return con;
    }
    /***
     * metodo statico para desconectar para la BD
     * regresa su valor a null, dejando fuera la conexion
     */
    public static void disconnect(){
        if(con != null){
            con=null;
        }
    }
    
    /***
     * Metodo para validar el login
     * 
     * @param uname variable donde se valida el usuario
     * @param pass variable donde se valida la contraseña
     * @return retorna un booelean y de eso se abre el Home o una alerta
     */
    public static boolean CheckLoginUser(String uname, String pass) { //get input from login system module
        Connection connection = getConnection();
        String checkQuery = "select * from login where email = ? and password = ? "; // i don't use id from database table.
        
        PreparedStatement preparedStatement = null;
        boolean status = false; //initially false

        try {
            preparedStatement = connection.prepareStatement(checkQuery);
            preparedStatement.setString(1, uname); // dynamically sending username
            preparedStatement.setString(2, pass); // sending password to checkquery statement
            ResultSet resultSet = preparedStatement.executeQuery();

            status = resultSet.next();
            preparedStatement.close();
            return status;

        } catch (SQLException e) {
//            e.getLocalizedMessage();
            e.printStackTrace();
        }
        return status;
    }
    
}