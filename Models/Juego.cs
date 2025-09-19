static public class Juego{
    static public  string username;
   static public int puntajeActual;
   static private int CantidadPreguntasCorrectas;
   static private int ContadorNroPreguntaActual;
  static private Pregunta PreguntaActual;
  static private List<Pregunta> ListaPreguntas;
  static private List<Respuesta> ListaRespuestas;

    static private void InicializarJuego(){
        username="";
        puntajeActual=0;
        CantidadPreguntasCorrectas=0;
        ContadorNroPreguntaActual=0;
        PreguntaActual=new Pregunta();
        ListaPreguntas=new List<Pregunta>();
        ListaRespuestas=new List<Respuesta>();
    }

    static public List<Categoria> ObtenerCategorias(){
        return BD.levantarCategorias();
    }
      static public List<Dificultad> ObtenerDificultades(){
        return BD.levantarDificultades();
    }

    static public void CargarPartida(string Username, int dificultad, int categoria){
        InicializarJuego();
        username=Username;
        ListaPreguntas=BD.levantarPreguntas(dificultad, categoria);
    }
    static public Pregunta ObtenerProximaPregunta(){
        if(ContadorNroPreguntaActual>=ListaPreguntas.Count()){
            PreguntaActual=null;
        }else{
        PreguntaActual=ListaPreguntas[ContadorNroPreguntaActual];

        }
        return PreguntaActual;
    }
    static public List<Respuesta> ObtenerProximasRespuestas(int idPregunta){
        ListaRespuestas=BD.ObtenerRespuestas(idPregunta);
        return ListaRespuestas;
    }
    static public Respuesta ObtenerCorrecta(){

        foreach(Respuesta res in ListaRespuestas){
            if (res.correcta==true){
                return res;
            }
        }
        return ListaRespuestas[0];
    }
    static public bool VerificarRespuesta(int idrespuesta){
        bool eraCorrecta=false;
        if(ObtenerCorrecta().idRespuesta==idrespuesta){
            eraCorrecta=true;
            CantidadPreguntasCorrectas++;
            puntajeActual=puntajeActual+100;
        }
        ContadorNroPreguntaActual++;
        PreguntaActual=ListaPreguntas[ContadorNroPreguntaActual];
        return eraCorrecta;
    }
}

