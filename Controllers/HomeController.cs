using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP08_PreguntadOrt.Models;

namespace TP08_PreguntadOrt.Controllers;

public class HomeController : Controller
{
    public IActionResult Index(){
        return View();
    }

public IActionResult ConfigurarJuego(){
    ViewBag.cate=Juego.ObtenerCategorias();
        ViewBag.dif=Juego.ObtenerDificultades();
        return View();

}

public IActionResult Comenzar(string username, int dificultad, int categoria){
    Juego.CargarPartida(username,dificultad,categoria);
    return RedirectToAction("Jugar",null);
}

public IActionResult Jugar(int correcta){
    ViewBag.username=Juego.username;
    ViewBag.correcta=correcta.idRespuesta;
    if(Juego.ObtenerProximaPregunta()==null){
        return RedirectToAction("fin");
    }else{
        ViewBag.pregunta=Juego.ObtenerProximaPregunta();
        ViewBag.respuestas=Juego.ObtenerProximasRespuestas(ViewBag.pregunta.idPregunta);
    }
    return View();
} 

[HttpPost] public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta){
    ViewBag.respuesta=Juego.VerificarRespuesta(idRespuesta);
    ViewBag.correcta=Juego.ObtenerCorrecta();
    return RedirectToAction("Jugar",ViewBag.correcta);
}

public IActionResult avanzarPregunta(){
        Juego.ContadorNroPreguntaActual++;
        Juego.PreguntaActual=Juego.ListaPreguntas[ContadorNroPreguntaActual];
        return RedirectToAction("Jugar",null);
}
public IActionResult fin(){
    ViewBag.info=Juego.puntajeActual;
    return RedirectToAction("Jugar");
}
}
