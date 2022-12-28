package model;

public class Etudiant {
	private int numE;
	private String nomE;
	private String prenomE;
	private float moyenneE;
	private String voeux1;
	private String voeux2;
	private String voeux3;

	public Etudiant() {}

	public int getNumE() {
		return numE;
	}

	public void setNumE(int numeE) {
		this.numE = numeE;
	}

	public String getNomE() {
		return nomE;
	}

	public void setNomE(String nomeE) {
		this.nomE = nomeE;
	}

	public String getPrenomE() {
		return prenomE;
	}

	public void setPrenomE(String prenomE) {
		this.prenomE = prenomE;
	}

	public float getMoyenneE() {
		return moyenneE;
	}

	public void setMoyenneE(float moyenneE) {
		this.moyenneE = moyenneE;
	}
	
	public String getVoeux1() {
		return voeux1;
	}

	public void setVoeux1(String voeux1) {
		this.voeux1 = voeux1;
	}

	public String getVoeux2() {
		return voeux2;
	}

	public void setVoeux2(String voeux2) {
		this.voeux2 = voeux2;
	}

	public String getVoeux3() {
		return voeux3;
	}

	public void setVoeux3(String voeux3) {
		this.voeux3 = voeux3;
	}
}
