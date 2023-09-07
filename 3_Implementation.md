# Wheel Timer Design and Implementation: Detailed Notes 📝

## Introduction 🌟
This guide provides an in-depth understanding of the Wheel Timer design, its implementation in C, and its real-world applications. Wheel Timers are commonly used to keep track of events that are supposed to occur at specific times.

## Data Structure of Wheel Timer 🏗️
Wheel Timer is represented as a C structure with the following six members:

```C
typedef struct _wheel_timer_t {
	int current_clock_tic;
	int clock_tic_interval;
	int wheel_size;
	int current_cycle_no;
	_pthread_t *wheel_thread;
	pthread_mutex_t wheel_timer_mutex;
	ll_t *slots[0];
} wheel_timer_t;
```

1. **Current Clock Tick** 🕒  
   - Represents the current slot number.
   - Analogous to the seconds hand of a clock.
   - Increases by one every second.

2. **Clock Tick Interval** ⏲️  
   - Time interval between each tick.
   - Configurable; default is set to one second.

3. **Number of Slots** 🔢  
   - Total number of slots present in the wheel timer.
   - Example: set to 10 in our discussion.

4. **Current Cycle Number** 🔄  
   - Indicates the number of full rotations the clock tick has completed.

5. **Thread Type (pthread_t)** 🧵  
   - Runs the wheel timer as a separate thread.

6. **Slot Array (Linked List Pointer)** 🔗  
   - Each slot carries a linked list of events that are to be executed.
  
## Initializing the Wheel Timer 🛠️
The Wheel Timer is initialized by the function `init_real_timer` which takes two arguments:
1. The number of slots.
2. Clock tick interval.

### Steps to Initialize 📝
1. Allocate memory for the wheel timer and its array of slots.
2. Initialize each member of the wheel timer using the provided arguments.
3. Loop through the array of slots to initialize them with empty linked lists.

## Running the Wheel Timer 🏃‍♂️
The Wheel Timer runs in a separate thread, started by the `start_wheel_timer` function.

### Steps to Run 📝
1. Create a new thread using the POSIX `pthread_create` API.
2. The function `wheel_function` is set as the start routine for this thread.

## Wheel Function Logic 🎡
This function is the core logic of the Wheel Timer. It performs the following steps:
1. Wait for the time defined by `Clock Tick Interval`.
2. Process events in the current slot.
3. Reschedule events, if necessary.
4. Increment the current clock tick by one.
5. Boundary checks: Reset the clock tick and increment the cycle number after one full rotation.

---

# Interview Questions and Answers 🎤

## Q1: Can you describe the Wheel Timer's data structure? 🤔
### A1:
The Wheel Timer is represented as a C structure with six main members. They are:
- **Current Clock Tick**: Represents the current slot and increments by one each second.
- **Clock Tick Interval**: Time between each tick, by default, it's one second.
- **Number of Slots**: Total slots in the wheel timer.
- **Current Cycle Number**: Shows the number of rotations the clock tick has completed.
- **Thread Type**: A `pthread_t` type that runs the Wheel Timer as a separate thread.
- **Slot Array**: Contains a linked list in each slot which holds the events to be executed.

## Q2: How do you initialize a Wheel Timer? 🛠️
### A2:
Initialization is done by the function `init_real_timer`, which takes the number of slots and the clock tick interval as arguments. Memory is allocated for the wheel timer and its slots, and each member is initialized based on these arguments. Each slot is also initialized with an empty linked list.

## Q3: How does the Wheel Timer operate in a multithreaded environment? 🧵
### A3:
The Wheel Timer runs in a separate thread, created using the POSIX `pthread_create` function. The `wheel_function` serves as the start routine for this thread, encapsulating all the core logic of the Wheel Timer.

## Q4: Can you elaborate on the core logic encapsulated in the `wheel_function`? 🎡
### A4:
Certainly, the `wheel_function` does the following:
1. Waits based on the `Clock Tick Interval`.
2. Processes all the events in the current slot.
3. Reschedules events if needed.
4. Increments the current clock tick by one.
5. Conducts boundary checks, and if a full rotation is completed, resets the clock tick and increments the cycle number.

## Detailed Notes on Real Timer Implementation for Interview Preparation 📝

### Introduction 🌟
- The source code for real-time implementation is shared.
- The discussion includes how the internal functioning of the real timer works and how events are represented.

---

### Wheel Timer 🎡
- Understanding the source code of the wheel timer should now be fairly easy, given the explanation about its internal functioning.

#### Data Structure for Events 📚
- Events are stored in a linked list of slots.
- The data structure representing an event is `real_timer_element_t`.

##### Members of `real_timer_element_t` 👨‍💻
1. **Time Interval**: Time after which the event should be triggered.
2. **Rotation Number (small R-value)**: Number of rotations the wheel timer needs for the event to be triggered.
3. **Function Pointer**: Holds the address of the function to be invoked by the wheel timer.
4. **Argument**: The argument to be supplied to the function.
5. **Size of Argument**: Size of the argument being supplied.
6. **Reference (Boolean)**: If `1`, the event needs to be triggered periodically; if `0`, it will be triggered only once.

---

#### Application Callback 📞
- The function pointer is of a particular type that returns a `void*` and takes a `void*` and the size of the argument as inputs.
- Any application function with this signature can be invoked.

#### API to Register an Event 📝
- API name: `Register_App_Event`
- Returns the event itself (`real_timer_element_t`).

##### Arguments to `Register_App_Event` 🗂
1. **Wheel Timer Object**: With whom the registration is done.
2. **Event Function Pointer**: The application function to invoke.
3. **Argument**: To be supplied to the function.
4. **Size of Argument**: Size of the argument.
5. **Time Interval**: Time after which the event should be triggered.
6. **Periodicity**: Boolean to indicate if the event is periodic or one-off.

##### Implementation 🛠
- Allocate memory for the `real_timer_element_t`.
- Copy arguments to this object.
- Find the slot where the `real_timer_element_t` should be placed.

---

### Interview Questions & Answers 🤔💡

#### Q1: What is the purpose of the `real_timer_element_t` structure? 🧐
##### A1: 
The `real_timer_element_t` structure is used to represent an event in the wheel timer. It contains various members like time interval, rotation number (small R-value), function pointer, arguments, and their sizes, and a Boolean flag to indicate whether the event is periodic or one-off.

#### Q2: What does the small R-value in `real_timer_element_t` represent? 🤔
##### A2: 
The small R-value represents the number of rotations the wheel timer needs to make for the event to be triggered.

#### Q3: Explain the role of the `Register_App_Event` API. 📘
##### A3: 
The `Register_App_Event` API is used to register an event with the wheel timer. It takes various arguments like the wheel timer object, the event function pointer, the argument and its size, time interval, and periodicity. It returns the registered `real_timer_element_t` object.

#### Q4: What do you mean by function pointers and callbacks in the context of `real_timer_element_t`? 🖋
##### A4: 
In `real_timer_element_t`, the function pointer holds the address of the function to be invoked by the wheel timer. Any application function that matches the signature of this function pointer can be invoked. This is what makes it a callback function.

#### Q5: How do you decide where to place the `real_timer_element_t` in the wheel timer? 📍
##### A5: 
To decide where to place the `real_timer_element_t`, you need to calculate the small R-value and the slot number. These are calculated based on the current slot number and rotation number (capital R-value) of the wheel timer, which might be running at the time of registration.

---

Feel free to reach out for any further clarification. Good luck with your interviews! 🍀

Feel free to ask any more questions you might have! 😊
