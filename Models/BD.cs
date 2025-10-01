using Microsoft.Data.SqlClient;
using Dapper;
static class BD{
 
    public static string connectionString = @"Server=localhost; DataBase=PreguntadOrt; Integrated Security=True; TrustServerCertificate=True;";

        public static List<Categoria> levantarCategorias(){
        
        List<Categoria> Cate=new List<Categoria>(); 
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query="SELECT * FROM Categorias";
            Cate=connection.Query<Categoria>(query, new{}).ToList();
        }
        return Cate;
    }
        public static List<Dificultad> levantarDificultades(){
        
        List<Dificultad> Dif=new List<Dificultad>(); 
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query="SELECT * FROM Dificultades";
            Dif=connection.Query<Dificultad>(query, new{}).ToList();
        }
        return Dif;
    }

     public static List<Pregunta> levantarPreguntas(int idDif, int idCate){
        List<Pregunta> preg=new List<Pregunta>(); 
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query="EXEC levantarPreguntitas @pIdDif,@pIdCate";
            preg=connection.Query<Pregunta>(query, new{pIdDif=idDif, pIdCate=idCate}).ToList();
        }
        return preg;
    }

         public static List<Respuesta> ObtenerRespuestas(int idPregunta){
        
        List<Respuesta> res=new List<Respuesta>(); 
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query="SELECT * FROM Respuestas WHERE idPregunta=@pIdPreg";
            res=connection.Query<Respuesta>(query, new{pIdPreg=idPregunta}).ToList();
        }
        return res;
    }

    public static bool agregarTop(int puntajeActual, string Username){
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query="EXEC agregarTop @puntaje, @username";
            res=connection.QueryFirstOrDefault<bool>(query, new{puntaje=puntajeActual, username=Username});
        }
        return res;

    }
     public static List<Record> levantarRecord(){
        
        List<Record> Rec=new List<Record>(); 
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query="EXEC levantarRecords";
            Rec=connection.Query<Record>(query, new{}).ToList();
        }
        return Rec;

}