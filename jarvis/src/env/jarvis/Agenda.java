// CArtAgO artifact code for project jarvis

package jarvis;

import java.util.ArrayList;
import java.util.List;
import cartago.*;
import objects.*;

public class Agenda extends Artifact {
	List<Reuniao> reunioesMarcadas;
	
	void init() {
		reunioesMarcadas = new ArrayList<Reuniao>();
	}
	
	@OPERATION
	void marcar_reuniao_agenda(int horario, String pessoa) {
		Reuniao r = new Reuniao(horario, pessoa);
		reunioesMarcadas.add(r);
	}
	
	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}
}

