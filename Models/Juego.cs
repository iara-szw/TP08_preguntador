using Newtonsoft.Json;
 public class Juego{
     public  string username;
    public int puntajeActual;
   [JsonProperty]  private int ContadorNroPreguntaActual;
   [JsonProperty]  private Pregunta PreguntaActual;
  [JsonProperty]  private List<Pregunta> ListaPreguntas;
  [JsonProperty] private List<Respuesta> ListaRespuestas;
    [JsonProperty] private int multiplicador;

     private void InicializarJuego(){
        username="";
        puntajeActual=0;
        ContadorNroPreguntaActual=0;
        PreguntaActual=new Pregunta();
        ListaPreguntas=new List<Pregunta>();
        ListaRespuestas=new List<Respuesta>();
    }

     public List<Categoria> ObtenerCategorias(){
        return BD.levantarCategorias();
    }
       public List<Dificultad> ObtenerDificultades(){
        return BD.levantarDificultades();
    }

     public void CargarPartida(string Username, int dificultad, int categoria){
        InicializarJuego();
        username=Username;
        ListaPreguntas=BD.levantarPreguntas(dificultad, categoria);
        multiplicador=BD.levantarDificultades()[IdDificultad==dificultad].multiplicador;

    }
     public Pregunta ObtenerProximaPregunta(){
        if(ContadorNroPreguntaActual>=ListaPreguntas.Count()){
            PreguntaActual=null;
            
        }else{
        PreguntaActual=ListaPreguntas[ContadorNroPreguntaActual];

        }
        return PreguntaActual;
    }
     public List<Respuesta> ObtenerProximasRespuestas(int idPregunta){
        ListaRespuestas=BD.ObtenerRespuestas(idPregunta);
        return ListaRespuestas;
    }
     public int ObtenerCorrecta(){

        foreach(Respuesta res in ListaRespuestas){
            if (res.correcta==true){
                return res.Opcion;
            }
        }
        return ListaRespuestas[0].idRespuesta;
    }

     public bool VerificarRespuesta(int respuesta){
        bool esCorrecta=(respuesta==ObtenerCorrecta());
        if(esCorrecta){
          puntajeActual=puntajeActual+100*multiplicador;
        } 
        ContadorNroPreguntaActual++;
        return esCorrecta;
    }

}

