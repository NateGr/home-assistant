# VS Code Copilot Conversation Context

## Overview
This file maintains context between VS Code sessions to preserve conversation history and project state when the workspace is reloaded.

**Last Updated:** August 31, 2025
**Session Complete:** Debugging Setup Complete - Ready for Chore Scheduling Investigation

## Current Workspace Structure
- **Primary Repository:** `/workspaces/home-assistant` - Home Assistant Core
- **Secondary Repository:** `/workspaces/ha-chore-helper-ex` - Custom Chore Helper Integration

## Active Projects & Goals

### Project 1: Setup Debugging Environment ✅ COMPLETED
- **Objective:** Configure VS Code debugging for both HASS core and ha-chore-helper-ex integration
- **Status:** Full debugging environment configured and operational
- **Completed Steps:**
  1. ✅ Configure launch.json for debugging
  2. ✅ Set up custom component debugging
  3. ✅ Test breakpoints in both codebases
  4. ✅ Resolve Python version alignment
  5. ✅ Resolve Python interpreter mismatch in debugger
  6. ✅ Environment fully operational for debugging

### Project 2: Debug Chore Scheduling Logic 🔄 READY TO START
- **Objective:** Investigate how chores calculate their next due dates and scheduling
- **Status:** Key breakpoint locations identified, ready for debugging session
- **Next Steps:**
  1. Set breakpoints in chore.py scheduling methods
  2. Debug chore creation and scheduling logic
  3. Analyze next due date calculation algorithms
  4. Investigate any scheduling issues

## Technical Context

### Home Assistant Development Environment
- Working with Home Assistant Core repository in development container (Debian GNU/Linux 12)
- Available tools: git, gh, pytest, ruff, pylint, etc.
- Python environment: `/home/vscode/.local/ha-venv/bin/python` (Python 3.13.7)
- **Multi-workspace setup:** Both HASS core and ha-chore-helper-ex accessible
- **Custom component integration:** Symbolic link for seamless development debugging
- **Debug logging enabled:** Enhanced logging for chore_helper integration

### Key Decisions Made

1. **Context file creation** - Maintain conversation continuity across VS Code sessions
2. **Symbolic link approach** - Link `/workspaces/home-assistant/config/custom_components/chore_helper` to actual code for seamless debugging
3. **Enhanced launch.json configuration** - Added "Home Assistant (with Custom Components)" config with PYTHONPATH for dual-repo debugging
4. **Python environment alignment** - Fixed VS Code Python interpreter conflicts using unified ha-venv
5. **Explicit Python interpreter in launch.json** - Resolve ModuleNotFoundError during debugging

## Knowledge Base Articles

### 🔧 KB001: VS Code Debugger Python Interpreter Mismatch

**Problem:** `ModuleNotFoundError` when debugging Home Assistant, even though packages are installed and command-line execution works fine.

**Root Cause:** VS Code debugger uses a different Python interpreter than the workspace-configured one.

**Solution:** Add explicit `"python"` field to debug configurations in `.vscode/launch.json`:

```json
{
  "name": "Home Assistant (with Custom Components)",
  "type": "debugpy",
  "request": "launch",
  "module": "homeassistant",
  "python": "/home/vscode/.local/ha-venv/bin/python",
  "args": ["--debug", "-c", "config"]
}
```

**Key Points:**
- `.vscode/settings.json` controls editor features
- `.vscode/launch.json` controls debugger Python interpreter
- Always specify explicit Python path in launch configurations

## Current Issues & Blockers

### ✅ RESOLVED: Python Version Mismatch
- **Issue:** VS Code showing wrong Python version for ha-chore-helper-ex repository
- **Resolution:** Updated .vscode/settings.json to use unified ha-venv Python interpreter
- **Date Resolved:** August 31, 2025

### ✅ RESOLVED: VS Code Debugger ModuleNotFoundError
- **Issue:** `ModuleNotFoundError: No module named 'awesomeversion'` during debugging
- **Resolution:** Added explicit Python interpreter path to launch.json debug configuration
- **KB Reference:** KB001 - VS Code Debugger Python Interpreter Mismatch
- **Date Resolved:** August 31, 2025

## Files Modified/Created This Session

### Debugging Setup Complete
- Created: `/workspaces/home-assistant/context.md`
- Created symbolic link: `/workspaces/home-assistant/config/custom_components/chore_helper`
- Enhanced launch.json with custom component debugging support
- Added debug logging for chore_helper integration

### Python Environment Aligned
- Fixed ha-chore-helper-ex .vscode/settings.json Python interpreter path
- Updated code formatter to use charliermarsh.ruff (HA compatible)
- Unified workspace to use `/home/vscode/.local/ha-venv/bin/python`
- Verified Home Assistant importable from both repositories

### Debugger Configuration Fixed
- Added explicit `"python"` field to launch.json debug configurations
- Resolved ModuleNotFoundError during debugging sessions
- Created KB001 article for future reference

## 🎯 KEY BREAKPOINT LOCATIONS FOR NEXT SESSION

### Chore Scheduling Investigation - Primary Breakpoints:

1. **Line 463**: `def update_state(self):` - **MOST IMPORTANT**
   - Main method that calculates and sets next due date
   - Updates chore state (days until due) and icons
   - Called whenever chore needs to recalculate schedule

2. **Line 424**: `def get_next_due_date(self, start_date: date, ignore_today=False):`
   - Searches through `self._due_dates` to find next valid due date
   - Handles "today" logic and expiration times

3. **Line 442**: `async def async_update(self):`
   - Triggers the whole update cycle
   - Calls `_async_load_due_dates()` and `update_state()`

### Key Variables to Watch:
- `self._due_dates` - List of all calculated due dates
- `self._next_due_date` - The next scheduled due date
- `self._days` - Days until next due date
- `self.last_completed` - When chore was last completed
- `self._start_date` - Start date for calculations

### Alternative: Config Flow Breakpoints
- Line 273: `class ChoreHelperConfigFlowHandler` - Entry point
- Line 121: `async def general_config_schema` - User form generation
- Line 23: `async def _validate_config` - Input validation
- Line 266: `CONFIG_FLOW` dictionary - Flow configuration

## Useful Commands for Next Session

```bash
# Start Home Assistant with debugging
python -m homeassistant -c config --debug

# Follow logs in real-time
tail -f config/home-assistant.log

# Run integration tests
pytest ./tests/components/chore_helper --cov=custom_components.chore_helper --cov-report term-missing

# Reset config entries (development only)
rm -rf config/.storage/core.config_entries

# Run all linters
pre-commit run --all-files

# Test changed files only
pytest --timeout=10 --picked

# Validate project structure
python -m script.hassfest

# Compile translations
python -m script.translations develop --all
```

## Notes for Next Session

### Environment Ready
- **Launch Configuration:** Use "Home Assistant (with Custom Components)" for debugging
- **Symbolic Link:** Custom component accessible at `/workspaces/home-assistant/config/custom_components/chore_helper`
- **Logging:** Debug logs enabled for `custom_components.chore_helper`
- **Python:** Unified environment using ha-venv interpreter

### Ready for Chore Scheduling Investigation
- All breakpoint locations identified and documented
- Focus on `update_state()` method at line 463 as primary investigation point
- Can debug both HASS core and custom component simultaneously
- Environment fully tested and operational

### Code Patterns & Standards
- Following Home Assistant Integration Quality Scale guidelines
- Using Home Assistant development best practices from copilot-instructions.md
- Async programming patterns with proper error handling
- Entity lifecycle management and state updates

---

## Session Summary - August 31, 2025

**Accomplished:**
✅ Complete debugging environment setup for dual-repository development
✅ Python environment alignment across both workspaces
✅ Resolution of VS Code debugger Python interpreter conflicts
✅ Identification of key breakpoint locations for chore scheduling investigation
✅ Creation of comprehensive context system for session continuity
✅ KB article documentation for common debugging issues

**Ready for Next Session:**
🎯 Chore scheduling logic investigation with identified breakpoints
🎯 Real-time debugging of chore state updates and due date calculations
🎯 Analysis of scheduling algorithms and potential issues

The development environment is fully operational and ready for productive debugging sessions.

---

*Instructions: Update this file at the end of each session with progress, decisions, and next steps. Reference it at the start of new sessions to restore context.*
