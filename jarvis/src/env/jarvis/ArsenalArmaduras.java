// CArtAgO artifact code for project jarvis

package jarvis;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import cartago.*;

public class ArsenalArmaduras extends Artifact {
	
	private List<String> arsenal;
	private int contArmaduras = 0;
	
	void init() {
		defineObsProperty("count");
		this.arsenal = new ArrayList<String>();
	}
	
	@OPERATION
	void inserirNoArsenal(String nomeArmadura){
		arsenal.add(nomeArmadura);
		contArmaduras++;
	}
	
	@OPERATION
	void percaNoArsenal(String nomeArmadura){
		arsenal.remove(nomeArmadura);
		contArmaduras++;
		String nome = "controladorArmadura"+contArmaduras;
		signal("criar_armadura", nome);
	}
	
	@OPERATION
	void selecionaArmaduras(int coord){
		Random r = new Random();
		int qntArmaduras = r.nextInt(arsenal.size());
		ArrayList<String> selecionadas = new ArrayList<String>();
		for(int i = 0; i<qntArmaduras; i++){
			String a = null;
			do{
			a = arsenal.get(r.nextInt(arsenal.size()));
			}while(selecionadas.contains(a));
			selecionadas.add(a);
			signal("invoca", a, coord);
		}
	}
	
	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}
	
	
}

