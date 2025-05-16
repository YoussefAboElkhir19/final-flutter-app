# Flutter Application 1

## Project Description
Flutter Application 1 is a feature-rich mobile application built using the Flutter framework. The app is designed to provide a seamless user experience with functionalities such as user authentication, item management, favorite tracking, and profile management. It leverages state management using the `Provider` package and stores user data locally using `SharedPreferences`.

## Features

### 1. **User Authentication**
- **Login**: Users can log in using their credentials.
- **Signup**: New users can register by providing their details.
- **Logout**: Users can securely log out of the application.

### 2. **Dashboard**
- Displays a personalized welcome message with the user's full name.
- Shows a grid of items with images and titles.
- Allows users to navigate to item details.

### 3. **Favorites**
- Users can mark items as favorites.
- A dedicated favorites screen displays all favorite items.
- Favorite count is dynamically updated and displayed in the dashboard.

### 4. **Profile Management**
- Users can view and update their profile information.
- Profile picture support with image selection.

### 5. **Item Management**
- Add new items with titles, descriptions, and images.
- View item details with full information.

### 6. **Quotes Section**
- Displays motivational quotes fetched from a service.
- Categorized quotes with author information.

### 7. **Splash Screen**
- A visually appealing splash screen with a loading indicator.
- Automatically navigates to the login or home screen based on user authentication status.

## Technologies Used
- **Flutter**: For building the cross-platform mobile application.
- **Provider**: For state management.
- **SharedPreferences**: For local data storage.
- **Dart**: Programming language for Flutter development.

## How to Run the Project
1. Clone the repository.
2. Navigate to the project directory.
3. Run `flutter pub get` to install dependencies.
4. Start an emulator or connect a physical device.
5. Run `flutter run` to launch the application.

## Folder Structure
- **lib/**: Contains the main application code.
  - **add_items/**: Code for adding and managing items.
  - **dashboard/**: Dashboard screen and related widgets.
  - **details/**: Item details screen and widgets.
  - **favorite/**: Favorite items management.
  - **Login/**: Login and signup screens.
  - **profile/**: User profile management.
  - **quote/**: Quotes section.
  - **splash/**: Splash screen and related logic.
- **assets/**: Contains images and other static assets.
- **test/**: Contains test files.

## Future Enhancements
- Add support for dark mode.
- Integrate a backend service for user authentication and data storage.
- Implement push notifications.

## Contributors
- **Your Name**: Nour484

## License
This project is licensed under the MIT License.
