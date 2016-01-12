// CArtAgO artifact code for project jarvis

package jarvis;

import java.util.Random;
import objects.*;

import cartago.*;
import objects.Noticia;
import objects.RepositorioNoticias;

public class Internet extends Artifact {
	RepositorioNoticias noticias;
	RepositorioReunioes reunioes;
	
	void init() {
		noticias = new RepositorioNoticias();
		reunioes = new RepositorioReunioes();
	}
	
	@OPERATION
	void buscar_noticias(){
		execInternalOp("monitorar_noticias");
		execInternalOp("novaReuniao");
	}
	
	@INTERNAL_OPERATION
	void novaReuniao() {
		while(reunioes.getQTDReuniao() > 0) {
			Random tempo = new Random();
			await_time(tempo.nextInt(20000) + 1000);
			Reuniao reuniao = reunioes.getReuniao();
			signal("reuniao", reuniao.getHorario(), reuniao.getPessoa());
			reunioes.removeReuniao(reuniao);
		}
	}
	
	@INTERNAL_OPERATION
	void monitorar_noticias(){
		while(noticias.getQTDNoticia() > 0) {
			Random tempo = new Random();
			int contadorTempo = tempo.nextInt(20000) + 1000;
			await_time(contadorTempo);
			Noticia noticia = noticias.getNoticia();			
			signal("nova_noticia", noticia.getNoticia(), noticia.getLugar());
			noticias.removeNoticia(noticia);
		}
	}
	
	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}
}

