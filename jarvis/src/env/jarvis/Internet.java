// CArtAgO artifact code for project jarvis

package jarvis;

import java.util.Random;

import cartago.*;
import objects.Noticia;
import objects.RepositorioNoticias;

public class Internet extends Artifact {
	RepositorioNoticias noticias;
	
	void init() {
		noticias = new RepositorioNoticias();
	}
	
	@OPERATION
	void buscar_noticias(){
		execInternalOp("monitorar_noticias");
	}
	
	@INTERNAL_OPERATION
	void monitorar_noticias(){
//		while(true) {
			Random tempo = new Random();
			int contadorTempo = tempo.nextInt(15000) + 1000;
			await_time(contadorTempo);
			Noticia noticia = noticias.getNoticia();			
			signal("nova_noticia", noticia.getNoticia(), noticia.getLugar());
//		}
	}
	
	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}
}

