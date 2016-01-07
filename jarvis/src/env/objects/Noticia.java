package objects;

public class Noticia {
	private String noticia;
	private String lugar;
	
	public Noticia(String noticia, String lugar) {
		this.lugar = lugar;
		this.noticia = noticia;
	}

	public String getNoticia() {
		return noticia;
	}

	public String getLugar() {
		return lugar;
	}
	
	
	
}
