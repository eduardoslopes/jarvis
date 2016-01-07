package objects;

import java.util.HashMap;
import java.util.Map;

public class Mapa {
	
	Map<String, Integer> coordenada;
	
	public Mapa() {
		coordenada = new HashMap<String, Integer>();
		coordenada.put("Quixada", 1);
		coordenada.put("Casa Peper", 2);
		coordenada.put("Oriente Medio", 3);
		coordenada.put("Rua Visinha", 4);
		coordenada.put("Centro de NY", 5);
		coordenada.put("Senador Pompeu", 6);
		coordenada.put("Casa do tony", 7);
		coordenada.put("Russia", 8);
		coordenada.put("Brasil", 9);
		coordenada.put("Africa do Sul", 10);
	}

	public int getCoordenada(String lugar){
		return coordenada.get(lugar);
	}
	
}
