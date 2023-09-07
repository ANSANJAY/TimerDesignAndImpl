# Wheel Timer: Detailed Notes for Revision 📚🕒

## Introduction 🌟
This segment provides an in-depth look at a specialized data structure called the "Wheel Timer," which resembles a wall clock. It's designed to efficiently manage timing events, especially in the context of routing tables with millions of entries.

Linux Timer + Wheel Data structure = Wheel Timer
---

## Basic Design of Wheel Timer 🎡
- The Wheel Timer looks similar to a wall clock.
- In our example, the Wheel Timer has 10 slots, each corresponding to one second.
- A traditional wall clock usually has 60 slots for 60 seconds, but for demonstration, the Wheel Timer has only 10.

### Linked List in Slots 🗂️
- Each slot in the Wheel Timer has an attached linked list.
- This list contains events that are triggered when the timer's clock needle hits a particular slot.

### Complete Rotations 🔄
- A value "R" increases by one each time the Wheel Timer completes a full rotation.
- "R" represents the number of complete rotations the Wheel Timer needle has made.

---

## Event Triggering 🚀
- When the Wheel Timer hits a particular slot (e.g., Slot 2), all events in the linked list of that slot are fired sequentially.
- These events are function pointers that need to be invoked.

### Repeated Triggering ⏲️
- Events are triggered again when the clock needle completes a full rotation and returns to the same slot.

---

## Dynamic Event Scheduling 🗓️
- To fire an event (e.g., Event E11) after a specific interval (e.g., 3 seconds), you have to calculate the slot number where the new event should be placed.
- For example, if the clock is at Slot 2 and you want to fire Event E11 after 3 seconds, you would place Event E11 in Slot 5.

### Rescheduling Events 🔁
- After triggering an event, it needs to be rescheduled for future triggering.
- The new slot number for rescheduling can be calculated as: `Current Slot + Time Interval`.

---

# Interview Questions and Answers 🤔💡

### Q1: How does the basic design of a Wheel Timer resemble a wall clock?

**A1**: The Wheel Timer is similar to a wall clock in that it has slots, each corresponding to a specific time interval. While a traditional wall clock usually has 60 slots for 60 seconds, the example Wheel Timer has 10 slots, each representing one second.

### Q2: What is the significance of the linked lists attached to each slot in a Wheel Timer?

**A2**: The linked lists attached to each slot in the Wheel Timer contain events that are set to be triggered when the clock needle hits that particular slot. The events are represented as function pointers.

### Q3: What does the value "R" in the Wheel Timer represent?

**A3**: The value "R" represents the number of complete rotations the Wheel Timer needle has made. It increments by one each time the needle completes a full rotation around the wheel.

### Q4: How are events dynamically scheduled in the Wheel Timer?

**A4**: To dynamically schedule an event, one calculates the new slot number based on the current slot and the time interval after which the event should be fired. For example, if the clock is at Slot 2 and the event is supposed to be triggered after 3 seconds, the event would be placed in Slot 5.

### Q5: What steps are involved in rescheduling an event in the Wheel Timer?

**A5**: After an event is triggered, it needs to be rescheduled for future execution. To do this, one must remove the event from its current slot and place it in a new slot calculated by adding the time interval to the current slot. For example, if Event E11 is triggered at Slot 5 and needs to be triggered again after 3 seconds, it would be moved to Slot 8.

---

Best of luck with your interviews! 🍀👍
