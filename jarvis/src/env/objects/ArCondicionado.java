package objects;

import cartago.*;

public class ArCondicionado extends Artifact {

	private int status = 0;
	private Double temperatura;

	void init(int status) {
		this.status = status;
	}
	
	@OPERATION
	public void definirTemperatura(double temperatura, OpFeedbackParam<String> temp) {
		if(status == 1){
			this.temperatura = temperatura;
			temp.set(this.temperatura.toString());
		}
	}
}

