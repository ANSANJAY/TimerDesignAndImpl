### Wheel Timer Notes 🕒

#### Introduction 🎯
- Wheel timer is a data structure that mimics a real-world clock.
- It's made up of slots; each slot represents a unit of time (e.g., one second).
- A real-world clock usually has 60 slots (seconds), but for simplification, this example wheel timer has 10 slots.

#### Basic Structure 🔨
- Each slot has a linked list attached.
- The linked list contains events to be triggered when the wheel timer reaches that particular slot.
- Every time the wheel completes a rotation, a variable (`R`) is incremented.
  - `R` represents the number of complete rotations the wheel has made.

#### Events 🎉
- Events are tasks or functions that are scheduled to run at a specific time.
- When the wheel timer hits a slot, it triggers all the events in the linked list of that slot.
- Events can be recurring.

#### Additional Details 📝
- When an event is triggered, it may need to be rescheduled for future execution.
- Event scheduling considers both the slot and the number of rotations (`small R`).

#### Advanced Scenarios 🌐
- An event can be scheduled to trigger after multiple rotations.
  - E.g., an event scheduled to run every 30 seconds would require 3 full rotations if using a 10-second wheel timer.
  - In this case, `small R` is used to denote the number of rotations after which the event is triggered.

#### Optimization 🚀
- Events in each slot's linked list are sorted by their `small R` values.
- When processing a slot, we can stop scanning the list when `small R` > `R`.

#### Application Design 📱
- Create a wheel timer object.
- Start a wheel timer thread that runs continuously.
- Register events (functions) with the wheel timer.

#### Events in Programming 💻
- Events are essentially function pointers.
- They point to functions in the application that registered them.

---

### Interview Questions 🤔

1. **Can you explain the basic structure of a Wheel Timer?**
   - Answer: A wheel timer mimics a real-world clock and is made up of slots. Each slot represents a unit of time and has a linked list attached to it. The linked list contains events to be triggered. A variable `R` is incremented whenever the wheel completes a rotation. 

2. **What is the role of the `R` variable in a Wheel Timer?**
   - Answer: The `R` variable, or "Capital R", keeps track of the number of complete rotations that the wheel timer has made.

3. **How are events scheduled and triggered in a Wheel Timer?**
   - Answer: Events are added to the linked list of a specific slot. When the wheel timer reaches that slot, it triggers all the events in that slot's linked list. If an event needs to recur, it will be rescheduled.

4. **Explain `small R` and its significance.**
   - Answer: `small R` represents the number of rotations that should be completed before an event is triggered. An event will fire only if `small R` equals the current `R` value.

5. **Discuss an optimization technique for a Wheel Timer.**
   - Answer: One optimization is to sort the events in each slot's linked list by their `small R` values. This allows for early termination of list scanning when `small R` > `R`.

6. **How are events represented in programming terms?**
   - Answer: Events are function pointers that point to specific functions in the application. When the wheel timer hits a slot, it invokes the corresponding functions.

7. **What are the initial steps for integrating a Wheel Timer in an application?**
   - Answer: First, you create a Wheel Timer object. Next, you start a separate thread that runs the wheel timer continuously. Finally, you register events with the wheel timer.

8. **How do you reschedule an event in a Wheel Timer?**
   - Answer: To reschedule an event, you remove it from its old slot and linked list and add it to a new one. You'll also update its `small R` value based on the new time it should be triggered.

9. **Explain the role of linked lists in a Wheel Timer.**
   - Answer: Each slot in a Wheel Timer has an associated linked list that holds the events to be triggered when the Wheel Timer hits that slot. These events may have varying `small R` values to signify the rotation in which they should be triggered.

10. **How does a Wheel Timer work with function pointers?**
    - Answer: A Wheel Timer uses function pointers to execute application-specific functions when it hits a particular slot. These function pointers are stored as events in the linked lists associated with each slot.

---

Feel free to use these notes for your revision and good luck in your interviews! 🍀
