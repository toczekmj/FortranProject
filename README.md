![Project](https://ondemand.bannerbear.com/signedurl/OJ07pvDElJgVPmKbdB/image.jpg?modifications=W3sibmFtZSI6InJlcG8iLCJ0ZXh0IjoidG9jemVrbWogLyAqRm9ydHJhblByb2plY3QqIn0seyJuYW1lIjoiZGVzYyIsInRleHQiOiJDcmVkaXQgcHJvamVjdCBmb3IgdGhlIGNsYXNzIEZvcnRyYW4gUHJvZ3JhbW1pbmcgVUogMjAyMy8yMDI0In0seyJuYW1lIjoiYXZhdGFyNSIsImhpZGUiOnRydWV9LHsibmFtZSI6ImF2YXRhcjQiLCJoaWRlIjp0cnVlfSx7Im5hbWUiOiJhdmF0YXIzIiwiaGlkZSI6dHJ1ZX0seyJuYW1lIjoiYXZhdGFyMiIsImhpZGUiOnRydWV9LHsibmFtZSI6ImF2YXRhcjEiLCJpbWFnZV91cmwiOiJodHRwczovL2F2YXRhcnMuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3UvMTMwMjMxNzA_dj00In0seyJuYW1lIjoiY29udHJpYnV0b3JzIiwidGV4dCI6InRvY3pla21qIn0seyJuYW1lIjoic3RhcnMiLCJ0ZXh0IjoiMCJ9XQ&s=7b70c95d16d38bb0cf0f7db8ebb7bb09e1868d5e051e337252ecc326b396a018)

# FortranProject 
Credit project for the class Fortran Programming UJ 2023/2024

## Menu
- [Description](#desctiption)
    - [Main Features](#main-features)
- [Requirements](#requirements)
- [Usage examples](#usage-examples)
    - [CLI](#cli)
        - [Compile using make](#compile-and-run-using-make)
        - [Compile using gfortran]( #compile-and-run-manually-using-gfortran)
    - [Visual Studio Code](#visual-studio-code)
        - [Troubleshooting](#troubleshooting)
- [Announcement](#announcement) 

## Description
This repository contains a credit project for the Fortran Programming class at Jagiellonian University (UJ) for the academic year 2023/2024.

The goal of this project was to create a simple command line based, interactive-ish To-Do List application. 

### Main features:
- persistency - tasks are stored in external file, therefore they persists between sessions 
- simplicity - there is no unnecessary functions
- modes - there are two modes
    - interactive mode - where user can perform actions like:
        - attempt to add a new task
        - remove an existing task
        - move up and down to select task they want to operate on  
    - edit mode:
        - adding new task
        - editing an existing task
- simple menu and interactions
    - to interact with the menu press:
        - `j` - to move down
        - `k` - to move up 
        - `n`- to add new task to the list
        - `e` - to edit an existing task
        - `r` - to remove task
        - `s` - to save changes without quitting
        - `q` - to save changes and quit 
        - `w` - to quit without saving
    - menu:
        - `-` indicates task that are on the list, but not the one we are currently focused at
        - `*` means that we are currently focused at this certain task, and we can perform actions like editing, deletion 

## Requirements
- Fortran compiler, in this case gfortran
- Access to CLI or Visual Studio Code
- Git installed on your machine


## Usage Examples

### CLI
- Clone the repository
```bash
  git clone https://github.com/toczekmj/FortranProject.git
```
- Open folder
```bash
cd FortranProject
```
    
#### Compile and run using make
```bash
make run
```
#### Compile and run manually using gfortran
```bash
gfortran main.f95 -o todolist
./todolist
```

### Visual Studio Code
- Open Visual Studio Code
- Reveal source control panel
- Click on "Clone repository" button
- Paste following link and press enter
```bash
  https://github.com/toczekmj/FortranProject.git
```
- Select location for the repository 
- Press on "Yes, I trust the authors"
- Go to Run and Debug section (Ctrl+K, S) and press on run 

#### Troubleshooting 
- In case when something is not working properly in VSCode, make sure that you have installed following extensions:
- C/C++
- Modern Fortran
- Fortran Breakpoint Support
- And also check if GDB is installed properly in your system (on unix based systems execute this command: which gdb)
#### Announcement 
As for now, there is no support for GDB on arm64 devices, so even tho you may successfuly compile the program using gfortran, there is no way to debug this using GDB. Actually there is one workaround for MacOs, but it requires using quemu and other external programs like lima. You can check it [here](https://stackoverflow.com/questions/67310123/how-to-install-gdb-on-mac-m1-apple-silicon). It is an answer by Mohamed Ismaiel Ahmed.