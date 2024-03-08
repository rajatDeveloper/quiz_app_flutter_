Quiz Maker App
Welcome to Quiz Maker, a versatile application that empowers users to create various types of quizzes, add questions to them, and enjoy playing quizzes created by others. This app provides a seamless experience for users to engage in quiz creation, participation, and result viewing.

Key Features:
Quiz Creation: Users can create different types of quizzes based on their preferences and interests.
Question Addition: Easily add questions to created quizzes to enhance their content and depth.
Multi-User Quizzes: All users can access and participate in quizzes created by other users, fostering a vibrant community.
Result Screen: After completing quizzes, users can view their results and performance insights on a dedicated screen.

Technologies Used:
Firebase Core (firebase_core: ^2.26.0)
Purpose: Integrates Firebase services into the app for backend functionalities.
Usage: Facilitates authentication, database operations, and data storage.

Shared Preferences (shared_preferences: ^2.2.1)
Purpose: Enables persistent data storage for app settings and user preferences.
Usage: Stores user-specific data locally on the device for quick retrieval and usage.

Cached Network Image (cached_network_image: ^3.3.1)
Purpose: Efficiently loads and caches images from network URLs to enhance app performance.
Usage: Displays images, such as quiz thumbnails, with improved loading times and reduced bandwidth consumption.

Provider (provider: ^6.1.2)
Purpose: Implements the Provider pattern for state management and dependency injection.
Usage: Manages app state, facilitates data sharing between widgets, and simplifies widget updates.

Google Sign-In (google_sign_in: ^6.2.1)
Purpose: Allows users to authenticate using their Google accounts for seamless login and access.
Usage: Provides a secure and familiar authentication method for users to log into the app.

Cloud Firestore (cloud_firestore: ^4.15.7)
Purpose: Serves as the database backend for storing and retrieving quiz data, user information, and quiz results.
Usage: Handles real-time data synchronization, enables efficient querying, and supports structured data storage.

Random String (random_string: ^2.3.1)
Purpose: Generates random strings for various purposes, such as unique identifiers and security tokens.
Usage: Creates unique IDs for quizzes, questions, and user sessions to ensure data integrity and security.

Firebase Auth (firebase_auth: ^4.17.7)
Purpose: Provides authentication services for user registration, login, and session management.
Usage: Enables secure user authentication using email and password credentials, ensuring data privacy and access control.

Architecture and Design Patterns:
The Quiz Maker app follows the Model-View-ViewModel (MVVM) pattern and component-based programming principles to ensure modularity, scalability, and maintainability. By separating concerns into distinct layers – model, view, and view model – the app achieves a clear separation of concerns and promotes code reusability.

Installation:
To run the Quiz Maker app locally, clone the repository and ensure you have Flutter and the required dependencies installed. Then, use the following command to install the app's dependencies:


flutter pub get
After installing dependencies, you can run the app on your preferred emulator or physical device using the following command:


flutter run

Contributions:
Contributions to the Quiz Maker app are welcome! If you have any suggestions, feature requests, or bug reports, please feel free to open an issue or submit a pull request on the GitHub repository.

Thank you for using Quiz Maker! Let's create and enjoy quizzes together!
