
# Wheel Timer Project 🕒

## Introduction 📚

Welcome to the Wheel Timer Project! This project implements a highly efficient wheel timer, capable of scheduling events at different intervals. These events can either be executed once or at recurring intervals. 

## Features ✨

- **Scheduled Tasks**: Schedule tasks to run once or multiple times at a specific interval.
- **Thread-Safe**: The project uses mutex locks to ensure that it's thread-safe.
- **Modular**: Separate functions for starting, stopping, and resetting the wheel timer.
- **Custom Callbacks**: Support for custom application callbacks with custom arguments.

```
  +-------------------------------------------------------------------+
  |                        Wheel Timer                                |
  +-------------------------------------------------------------------+
  |                                                                   |
  |                             Time Wheel                             |
  |                                                                   |
  |                             +-----+                                |
  |                        +----|  9  |----+                           |
  |                   +----|               |----+                      |
  |              +----|  8                   0  |----+                 |
  |         +----|                                 |----+              |
  |    +----|  7                                     1  |----+         |
  |   |                                                  |            |
  |   |  6                                              2             |
  |   |                                                  |            |
  |    +----|  5                                     3  |----+         |
  |         +----|                                 |----+              |
  |              +----|  4                   4  |----+                 |
  |                   +----|               |----+                      |
  |                        +----|  3  |----+                           |
  |                             +-----+                                |
  |                                                                   |
  |        R = Number of rotations                                     |
  |        Slot 0,1,2,3... represent different slots in the wheel.     |
  |        Each slot has a linked list (not shown) that holds the      |
  |        events scheduled for that slot.                             |
  |                                                                   |
  +-------------------------------------------------------------------+



```
## Getting Started 🚀

### Prerequisites 📝

- C Compiler (gcc recommended)
- POSIX compliant system for `pthread.h`

### Compilation 🛠️

Navigate to the project directory and run:

```bash
gcc -o wheel_timer_demo wheeltimerdemo.c -lpthread
```

### Execution 🖥️

Run the compiled program:

```bash
./wheel_timer_demo
```

## Code Overview 🗺️

- `WheelTimer.h`: Contains the definitions for wheel timer data structures and functions.
- `wheeltimerdemo.c`: A sample program that demonstrates how to use the wheel timer API.

### Important Data Structures 🏗️

- `wheel_timer_t`: The main wheel timer structure.
- `wheel_timer_elem_t`: An element representing a task in the wheel timer.
- `slotlist_t`: A list of slots in the wheel timer.

### Important Functions 🧰

- `init_wheel_timer()`: Initializes the wheel timer.
- `start_wheel_timer()`: Starts the wheel timer thread.
- `register_app_event()`: Registers an application event (task) to the wheel timer.
- `de_register_app_event()`: De-registers an application event (task) from the wheel timer.
- `wt_elem_reschedule()`: Reschedules an existing application event with a new time interval.


### Algorithm for Wheel Timer Project

#### Initialization Phase
1. **Initialize Wheel Timer:**
    - Allocate memory for a `wheel_timer_t` structure.
    - Initialize the structure with the given wheel size and clock tick interval.
    - Initialize an array of `slotlist_t` to keep track of tasks at each slot.
    - Create a timer thread that will run the wheel timer.
  
2. **Start Wheel Timer:**
    - Start the wheel timer thread.
  
#### Registration Phase
1. **Register Application Event:**
    - Create a `wheel_timer_elem_t` structure.
    - Fill it with the information of the event to be triggered:
        - Callback function to execute
        - Arguments to pass to the callback function
        - Time interval at which to execute
        - Whether the event is recurrent or not
    - Place the `wheel_timer_elem_t` into the appropriate slot in the wheel based on its time interval.

#### Runtime Phase (Inside the Wheel Timer Thread)
1. **Clock Tick:**
    - On each clock tick, update the current slot index.
  
2. **Execute Events:**
    - Check the current slot for any `wheel_timer_elem_t` items.
    - Execute the callback functions of those items.
  
3. **Reschedule Events:**
    - For each `wheel_timer_elem_t` item executed, determine if it needs to be rescheduled.
    - If yes, place it back into the appropriate slot based on the new time interval.

4. **De-Register Application Event:**
    - Remove a `wheel_timer_elem_t` from the wheel so that it will not be executed again.
  
5. **Wheel Timer Management:**
    - Functions to start, stop, or reset the wheel timer.

#### Demo Program Phase
1. **Initialize Wheel Timer:**
    - Call `init_wheel_timer()` to create a new wheel timer.

2. **Start the Timer:**
    - Call `start_wheel_timer()` to start the wheel timer thread.
  
3. **Register Events:**
    - Register multiple events using `register_app_event()`.
  
4. **Keep Program Running:**
    - Use `scanf()` to prevent the main program from exiting.

5. **Optional:**
    - Implement functions to de-register events or reschedule them with new time intervals.

This is a simplified view, and the actual implementation may have additional features and optimizations.

## Examples 🌟

Check `wheeltimerdemo.c` for a full example of how to use the wheel timer. The example demonstrates registering two tasks to the wheel timer: one that prints "Hello World" and another that prints "Timer is running."

## Contributing 🤝

Feel free to fork the project, make some updates, and then submit a pull request!

## License 📜

This project is open source and available under the MIT License.

## Author 👨‍💻

Anamika

---

That's all folks! Thank you for checking out the Wheel Timer Project! 🎉🙌
