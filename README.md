# State of Love
Simple state manager for the LÖVE framework.

# Functions
```
.newState(pathToFile {string},identifier {string})
```
Loads and stores the specified state, assigning it to the given identifier, then executes its :load() function. The ID (Identifier) must be unique, so no two states can have the same ID.

```
.removeState(identifier {string})
```
Finds and removes the state with the given identifier.

```
.moveToState(identifier {string})
```
Switches to the state with the given identifier. Executes the :exit() and :enter() functions to the previous and new states respectively. Adding more arguments to .moveToState() will be received as a table for both functions.
**NOTE: This is a mandatory function, you must run this at least once!**

```
.update(dt {float})
```
Updates the current state with the given deltatime.

```
.draw()
```
Draws graphics to the screen using the current state.

```
.getCurrentState(dateFile {bool})
```
If dataFile is true, returns the current state's file. Otherwise, if dataFile is false/undefined, returns the current state's ID.

```
.getStates()
```
Returns all loaded states.

# State Functions
```
:load()
```
Runs when the state is loaded in with .newState().

```
:enter(args {table})
```
Runs when the state is moved into with .moveToState(). The "args" argument is a table of additional variables that the state may need to use.

```
:exit(args {table})
```
Runs when the state is moved out of with .moveToState(). Refer to the ":enter()" function with the "args" argument.

```
:update(dt {float})
```
Updates the scene's logic.

```
:draw()
```
Draws graphics to the scene.

# Available Callback Functions
You're able to add more callback functions in your own projects whenever it is necessary.

```
keypressed(), keyreleased(), mousepressed(), mousereleased(), mousemoved()
```
