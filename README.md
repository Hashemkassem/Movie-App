# movie_app

A new Flutter project.

Key Features
1. Movie and Tv Listings:
   - Popular Movies: Displays a list of popular movies fetched from an API.
   - Top Rated Movies: Shows top-rated movies.
   - Upcoming Movies: Lists upcoming movie releases.
   - Popular Tv: Displays a list of popular Tv fetched from an API.
   - Top Rated Tv: Shows top-rated Tv.
   - Now Airing Tv: Lists Now Airing Tv releases.

2. Movie Details:
   - Synopsis: Detailed plot summary.
   - Cast and Crew: Information about actors, directors, and other crew members.
   - Reviews: User and critic reviews.
   - Trailers: Embedded video trailers.

3. Search Functionality:
   - Search Movies: Allows users to search for movies by title.\
     
   \\\\\\\\\\not done yet
   - Filter and Sort: Filter results by genre, release date, or rating.
   //////////

\\\\\\not done yet

4. User Authentication:
   - Sign Up / Log In: User registration and login functionalities.
   - User Profiles: Personalize user experience with profiles, watchlists, and favorites.
   
///////////
5. Favorites and Watchlists:
\\\\\\\\\\not done yet
   - Add to Watchlist: Users can add movies to their watchlist.
///////////
   - Favorites: Mark movies as favorites for quick access

Architecture
- Data Layer: Handles API calls to fetch movie data.
- Repository Layer: Abstracts data sources, providing a clean API for the BLoC components.
- BLoC Layer: Manages the state and business logic.
- Presentation Layer: Flutter widgets that render the UI based on the state provided by the BLoC.


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
