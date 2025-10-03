public class Categoria{
    public int idCategoria{get;set;}
    public string nombre{get;set;}
    public string fotoCategoria{get;set;}

    public string devolverNombre(){
        return nombre;
    }
}