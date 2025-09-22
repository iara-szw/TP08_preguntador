public class Categoria{
    public int idCategoria{get;set;}
    string nombre{get;set;}
    public string fotoCategoria{get;set;}

    public string devolverNombre(){
        return nombre;
    }
}