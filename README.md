# Edge Detection Flutter App

This repository contains a Flutter application for real-time edge detection in images using Google ML kit and Flutter.

## Setup Instructions
Make sure you have the following installed:

* Flutter SDK (Latest stable version)

* Dart

* Android Studio or VS Code with Flutter Plugin

* A physical or virtual device (Android)

### Clone the Repository
  `git clone https://github.com/sanjidbillah/Edge-Detection.git
cd Edge-Detection`
### Install Dependencies
  `flutter pub get`
### Run the Application
  `flutter run`

## Architectural Decisions
 ### 1. MVC Architecture
  This application follows the Model-View-Controller (MVC) pattern:
    
   * Controller: Acts as an intermediary between the Model and the View, handling user inputs and updating the Model.

   * View: Handles UI elements and user interactions.
    
   * Model: Manages data and business logic
 ### 2. Edge Detection Algorithm
   The app leverages Google ML Kit for image processing.
