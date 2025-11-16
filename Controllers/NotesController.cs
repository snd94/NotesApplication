using Microsoft.AspNetCore.Mvc;
using Notes.Application.Dto;
using Notes.Application.Interfaces;
using Notes.Domain;
using NotesApplication.Models;

namespace NotesApplication.Controllers;

/// <summary>
/// Notes controller for note related operations
/// </summary>
public class NotesController : Controller
{
    private readonly ILogger<NotesController> _logger;
    private readonly INotesService _notesService;

    public NotesController(ILogger<NotesController> logger, INotesService notesService)
    {
        _logger = logger;
        _notesService = notesService;
    }

    [ActionName("Index")]
    public async Task<IActionResult> ListNotes()
    {
        var notes = await _notesService.GetAllNotes();
        return View("ListNotes", notes);
    }

    [HttpGet]
    public async Task<IActionResult> Create()
    {
        return View(new CreateNoteDto());
    }

    [HttpPost]
    public async Task<IActionResult> Create(NoteViewModel model)
    {
        if (!ModelState.IsValid)
            return View(model);

        var dto = new CreateNoteDto
        {
            Title = model.Title,
            Content = model.Content,
            Priority = (PriorityLevel)model.Priority
        };

        var note = await _notesService.CreateNote(dto);
        return RedirectToAction("Details", new { id = note.Id });
    }

    [HttpGet]
    public async Task<IActionResult> Details(int id)
    {
        var note = await _notesService.GetNoteById(id);
        return View(note);
    }

    [ActionName("Delete")]
    public async Task<IActionResult> Delete(int id)
    {
        await _notesService.DeleteNote(id);
        return RedirectToAction("Index");
    }

    public async Task<IActionResult> Edit(int id)
    {
        var note = await _notesService.GetNoteById(id);
        if (note == null)
        {
            return NotFound();
        }
        return View(note);
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(int id, CreateNoteDto note)
    {
        if (ModelState.IsValid)
        {
            await _notesService.UpdateNote(id, note);
            return RedirectToAction("Index"); // back to list
        }
        return View(note);
    }
}
