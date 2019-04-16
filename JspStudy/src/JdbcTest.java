import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JdbcTest {
	public static void main(String[] args) {
		try {
			// 1. ���̺귯���� �޸� ���
			Class.forName("com.mysql.jdbc.Driver");

			// 2. DB ����
			String url = "jdbc:mysql://localhost:3306/java";
			String id = "root";
			String pw = "mysql";
			// java.sql ��Ű�� ���̺귯�� import
			Connection con = DriverManager.getConnection(url, id, pw);
			
			// 3. Query ���� �غ�
			String sql = "select * from emp";
			PreparedStatement stmt = con.prepareStatement(sql);
			
			// 4. Query ����
			stmt.executeQuery();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}



