public class Categoria{
    int idCategoria{get;set;}
    string nombre{get;set;}
    string fotoCategoria{get;set;}

    public string devolverNombre(){
        return nombre;
    }
}