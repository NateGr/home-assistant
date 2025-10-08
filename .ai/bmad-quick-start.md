# BMAD Framework Quick Start Guide

## Overview
The BMAD (Business Methodology & Agent Development) framework is now integrated into your Home Assistant development workspace. This provides access to specialized AI agent personas for different aspects of software development.

## ⚠️ CRITICAL - Development Directory
**ALL CODE CHANGES GO IN:** `/workspaces/ha-chore-tracker/`
**DEBUGGING ONLY:** `/workspaces/home-assistant/` (READ-ONLY)

When asking agents for code changes, they will work in the ha-chore-tracker directory.

## Available Agents

### Development & Technical
- **@dev** - Full Stack Developer
  - Code implementation, debugging, problem-solving
  - Use for: Writing code, fixing bugs, implementing features

- **@architect** - Technical Architect
  - System design, architecture decisions, technical planning
  - Use for: Architecture reviews, technical design, system planning

- **@qa** - Quality Assurance Engineer
  - Testing, validation, quality assurance
  - Use for: Test planning, bug validation, quality reviews

### Project Management
- **@pm** - Project Manager
  - Project planning, coordination, resource management
  - Use for: Project planning, timeline management, coordination

- **@po** - Product Owner
  - Feature definition, requirements, user stories
  - Use for: Feature planning, requirement analysis, user stories

- **@sm** - Scrum Master
  - Process management, team coordination, workflow optimization
  - Use for: Process improvement, workflow management

### Analysis & Design
- **@analyst** - Business Analyst
  - Requirements analysis, business logic, process analysis
  - Use for: Requirement gathering, business logic analysis

- **@ux-expert** - UX Expert
  - User experience, interface design, usability
  - Use for: UI/UX design, user experience optimization

### Master Agents
- **@bmad-master** - Master Task Executor
  - Universal executor, can handle any task type
  - Use for: General tasks, multi-domain work

- **@bmad-orchestrator** - Multi-Agent Coordinator
  - Coordinates multiple agents, complex workflows
  - Use for: Complex multi-step projects, agent coordination

## How to Use

### Basic Usage
1. **Activate an agent:** Type `@agent-name` in chat
   - Example: `@dev help me debug the config flow`
   - Example: `@architect review the entity design`

2. **Get agent help:** Each agent responds to `*help`
   - Example: `@dev *help` - Shows dev agent capabilities

3. **Access project resources:** Agents can load project documentation
   - Agents have access to ha-chore-tracker PRD, Architecture docs
   - Context includes Home Assistant development best practices

### Project Context
All agents are aware of:
- **ha-chore-tracker** project specifications and architecture (PRIMARY PROJECT)
- **Home Assistant** development environment and best practices
- **Current debugging setup** and configuration
- **Project goals** and requirements from PRD
- **Working Directory:** `/workspaces/ha-chore-tracker/` (where all code changes happen)
- **Debug Environment:** `/workspaces/home-assistant/` (testing only, no code changes)### Example Workflows

**For Development:**
```
@dev I need to implement the recurrence engine for chore scheduling
```

**For Architecture Review:**
```
@architect Please review the coordinator pattern implementation for the chore tracker
```

**For Testing:**
```
@qa Help me create test cases for the config flow
```

**For Project Planning:**
```
@pm What are the next priorities for the chore tracker development?
```

## Project Integration

The BMAD framework is configured with:
- **Project Documentation:** Links to ha-chore-tracker specs
- **Development Context:** Home Assistant best practices and patterns
- **Debug Environment:** Integration with current VS Code debugging setup
- **Resource Access:** Templates, tasks, and workflows in `.bmad-core/`

## Getting Started

**Recommended first steps:**
1. Try `@bmad-master *help` to see available capabilities
2. Use `@dev` for immediate development tasks
3. Use `@architect` for design decisions
4. Use `@pm` for project planning and prioritization

The agents will help coordinate your ha-chore-tracker development with proper Home Assistant integration patterns and best practices.