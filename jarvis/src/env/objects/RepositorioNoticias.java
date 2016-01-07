package objects;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class RepositorioNoticias {
	List<Noticia> noticias;
	
	public RepositorioNoticias() {
		noticias = new ArrayList<Noticia>();
		noticias.add(new Noticia("Assalto", "Quixada"));
		noticias.add(new Noticia("Ameaca de bomba", "Casa Peper"));
		noticias.add(new Noticia("Guerra", "Oriente Medio"));
		noticias.add(new Noticia("Incendio", "Rua Visinha"));
		noticias.add(new Noticia("Huck Enlouqueceu", "Centro de NY"));
		noticias.add(new Noticia("Roubo de ovelhas", "Senador Pompeu"));
		noticias.add(new Noticia("Briga de bebados", "Casa do tony"));
		noticias.add(new Noticia("Assasinato em serie", "Russia"));
		noticias.add(new Noticia("Escandalo de Corrupcao", "Brasil"));
		noticias.add(new Noticia("Surto de gripe", "Africa do Sul"));
	}
	
	public Noticia getNoticia(){
		Random r = new Random();
		int i = r.nextInt(9);
		return noticias.get(1);
	}
	
}
