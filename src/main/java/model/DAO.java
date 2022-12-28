package model;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;



public class DAO {
	Connection connection;
	
	
	public void connectdb() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		connection = (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tp3", "root", "");
	}
	
	public boolean checkUser(String email, String password) throws ClassNotFoundException, SQLException {
		connectdb();
		PreparedStatement stmt = (PreparedStatement) connection.prepareStatement("select * from admins where email=? and mdp =?");
		stmt.setString(1, email);
		stmt.setString(2, password);
		int count = 0;
		ResultSet res = stmt.executeQuery();
		while (res.next()) {
			count++;
		}
		connection = null;
		return count != 0;
	}
	
	public int ajouterEtudiant(String nomE, String prenomE, float moyenneE) throws ClassNotFoundException, SQLException {
		
		connectdb();
		PreparedStatement statement = (PreparedStatement) connection
				.prepareStatement("insert into etudiant (nomE, prenomE, moyenneE) values(?,?,?)");
		statement.setString(1, nomE);
		statement.setString(2, prenomE);
		statement.setFloat(3, moyenneE);
		statement.executeUpdate();
		
		PreparedStatement stmt = (PreparedStatement) connection.prepareStatement("SELECT numE FROM etudiant ORDER BY numE DESC LIMIT 1;");
		ResultSet res = stmt.executeQuery();
		int returnedValue = 0;
		while(res.next()) {
			returnedValue = res.getInt("numE");
		}
		connection = null;
		return returnedValue;
	}
	
	public void supprimerEtudiant(int numE) throws ClassNotFoundException, SQLException {
		connectdb();
		PreparedStatement statement = (PreparedStatement) connection.prepareStatement("delete from etudiant where numE=?");
		statement.setInt(1, numE);
		statement.executeUpdate();
		connection = null;
	}
	
	public ArrayList<Etudiant> getEtudiants() throws SQLException, ClassNotFoundException {
		connectdb();
		ArrayList<Etudiant> list = new ArrayList<Etudiant>();
		Etudiant etudiant = null;
		Statement statement = connection.createStatement();

		ResultSet resultat = statement.executeQuery("select etudiant.numE, nomE, prenomE, moyenneE, voeux1, voeux2, voeux3 from etudiant,voeux where etudiant.numE = voeux.numE");
		while (resultat.next()) {
			etudiant = new Etudiant();
			etudiant.setNumE(resultat.getInt("numE"));
			etudiant.setNomE(resultat.getString("nomE"));
			etudiant.setPrenomE(resultat.getString("prenomE"));
			etudiant.setMoyenneE(resultat.getFloat("moyenneE"));
			etudiant.setVoeux1(resultat.getString("voeux1"));
			etudiant.setVoeux2(resultat.getString("voeux2"));
			etudiant.setVoeux3(resultat.getString("voeux3"));
			list.add(etudiant);
		}
		System.out.println(list);
		connection = null;
		return list;
	}
	public ArrayList<NbrVoeuxParChoix> getNbrVoeuxParChoix() throws SQLException, ClassNotFoundException {
		connectdb();
		ArrayList<NbrVoeuxParChoix> list = new ArrayList<>();
		
		PreparedStatement stmt =(PreparedStatement) 
				connection.prepareStatement("SELECT voeux1 as voeu, COUNT(voeux1) as nbr_voeux FROM voeux GROUP BY voeux1;");
		ResultSet res = stmt.executeQuery();
		while(res.next()) {
			NbrVoeuxParChoix vpp = new NbrVoeuxParChoix();
			vpp.setChoix(res.getString("voeu"));
			vpp.setNbrVoeux(res.getInt("nbr_voeux"));
			list.add(vpp);
		}
		connection = null;
		return list;	
	}
	
}
