package rental.JDBCTemplate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCTemplate {

	private static JDBCTemplate instance;
	private static Connection conn;

	private JDBCTemplate() {

	}

	public JDBCTemplate getInstance() {
		if (instance == null) {
			instance = new JDBCTemplate();

		}
		return instance;
	}

	public static Connection creatConnection() throws ClassNotFoundException, SQLException {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "student";
		String password = "student";
		
		if (conn==null||conn.isClosed()) {
			Class.forName("Oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection(url);
			conn.setAutoCommit(false);
		}
		
		return conn;
	}
	
	public void close() {
		if(conn!=null) {
			try {
				if(!conn.isClosed()) {
				conn.close();
			}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}}
	}

}
