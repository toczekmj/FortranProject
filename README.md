

# FortranProject 

Credit project for the class Fortran Programming UJ 2023/2024

## Description
This repository contains a credit project for the Fortran Programming class at Jagiellonian University (UJ) for the academic year 2023/2024.

## Requirements
- Fortran compiler, in this case gfortran
- Access to CLI or Visual Studio Code
- Git installed on your machine


## Usage/Examples

### CLI
- Clone the repository
```bash
  git clone https://github.com/toczekmj/FortranProject.git
```
- Open folder
```bash
cd FortranProject
```
    
#### - Compile and run using make
```bash
make run
```
#### - Compile and run manually using gfortran
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