// CArtAgO artifact code for project jarvis

package jarvis;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Random;

import cartago.*;

public class Relogio extends Artifact {
	
	final static long TICK_TIME = 1000;
	long contadorTempo;
	boolean ligado;
	
	void init(int initialValue) {
		
	}
	
	@OPERATION
	void startRelogio() {
		ligado = true;		
		execInternalOp("countRelogio");
		execInternalOp("segundos");
	}
	
	@OPERATION
	void stopRelogio() {
		ligado = false;
	}
	
	@INTERNAL_OPERATION
	void countRelogio() {
		if(ligado) {
			Random tempo = new Random();
			contadorTempo = tempo.nextInt(55000) + 5000;
			await_time(contadorTempo);
			signal("reuniao");
		}
	}
	
	@OPERATION
	void protecaoNoturna() {
		Calendar hora = new GregorianCalendar();
		if(hora.get(Calendar.HOUR_OF_DAY) >= 18) {
			signal("dobrar_seguranca"); 
		} else if(hora.get(Calendar.HOUR_OF_DAY) >= 6) {
			signal("desativar_seguranca_noturna");
		}
	}
	
	@INTERNAL_OPERATION
	void segundos() {
		while(ligado) {
			signal("tic");
			await_time(TICK_TIME);
		}
	}
	
	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}
}