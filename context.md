
# VS Code Home Assistant Custom Component Debugging Environment

## Overview
This workspace is configured for debugging Home Assistant custom components. The environment is now clean and ready for any new custom component.

**Last Updated:** October 8, 2025
**Current Status:** Debugging ha-chore-tracker custom component with BMAD Framework

**⚠️ IMPORTANT - Development Guidelines:**
- **READ ONLY:** `/workspaces/home-assistant/` - For debugging and testing only (DO NOT MODIFY)
- **ACTIVE PROJECTS:** Check `/workspaces/` for other project folders
- **ALWAYS ASK:** Which project to work on if multiple projects exist
- **CURRENT PROJECT:** `/workspaces/ha-chore-tracker/` (confirm with user before assuming)

## Current Environment Setup

### ✅ Workspace Configuration
- **Repository:** `/workspaces/home-assistant` - Home Assistant Core (Debugging branch)
- **Secondary Repository:** `/workspaces/ha-chore-tracker` - Chore Tracker Custom Component (dev branch)
- **Python Environment:** `/home/vscode/.local/ha-venv/bin/python` (Python 3.13+)
- **Launch Configuration:** "Home Assistant (with Custom Components)" ready
- **Custom Components Directory:** `/workspaces/home-assistant/config/custom_components/`
- **Active Component:** `chore_tracker` (symbolic link configured)
- **BMAD Framework:** ✅ Enabled with multiple AI agent personas

### ✅ Debug Configuration
```json
{
  "name": "Home Assistant (with Custom Components)",
  "type": "debugpy",
  "request": "launch",
  "module": "homeassistant",
  "python": "/home/vscode/.local/ha-venv/bin/python",
  "args": ["--debug", "-c", "config"],
  "env": {
    "PYTHONPATH": "${workspaceFolder}/config/custom_components:${env:PYTHONPATH}"
  }
}
```

## BMAD Framework Integration

### ✅ Available AI Agent Personas
The workspace now includes the **BMAD (Business Methodology & Agent Development)** framework with specialized AI agent personas:

- **🧙 bmad-master** - Master Task Executor & BMad Method Expert
- **🔧 dev** - Full Stack Developer for implementation and debugging
- **🏗️ architect** - Technical Architecture and System Design
- **📋 pm** - Project Manager for planning and coordination
- **📊 analyst** - Business Analyst for requirements and analysis
- **🧪 qa** - Quality Assurance for testing and validation
- **👥 po** - Product Owner for feature definition
- **📈 sm** - Scrum Master for process management
- **🎨 ux-expert** - User Experience and Interface Design
- **🎺 bmad-orchestrator** - Multi-agent coordination and workflow management

### How to Use BMAD Agents
1. **Activate Agent:** Type `@<agent-name>` in chat (e.g., `@dev`, `@architect`)
2. **Get Help:** Each agent responds to `*help` command to show capabilities
3. **Access Resources:** Agents can load project docs, templates, and workflows from `.bmad-core/`

### BMAD Project Resources
- **Configuration:** `.bmad-core/core-config.yaml`
- **Project Docs:** Links to ha-chore-tracker PRD, Architecture, and specifications
- **Templates & Tasks:** Available in `.bmad-core/templates/` and `.bmad-core/tasks/`
- **Debug Logging:** `.ai/debug-log.md`

## 🔍 Project Discovery Protocol

### For Future Sessions:
1. **Check Available Projects:** List contents of `/workspaces/` directory
2. **Ask User:** Which project to work on if multiple options exist
3. **Confirm Context:** Verify project scope and current development phase
4. **Set Working Directory:** Based on user's confirmed project choice

### Last Known Active Project: ha-chore-tracker
- **Domain:** `chore_tracker`
- **Version:** `0.1.0` (Epic 1 Complete - Integration Foundation)
- **Source Code:** `/workspaces/ha-chore-tracker/custom_components/chore_tracker/`
- **Debug Environment:** `/workspaces/home-assistant/config/custom_components/chore_tracker` (symbolic link)
- **Status:** Epic 2 development phase (Service Handler Implementation)

### 🚧 General Development Workflow (Any Project)
1. **Identify Project:** Confirm which project in `/workspaces/` to work on
2. **Code Changes:** Make ALL modifications in the PROJECT directory (never in home-assistant)
3. **Testing:** Use Home Assistant environment for debugging only (if HASS component)
4. **Version Control:** Git operations in the active project repository only

### Key Files for Debugging:
- `__init__.py` - Component initialization and setup
- `config_flow.py` - Configuration flow for adding/configuring the component
- `sensor.py` - Sensor platform implementation
- `const.py` - Constants and configuration
- `manifest.json` - Component metadata

### 📍 Key Files for Development (ALL in `/workspaces/ha-chore-tracker/`):
- `custom_components/chore_tracker/__init__.py` - Component setup, ChoreCoordinator
- `custom_components/chore_tracker/config_flow.py` - User configuration flow
- `custom_components/chore_tracker/sensor.py` - ChoreEntity implementation
- `custom_components/chore_tracker/const.py` - Constants and service definitions
- `custom_components/chore_tracker/services.yaml` - Service schemas
- `custom_components/chore_tracker/strings.json` - UI translations

### Recommended Breakpoint Locations:
1. **Config Flow:** `config_flow.py` - `async_step_user()` method
2. **Component Setup:** `__init__.py` - `async_setup_entry()` method
3. **Sensor Setup:** `sensor.py` - `async_setup_entry()` method
4. **Entity Init:** Sensor entity `__init__()` methods
5. **State Updates:** Sensor entity `async_update()` methods

### 🎯 Last Known Development Target:
**Epic 2: Chore Lifecycle Management** (ha-chore-tracker project)
- Service Handler Implementation
- Recurrence Engine Development
- Completion Logic & State Transitions
- Data Persistence Layer

## Instructions for Future AI Sessions

### 📋 Session Startup Checklist:
1. **Discover Projects:** Run `ls -la /workspaces/` to see available projects
2. **Ask User:** "I see multiple projects. Which one would you like to work on?"
3. **Confirm Status:** Review project-specific context (if available)
4. **Set Focus:** Establish working directory and development scope
5. **Load Resources:** Access relevant BMAD agents and project documentation

### 🤖 BMAD Agent Usage:
- Agents are configured for multi-project support
- Always confirm project scope before agent activation
- Use project-specific context files when available

## How to Add a New Custom Component

### Step 1: Add Component to Workspace
1. Place your custom component folder in `/workspaces/home-assistant/config/custom_components/`
2. Or create a symbolic link: `ln -s /path/to/your/component /workspaces/home-assistant/config/custom_components/your_component`

### Step 2: Enable Debug Logging
Add to `config/configuration.yaml`:
```yaml
logger:
  logs:
    custom_components.your_component_name: debug
```

### Step 3: Common Breakpoint Locations
For any custom component, typical debugging locations:

#### Config Flow Debugging:
- `config_flow.py` - `async_step_user()` method
- `config_flow.py` - Form validation functions
- `config_flow.py` - `async_create_entry()` calls

#### Component Initialization:
- `__init__.py` - `async_setup_entry()` method
- `__init__.py` - `async_unload_entry()` method
- Platform files (`sensor.py`, `switch.py`, etc.) - `async_setup_entry()` methods

#### Entity Lifecycle:
- Entity classes - `__init__()` method
- Entity classes - `async_added_to_hass()` method
- Entity classes - `async_update()` method
- Entity classes - Property getters (`state`, `attributes`, etc.)

#### Service Handlers:
- Service registration in `__init__.py`
- Service handler functions

### Step 4: Start Debugging
1. Use "Home Assistant (with Custom Components)" launch configuration
2. Set breakpoints in your component code
3. Access your component through Home Assistant UI to trigger breakpoints

## Useful Debugging Commands

```bash
# Start Home Assistant with debugging
python -m homeassistant -c config --debug

# Follow logs in real-time
tail -f config/home-assistant.log

# Reset config entries (development only)
rm -rf config/.storage/core.config_entries

# Restart Home Assistant (if running)
# Use Ctrl+C in debug console, then restart

# Check custom component loading
grep -r "your_component" config/home-assistant.log
```
