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
    return RedirectToAction("Jugar");
}

public IActionResult Jugar(){
    ViewBag.username=Juego.username;
    if(Juego.ObtenerProximaPregunta()==null){
        return RedirectToAction("fin");
    }else{
        ViewBag.pregunta=Juego.ObtenerProximaPregunta();
        ViewBag.respuestas=Juego.ObtenerProximasRespuestas(ViewBag.pregunta.idPregunta);
    }
    return View();
} 

[HttpPost] public IActionResult VerificarRespuesta(Respuesta respuestaA){
    ViewBag.respuesta=Juego.VerificarRespuesta(respuestaA);
    return RedirectToAction("Jugar");
}

public IActionResult avanzarPregunta(){
      Juego.avanzar();
        return RedirectToAction("Jugar");
}
public IActionResult fin(){
    ViewBag.info=Juego.puntajeActual;
    return RedirectToAction("Jugar");
}
}
