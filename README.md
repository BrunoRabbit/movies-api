
# movies_api
- Study Project
- applying Test Driven Development (TDD)
- Using The Movie Database API

## Features

:black_square_button: Dark and light themes  
:white_check_mark: Search movies  
:black_square_button: Save user settings  
:black_square_button: Add to Favorites  
:white_check_mark: Unit test  

## Environment variables
To run this project, you will need to add the following environment variables to your .env

`API_KEY` -> you can generate an api key on [The Movie Database](https://developers.themoviedb.org/3/getting-started/introduction) website

- For everything that starts with `URL`, it is the URL of certain API, example: Configuration API, Discover API...
- You can see on the official page of the movie db website for [developers](https://developers.themoviedb.org/3)

`URL_CONFIG`

`URL_TRENDING`

`URL_MOVIES`

## Tests

![tests](https://cdn.discordapp.com/attachments/1080670144751206511/1080686640760115330/image.png)

## API link

refer to [API - The Movie Database](https://developers.themoviedb.org/3/getting-started/introduction).

## Folders
 __Lib folder__
 ```bash
lib
├───core
│   ├───error
│   ├───network
│   ├───observables
│   ├───themes
│   ├───utils
│   │   └───extensions
│   └───widgets
└───features
    ├───home_page
    │   ├───data
    │   │   ├───datasources
    │   │   ├───models
    │   │   └───repositories
    │   ├───domain
    │   │   ├───entities
    │   │   ├───repositories
    │   │   └───usecases
    │   └───presentation
    │       ├───bloc
    │       │   ├───configurate_api_bloc
    │       │   ├───movies_theaters_bloc
    │       │   ├───popular_api_bloc
    │       │   ├───top_rated_bloc
    │       │   ├───trending_api_bloc
    │       │   └───upcoming_api_bloc
    │       ├───cubit
    │       │   ├───page_navigator_cubit
    │       │   └───smooth_indicator_cubit
    │       ├───pages
    │       └───widgets
    │           ├───carousel
    │           ├───main_content
    │           ├───movies_in_theaters_section
    │           ├───popular_section
    │           └───upcoming_section
    └───search_page
        ├───data
        │   ├───datasources
        │   ├───models
        │   └───repositories
        ├───domain
        │   ├───entities
        │   ├───repositories
        │   └───usecases
        └───presentation
            ├───bloc
            │   └───search_api_bloc
            ├───pages
            └───widgets
 ```
 __Test folder__

```bash
test
├───core
│   ├───network
│   └───utils
│       └───extensions
└───features
    ├───home_page
    │   ├───data
    │   │   ├───datasources
    │   │   │   └───api_repository_remote_data_source
    │   │   │       ├───get_configuration_api
    │   │   │       ├───get_movies_in_theaters
    │   │   │       ├───get_popular_movies
    │   │   │       ├───get_top_rated_api
    │   │   │       ├───get_trending_api
    │   │   │       └───get_upcoming_api
    │   │   ├───models
    │   │   └───repositories
    │   ├───domain
    │   │   └───usecases
    │   └───presentation
    │       ├───bloc
    │       │   ├───configurate_api_bloc
    │       │   ├───movies_in_theaters_bloc
    │       │   ├───popular_api_bloc
    │       │   ├───top_rated_bloc
    │       │   ├───trending_api_bloc
    │       │   └───upcoming_api_bloc
    │       └───cubit
    └───search_page
        ├───data
        │   ├───datasources
        │   ├───models
        │   └───repositories
        ├───domain
        │   └───usecases
        └───presentation
            └───bloc
                └───search_api_bloc.dart
```

