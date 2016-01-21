// CArtAgO artifact code for project jarvis
package objects;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import cartago.Artifact;
import cartago.OPERATION;
import cartago.OpFeedbackParam;
//Artefato simbolizando a garagem do Tony!
public class Garagem extends Artifact {

	List<String> veiculos = new ArrayList<String>();
	
	void init() {
	}

	@OPERATION
	 void colocarCarros() {
		veiculos.add("Audi-R8-Etron");
		veiculos.add("Roadster AC Shellby Cobra");
		veiculos.add("Audi-R8-Spyder");
		veiculos.add("Cadillac");
		veiculos.add("Ford Flathead");
		veiculos.add("Mercury Coupe");
		veiculos.add("Rolls Royce");
		veiculos.add("Saleen S7");
		veiculos.add("Tesla Roadster");
	}
	
	
	@OPERATION
	 void escolherUmCarro(OpFeedbackParam< String> carro) {
		
		Random escolha = new Random();
		int count = escolha.nextInt(veiculos.size());
	
		for(int i = 0; i <= count ; i ++){
			
			if(i == count){
				carro.set(veiculos.get(i));
			}
		}
	}
	
	
}
