package objects;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class RepositorioReunioes {

	List<Reuniao> reunioes;
	
	public RepositorioReunioes() {
		reunioes = new ArrayList<Reuniao>();
		reunioes.add(new Reuniao(10, "Pepper"));
		reunioes.add(new Reuniao(9, "Capitao America"));
		reunioes.add(new Reuniao(11, "Vingadores"));
		reunioes.add(new Reuniao(20, "Bruce Benner"));
		reunioes.add(new Reuniao(18, "Rhodes"));
		reunioes.add(new Reuniao(19, "Aldrich Killian"));
		reunioes.add(new Reuniao(15, "Nick Fury"));
		reunioes.add(new Reuniao(21, "Agente Colson"));
	}
	
	public Reuniao getReuniao(){
		Random r = new Random();
		int i = r.nextInt(6);
		return reunioes.get(i);
	}

}
