static class Juego{
    static private string username;
   static private int puntajeActual;
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

    static List<Categoria> ObtenerCategorias(){
        return BD.levantarCategorias();
    }
      static List<Dificultad> ObtenerDificultades(){
        return BD.levantarDificultades();
    }

    static void CargarPartida(string Username, int dificultad, int categoria){
        InicializarJuego();
        username=Username;
        ListaPreguntas=BD.levantarPreguntas(dificultad, categoria);
    }
    static Pregunta ObtenerProximaPregunta(){
        if(ContadorNroPreguntaActual>=ListaPreguntas.length()){
            PreguntaActual=null;
        }else{
        PreguntaActual=ListaPreguntas[ContadorNroPreguntaActual];

        }
        return PreguntaActual;
    }
    static List<Respuesta> ObtenerProximasRespuestas(int idPregunta){
        ListaRespuestas=BD.ObtenerRespuestas(idPregunta);
        return ListaRespuestas;
    }
    static private int ObtenerCorrecta(){
        foreach(ListaRespuestas){
            if (ListadoRespuestas.correcta==true){
                return ListadoRespuestas[i];
            }
        }
    }
    static bool VerificarRespuesta(int idrespuesta){
        bool eraCorrecta=false;
        if(ObtenerCorrecta().idRespuesta==idrespuesta){
            eraCorrecta=true;
            CantidadPreguntasCorrectas++;
            puntajeActual=puntajeActual+100;
        }
        ContadorNroPreguntaActual++;
        PreguntaActual=ListaPreguntas[ContadorNroPreguntaActual];
        return eraCorrecta
    }

