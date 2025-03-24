[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/gbHItYk9)
## Project 00
### NeXTCS
### Period: 10
## Name0: Ethan
## Name1: Michelle
---

This project will be completed in phases. The first phase will be to work on this document. Use github-flavoured markdown. (For more markdown help [click here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) or [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) )

All projects will require the following:
- Researching new forces to implement.
- Method for each new force, returning a `PVector`  -- similar to `getGravity` and `getSpring` (using whatever parameters are necessary).
- A distinct demonstration for each individual force (including gravity and the spring force).
- A visual menu at the top providing information about which simulation is currently active and indicating whether movement is on or off.
- The ability to toggle movement on/off
- The ability to toggle bouncing on/off
- The user should be able to switch _between_ simluations using the number keys as follows:
  - `1`: Gravity
  - `2`: Spring Force
  - `3`: Drag
  - `4`: Custom Force
  - `5`: Combination


## Phase 0: Force Selection, Analysis & Plan
---------- 

#### Custom Force: Electrostatic Repulsion and Attraction based on charged particles

### Forumla
What is the formula for your force? Including descriptions/definitions for the symbols. (You may include a picture of the formula if it is not easily typed.)
![image](https://github.com/user-attachments/assets/217499d0-364f-4e1e-842e-988b0220046f)

positive = push
negative = npull
![image](https://github.com/user-attachments/assets/ebae679f-943e-4d03-a28f-ad18fb502add)


### Custom Force
- What information that is already present in the `Orb` or `OrbNode` classes does this force use?
  - distance

- Does this force require any new constants, if so what are they and what values will you try initially?
  - charge

- Does this force require any new information to be added to the `Orb` class? If so, what is it and what data type will you use?
  - Coulomb's constant (approximately 8.99 x 10^9 N⋅m²/C²), gives the value of a quantity (Force) when all of the other factors are one, float

- Does this force interact with other `Orbs`, or is it applied based on the environment?
  - other orbs

- In order to calculate this force, do you need to perform extra intermediary calculations? If so, what?
  - multCharge = charge * other.charge
  - distanceSq = distance * distance
  - fracPart = multCharge / distanceSq
  - total = fracPart * coulombConstant


--- 

### Simulation 1: Gravity
Describe how you will attempt to simulate orbital motion.

attracts all the time

--- 

### Simulation 2: Spring
Describe what your spring simulation will look like. Explain how it will be setup, and how it should behave while running.

SPRING_CONSTANT = random number


wants to be in the middle with no displacement and no stretchy or squashy

--- 

### Simulation 3: Drag
Describe what your drag simulation will look like. Explain how it will be setup, and how it should behave while running.

mult based on radius

if orb = big and chonky then more drag

--- 

### Simulation 4: Custom force
Describe what your Custom force simulation will look like. Explain how it will be setup, and how it should behave while running.

force assigned randomly if + or -

opposite attracts unopposite repels

--- 

### Simulation 5: Combination
Describe what your combination simulation will look like. Explain how it will be setup, and how it should behave while running.

every force active

combines all them forces
