using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP08_PreguntadOrt.Models;

namespace TP08_PreguntadOrt.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }
}
