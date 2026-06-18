# 🎮 I2C-Based Game Controller Interface in SoC

## 📌 Overview

The I2C-Based Game Controller Interface is a Verilog HDL project that demonstrates communication between a game controller and a System-on-Chip (SoC) using the Inter-Integrated Circuit (I2C) protocol. The design implements an I2C Master module, a Game Controller Slave module, and an APB-based interface for controller communication and data transfer.

The project was simulated and synthesized using Xilinx Vivado to verify correct protocol operation, button-state transfer, and module integration.

---

## 🎯 Problem Statement

Modern embedded systems and SoCs require efficient communication with external peripherals such as sensors, controllers, displays, and input devices. This project demonstrates how the I2C protocol can be integrated within an SoC architecture to enable reliable communication between a processor-controlled system and an external game controller.

---

## ✨ Features

### 🔗 I2C Master Controller

Implements I2C communication for initiating transactions and receiving controller data.

### 🎮 Game Controller Interface

Simulates a game controller using an I2C Slave module that provides button-state information.

### ⚙️ FSM-Based Communication

Uses a Finite State Machine (FSM) to manage START, ADDRESS, DATA, ACK, and STOP operations.

### 🔄 APB Integration

Provides an APB-based interface for configuring and controlling I2C transactions.

### 🧪 Simulation and Verification

Functionality verified through waveform analysis and Vivado simulation.

### 🏗️ RTL Synthesis

Successfully synthesized using Xilinx Vivado with RTL schematic generation.

---

## 🛠️ Technologies Used

* Verilog HDL
* Digital Design
* Finite State Machine (FSM)
* I2C Protocol
* AMBA APB
* System-on-Chip (SoC)
* Xilinx Vivado

---

## ⚙️ Working Principle

1. The APB interface initiates an I2C transaction.
2. The I2C Master generates START condition and sends the slave address.
3. The Game Controller Slave acknowledges the request.
4. Button-state data is transferred through the SDA line.
5. The received data is stored in the button status register.
6. The I2C Master generates the STOP condition and returns to the IDLE state.

---

## 📁 Repository Contents

├── README.md

├── I2C_Game_Controller_Paper.pdf

├── RTL_Schematic_Vivado.jpeg

├── Waveform_Analysis.jpeg

├── i2c_master_apb.v

├── i2c_game_controller_slave.v

├── soc_top.v

└── i2c_testbench.v

---

## 📸 Results

### RTL Schematic

Generated using Xilinx Vivado after synthesis to verify module connectivity and design hierarchy.

### Simulation Waveform

Waveform analysis confirms successful I2C communication, button-state transfer, and protocol-compliant operation.

---

## 🏆 Achievement

This project secured **3rd Prize at Tech Vision 2026**, a National-Level Project Expo organized by CMR Institute of Technology, Bengaluru.

---

## 🎓 Academic Purpose

This project was developed to understand I2C communication, APB integration, FSM-based control logic, RTL design, and SoC peripheral interfacing using Verilog HDL.

---

## 👩‍💻 Author

**V M Swathika**

Electronics and Communication Engineering (ECE)

VLSI Design | RTL Design | Embedded Systems | SoC Design

GitHub: https://github.com/swathika0401/I2C-Based-Game-Controller-Interface-in-SoC


