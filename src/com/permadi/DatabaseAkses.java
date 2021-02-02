package com.permadi;

//import java sql semua package
import java.sql.*;

public class DatabaseAkses {
	
//	var koneksi, statement, resultset	
	private static Connection con = null;
	private static Statement st = null;
	private static ResultSet rs = null;
		
	//	method database akses	
	public DatabaseAkses() {
		//	url localhost, port mysql, database		
		String url = "jdbc:mysql://localhost:3306/query_latihan2";
		//	username localhost		
		String user = "root";
		//	password localhost		
		String password = "";
		//	exception koneksi		
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			con = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {			
			System.out.println(e);
		}
	}
	
	//	method view / select data tabel	
	public static void view() throws SQLException {
		st = con.createStatement();
		rs = st.executeQuery("SELECT * FROM tb_person");
		
		System.out.println("Tampil Semua Data :");
		
		
		while(rs.next()) {
			System.out.println("\nID Person : " + rs.getString(1));
			System.out.println("Nama : " + rs.getString(2));
			System.out.println("Tanggal Lahir : " + rs.getString(3));
			System.out.println("Tempat Lahir : " + rs.getString(4));
			System.out.println("Jenis Kelamin : " + rs.getString(5));
			System.out.println("Status : " + rs.getString(5));
		}
	}
	
	//	method view / select data tabel	
	public static void view1() throws SQLException {
		st = con.createStatement();
		rs = st.executeQuery("SELECT A.ID_Person, A.Nama, B.Nama Nama_Ayah, C.Nama Nama_Ibu FROM tb_person A, tb_person B, tb_person C "
				+ "WHERE A.ID_Person=B.ID_Person AND A.ID_Person=C.ID_Person AND A.ID_Person='Data003'");
		
		System.out.println("Tampil nama Ayah dan ibu dari Rudi :");
		
		
		while(rs.next()) {
			System.out.println("\nID Person : " + rs.getString(1));
			System.out.println("Nama : " + rs.getString(2));
			System.out.println("Nama Ayah : " + rs.getString(3));
			System.out.println("Nama Ibu : " + rs.getString(4));
		}
	}
	
	//	method view / select data tabel	
	public static void view2() throws SQLException {
		st = con.createStatement();
		rs = st.executeQuery("SELECT B.ID_Person, B.Nama FROM tb_person A, tb_person B "
				+ "WHERE B.ID_Ayah=A.ID_Person AND A.ID_Person='Data001'");
				
		System.out.println("Nama anak anak Budi :");
		
		while(rs.next()) {
			System.out.println("\nID Person : " + rs.getString(1));
			System.out.println("Nama Anak : " + rs.getString(2));
		}
	}
	
	//	method view / select data tabel	
	public static void view3() throws SQLException {
		st = con.createStatement();
		rs = st.executeQuery("SELECT B.ID_Person, B.Nama FROM tb_person A, tb_person B "
				+ "WHERE B.ID_Pasangan=A.ID_Person AND A.ID_Person='Data002'");
				
		System.out.println("Nama Pasangan dari Santi :");
		
		while(rs.next()) {
			System.out.println("\nID Person : " + rs.getString(1));
			System.out.println("Nama Pasangan : " + rs.getString(2));
		}
	}
	
	
}
































