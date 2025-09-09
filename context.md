
# Debugging Notes: Breakpoint Locations

## ha-chore-helper-ex: Current Breakpoints (manual record)



The following breakpoints are currently set (as inferred from the VS Code UI and service logic):

- `custom_components/chore_helper/chore.py`, line 463: At the start of `update_state` (called after completing a chore and when updating entity state).

- `custom_components/chore_helper/__init__.py`, line 186: Inside `handle_complete_chore` (service handler for the "complete" action).

- `custom_components/chore_helper/chore_yearly.py`, line 35: Inside `YearlyChore._find_candidate_date` (at `start_date = self._calculate_schedule_start_date()`).
- `custom_components/chore_helper/chore.py`, line 258: At the start of `Chore._find_candidate_date` (base class, raises NotImplementedError).
- `custom_components/chore_helper/chore.py`, line 320: At the start of `chore_schedule` method (where schedule generation begins).
- `custom_components/chore_helper/chore.py`, line 323: At the call to `self._find_candidate_date(start_date)` inside `chore_schedule`.
- `custom_components/chore_helper/config_flow.py`, line 28: Near the start of the file, likely at or near the `_validate_config` function (config flow submission).

> If the workspace fails to save breakpoints, refer to this list to restore them manually.

## ha-chore-helper-ex: Config Flow Submit

To debug the config flow submission in the `ha-chore-helper-ex` fork, set a breakpoint in:

- `custom_components/chore_helper/config_flow.py`, in the `_validate_config` function (used as `validate_user_input` in the schema config flow). This will break when the config flow form is submitted.

Example:
```python
async def _validate_config(
	_: SchemaConfigFlowHandler | SchemaOptionsFlowHandler, data: Any
) -> Any:
	# BREAKPOINT: This is called when the config flow form is submitted
	...
```

This is the recommended place to break for inspecting config flow submissions.
