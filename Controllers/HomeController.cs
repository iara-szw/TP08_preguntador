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
    Juego jueguito=Objeto.StringToobject<Juego>(HttpContext.Session.GetString("JuegoActual"));
    if (jueguito == null || jueguito.terminado!=false){ 
        Juego juegoo= new Juego();
        ViewBag.cate=juegoo.ObtenerCategorias();
        ViewBag.dif=juegoo.ObtenerDificultades();
        return View();
       
    }else{
        return RedirectToAction("Jugar");

    }

}

public IActionResult Comenzar(string username, int dificultad, int categoria){
    Juego juego = new Juego();
    juego.CargarPartida(username,dificultad,categoria);    
    if(HttpContext.Session.GetString("JuegoActual")!= null){
        return RedirectToAction("Jugar");
    }
    HttpContext.Session.SetString("JuegoActual", Objeto.ObjectToString(juego));
   
    return RedirectToAction("Jugar");
}

public IActionResult Jugar(){
    Juego jueguito=Objeto.StringToobject<Juego>(HttpContext.Session.GetString("JuegoActual"));
    if (jueguito==null){
        return RedirectToAction("ConfigurarJuego");
    }
    ViewBag.username=jueguito.username;
    if(jueguito.ObtenerProximaPregunta()==null){
        return RedirectToAction("fin");
    }else{
        ViewBag.pregunta=jueguito.ObtenerProximaPregunta();
        ViewBag.respuestas=jueguito.ObtenerProximasRespuestas(ViewBag.pregunta.idPregunta);
    }
    HttpContext.Session.SetString("JuegoActual", Objeto.ObjectToString(jueguito));
    return View();
} 

[HttpPost] public IActionResult VerificarRespuesta(int respuesta){
    Juego jueguito=Objeto.StringToobject<Juego>(HttpContext.Session.GetString("JuegoActual"));
      if (jueguito is null){
        return RedirectToAction("ConfigurarJuego");
    }
    ViewBag.respuesta=jueguito.VerificarRespuesta(respuesta);
    HttpContext.Session.SetString("JuegoActual", Objeto.ObjectToString(jueguito));

    return RedirectToAction("Jugar");
}

public IActionResult fin(){
    Juego jueguito=Objeto.StringToobject<Juego>(HttpContext.Session.GetString("JuegoActual"));
      if (jueguito is null){
        return RedirectToAction("ConfigurarJuego");
    }
      if(jueguito.ObtenerProximaPregunta()!=null){
        return RedirectToAction("Jugar");
      }
    ViewBag.info=jueguito.puntajeActual;
    ViewBag.username=jueguito.username;
    ViewBag.top= BD.agregarTop(jueguito.puntajeActual,ViewBag.username);
    jueguito.terminado=true;
    HttpContext.Session.SetString("JuegoActual", Objeto.ObjectToString(jueguito));

    return View();
}

public IActionResult records(){
    ViewBag.lista=BD.levantarRecord();
    return View();
}
}
