# TMDB Movies App

TMDB Movies App is a Flutter application that fetches movies from The Movie Database (TMDB) API,
allows users to set movies as favorites, and navigates between home and favorite screens. The app is
built using clean architecture principles and utilizes Riverpod for state management and Dio for
HTTP requests.

## Features

- Fetches movies from TMDB API.
- Allows setting and viewing favorite movies.
- Simple navigation between home and favorite screens.
- Minimal design for a Minimum Viable Product (MVP).

## Architecture

The application follows the Clean Architecture pattern which promotes separation of concerns, making
the code more modular, testable, and maintainable.

## State Management

The app uses [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) for state management,
which is a powerful and simple state management solution for Flutter.

## HTTP Client

The app uses [Dio](https://pub.dev/packages/dio) for making HTTP requests to the TMDB API. Dio is a
powerful HTTP client for Dart, which supports Interceptors, Global configuration, FormData, File
downloading, and more.

## Local Storage

The app uses [shared_preference](https://pub.dev/packages/shared_preferences) for local storage. As
the app remains simple [shared_preferences] is a good choice to storage data. No configuration is
required to run the app and the implementation is quite simple.

## Screens

- **Home Screen**: Displays a list of movies fetched from the TMDB API.
- **Favorite Screen**: Displays a list of movies marked as favorites by the user.

## Getting Started

### Prerequisites

- Flutter installed on your machine. You can follow the
  instructions [here](https://flutter.dev/docs/get-started/install).
- Flutter 3.22.1 & Dart 3.4.1
- An API key from [TMDB](https://www.themoviedb.org/documentation/api).

### Installation

1. Clone the repository:
    ```sh
       git clone git@github.com:TenzinBraun/TMDBApp.git
    ```

2. Get dependencies:
    ```sh
       flutter pub get
    ```

3. Create a .env file:
    ```sh
       nano .env
    ```

4. Paste your API Key:

    ```
       API_KEY="YOUR_API_KEY"
    ```
   If you encouter trouble with the .env system you can check 5.
5. (NOT RECOMMENDED) Paste your API key:
   In config/http/app_client.dart replace "YOUR API KEY"
    ```dart
       static String securedApiKey = dotenv.env['API_KEY'] ?? 'Or Paste your API KEY here.';
    ```

6. Run the App
    ```sh
      flutter run
    ```

## Contact

Feel free to contact me if you have any questions regarding the app and its development. 
