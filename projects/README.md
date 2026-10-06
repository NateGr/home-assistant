# Integration Development Projects

This folder holds independent Git repositories for custom Home Assistant
integrations. In HA-Dev it also serves as a template for the planned Home
Assistant development workspace. No container configuration is included here.

## One-Time Container Setup

Place this README and its accompanying `.gitignore` in a `projects` folder at
the root of the Home Assistant checkout, alongside `homeassistant` and
`.devcontainer`. The folder must exist on the host before starting the container.

In the Home Assistant checkout's `.devcontainer/devcontainer.json`, replace the
per-integration mount with the projects mount below. Keep any other required
mounts. This example assumes HA-Dev is a sibling of the Home Assistant checkout:

```jsonc
"mounts": [
  "source=${localWorkspaceFolder}/projects,target=/projects,type=bind,consistency=cached",
  "source=${localWorkspaceFolder}/../HA-Dev,target=/workspaces/HA-Dev,type=bind,consistency=cached"
]
```

Run **Dev Containers: Rebuild Container** once to apply the mount change.
A restart alone will not apply it. The regular rebuild normally reuses cached
image layers, but setup scripts may run again; its duration is not guaranteed.

## How Storage Works

The host `projects` folder and container `/projects` folder contain the same
files. Cloning or editing inside `/projects` changes the host files directly.

Files here survive ordinary container rebuilds. Deleting files inside the
container also deletes them on the host. This mount is not a backup: push work
to a remote or maintain a separate backup. Preserve any work outside persistent
mounts before rebuilding, including local commits and stashes.

## Add a Project

From a terminal inside the development container:

```bash
cd /projects
git clone https://github.com/NateGr/ha-chore-tracker.git
```

Confirm the checkout appears in the host `projects` folder. No container rebuild
is needed when adding projects.

## Connect an Integration to Home Assistant

Example, assuming HA uses `/workspaces/home-assistant/config`:

```bash
test -d /projects/ha-chore-tracker/custom_components/chore_tracker
mkdir -p /workspaces/home-assistant/config/custom_components
ln -sfnT /projects/ha-chore-tracker/custom_components/chore_tracker \
  /workspaces/home-assistant/config/custom_components/chore_tracker
readlink -f /workspaces/home-assistant/config/custom_components/chore_tracker
```

Run these commands in the Linux devcontainer, not host PowerShell. If the source
check fails, stop and verify the checkout. The link name must match the integration
domain, not its repository name. If the destination is a real directory, inspect
it first; do not delete it blindly. `ln -sfnT` refuses to replace a real directory.

Use the configuration directory selected by your HA launch configuration.
The symlink's target is a container path, so it may look broken from Windows.

## Open and Debug

1. In the container-connected VS Code window, use **File > Add Folder to
   Workspace** to add your project.
2. Keep the Home Assistant checkout in the workspace for its debug configuration.
3. Save the workspace somewhere persistent, such as your project checkout.
4. Select the Home Assistant launch configuration and press F5. Do not also run
   another HA process on the same port.
5. Open the address shown in VS Code's Ports view for port 8123, usually
   `http://localhost:8123`, and trigger your integration.

After Python code edits, restart the Home Assistant debugging session. The
symlink avoids copying files; it does not automatically reload Python modules.
Integration reloads are useful for supported configuration changes, but are
not a general replacement for restarting after code changes.

## Git Safety

Each cloned project has its own Git repository. Run Git commands from that
project's directory and verify the selected repository before committing:

```bash
cd /projects/ha-chore-tracker
git status
git remote -v
```

The enclosing repository ignores project checkouts using this folder's
`.gitignore`. Only this README and the ignore rules are tracked there. Ignore
rules do not untrack files already committed by the parent repository.

## Before and After Rebuilding

Before rebuilding, verify that source files and HA's active configuration
directory are stored on persistent mounts. Preserve HA's database and `.storage`
as well as its YAML files; they contain your development instance's state.

After rebuilding, reconnect, open the saved workspace, and check the integration
source and symlink before pressing F5. Recreate the link if needed. Checkouts do
not need to be cloned again when their host folder is still present.
