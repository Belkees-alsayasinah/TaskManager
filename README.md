# task_manager_app

Task Manager App
Overview
This is a Flutter-based task manager app that allows users to efficiently manage their tasks. The app includes user authentication, task management features, pagination for task retrieval, local storage for data persistence, and comprehensive unit tests to ensure functionality.

Features
User Authentication: Secure login using username and password via Dummy JSON Auth API.
Task Management: Users can view, add, edit, and delete tasks utilizing the Dummy JSON Todos API.
Pagination: Efficiently fetch a large number of tasks with pagination using the endpoint: https://dummyjson.com/todos?limit=10&skip=10.
State Management: Implemented using GetX for efficient state management across the app.
Local Storage: Tasks are persisted locally using [Shared Preferences] to maintain accessibility even after app closure.
Unit Tests: Comprehensive unit tests cover CRUD operations, input validation, and network requests with mock responses.


Screenshots
![LoginUI](assets/Login.png)
![Home Page UI](assets/HomePage.png)
![Add Task](assets/AddTesk.png)

Getting Started

Prerequisites
Flutter SDK
Dart
An IDE such as Android Studio or Visual Studio Code

Installation
Clone the repository:

git clone https://github.com/yourusername/task_manager_app.git

Navigate to the project directory:

cd task_manager_app

Install dependencies:

flutter pub get

Run the app:

flutter run
Challenges Faced



Challenges Faced

- State Management: When reading the project requirements, I didn’t realize that the options for state management were specifically limited. I initially interpreted them as Bloc, Provider, or others, and I started working with GetX. I noticed the specified options later in the project. Although I have practical experience with Bloc state management, I couldn’t switch due to time constraints. However, I have the ability to quickly learn any new tool or technique if required.

- Pagination Implementation: Ensuring smooth pagination while maintaining performance was challenging, particularly with managing API requests and local data synchronization.

- Unit Testing: Writing comprehensive unit tests, especially for asynchronous operations and mock responses, posed a challenge in ensuring coverage of all critical functionalities. The tests may not cover every scenario since this was my first experience with unit testing, and given the time constraints, the results were not as ideal as I wanted. However, I am quick to learn and can enhance coverage to meet all project requirements in the future.

Conclusion
This project demonstrates my proficiency in Flutter development, focusing on clean architecture, effective state management, and rigorous testing practices. Thank you for considering my application!


