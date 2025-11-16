
# NotesApplication

A simple Razor Pages application for managing notes with priority levels. Built with ASP.NET Core (.NET 8) and C# 12.

## Features

- List all notes
- Create new notes with title, content, and priority
- View note details
- Edit existing notes
- Delete notes
- Priority levels: Low, Medium, High, Critical

## Technologies

- ASP.NET Core Razor Pages
- Entity Framework Core (if using a database)
- C# 12 (.NET 8)
- MVC pattern for controllers and views

## Getting Started

### Prerequisites

- [.NET 8 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- Visual Studio 2022 or later

### Setup

1. **Clone the repository:**
2. **Restore dependencies:**
3. **Build the project:**
4. **Run the application:**
5. ## Project Structure

- `Controllers/NotesController.cs` – Handles note operations.
- `Views/Notes/` – Razor views for listing, creating, editing, and viewing notes.
- `Models/NoteViewModel.cs` – View model for note creation/editing.
- `Notes.Application/` – Application layer (DTOs, services, interfaces).
- `Notes.DataAccess/` – Data access layer (repositories).
