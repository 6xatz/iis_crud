# Fii's Book

A simple ASP.NET Web Forms (ASPX) app styled with a minimal dark theme. It manages Books and Members with full CRUD, has a login screen, and a dashboard summary.

## Features
- Login page (Users table)
- Dashboard summary (Total Members, Total Books)
- Books CRUD
  - List with async delete (no full reload)
  - Add/Edit in-place (async) with status messages
- Members CRUD
  - List with async delete
  - Add/Edit in-place (async)
- Master layout with sidebar navigation
- Minimal, consistent dark theme (embedded CSS in `Site.master`)

## Tech Stack
- ASP.NET Web Forms (C#), .NET Framework 4.x
- SQL Server (Local/Express)
- ADO.NET (`System.Data.SqlClient`)
- ASP.NET UpdatePanel/ScriptManager for partial postbacks (AJAX)

## Getting Started
1. Database
   - Open SQL Server and run `6xatz.sql` to create tables: `Users`, `Products` (legacy), `Books`, `Members`.
   - Default login seeded in `Users`: Username `6xatz`, Password `0000` (change in DB).
2. Connection String
   - Check `web.config` and update `connectionStrings` → `dbConn` to match your SQL instance.
3. Run
   - Open the folder in Visual Studio or deploy to IIS.
   - Navigate to `login.aspx` → sign in → you’ll land on `dashboard.aspx`.

## Important Pages
- `Site.master`: master layout + embedded dark theme, header, sidebar
- `login.aspx` / `login.aspx.cs`: login form
- Dashboard
  - `dashboard.aspx` / `dashboard.aspx.cs`: summary counts
- Books
  - `books_list.aspx` / `books_list.aspx.cs`
  - `book_add.aspx` / `book_add.aspx.cs`
  - `book_edit.aspx` / `book_edit.aspx.cs`
  - `book_delete.aspx` / `book_delete.aspx.cs`
- Members
  - `members_list.aspx` / `members_list.aspx.cs`
  - `member_add.aspx` / `member_add.aspx.cs`
  - `member_edit.aspx` / `member_edit.aspx.cs`
  - `member_delete.aspx` / `member_delete.aspx.cs`

## Notes
- The theme is embedded (no external CSS). Modify tokens in `:root` within `Site.master` to tweak colors.
- Sidebar hides on `login.aspx` automatically; header keeps only the logo + title across pages.
- Books and Members tables are wrapped to avoid overflow on smaller screens (1280×720 friendly).

## Security & TODOs
- Passwords are stored as plain text for demo purposes. Replace with hashed passwords in production.
- Add server-side auth checks per page if you need access control.
- Consider migrating to MVC/Razor or a PHP stack if that suits your workflow.
