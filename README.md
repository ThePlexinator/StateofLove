# State of Love
Simple state manager for the LÖVE framework.

# Functions
```
.newState(pathToFile {string},identifier {string})
```
Loads and stores the specified state with the given identifier. The ID (Identifier) must be unique, so no two states can have the same ID.

```
.removeState(identifier {string})
```
Finds and removes the state with the given identifier.

```
.moveToState(identifier {string})
```
Switches to the state with the given identifier. Executes the :exit() and :enter() functions to the previous and new state respectively. Adding more arguments to .moveToState() will be received as a table for both functions.

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

# Available Callback Functions
You're able to add more callback functions in your own projects whenever it is necessary.

```
.keypressed(), .keyreleased(), .mousepressed(), .mousereleased(), .mousemoved()
```
