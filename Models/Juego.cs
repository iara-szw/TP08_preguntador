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

}


// ObtenerCategorias(): Retorna la lista de categorías.
// ObtenerDificultades(): Retorna la lista de dificultades.
// CargarPartida(string username, int dificultad, int categoria): Debe llamar al método InicializarJuego. Además recibe la dificultad y categoría elegidas e invoca al método ObtenerPreguntas de BD.
// ObtenerProximaPregunta(): Retorna la siguiente pregunta de la lista de preguntas del juego.
// ObtenerProximasRespuestas(int idPregunta): Retorna la lista con todas las respuestas relacionadas al id de pregunta enviado por parámetro.
// VerificarRespuesta(int idRespuesta): Recibe un id de respuesta y retorna un booleano indicando si la respuesta fue correcta o incorrecta verificando en el ListadoRespuestas. Previo a devolver el booleano realiza dos acciones:
// Si la respuesta del usuario fue correcta, suma una cantidad específica de puntos a PuntajeActual (la definen ustedes) y suma 1 respuesta correcta en CantidadPreguntasCorrectas.
// Independientemente de que este bien o mal la respuesta, Incrementa el contador de ContadorNroPreguntaActual y asigna la siguiente pregunta de la ListaPreguntas a PreguntaActual.