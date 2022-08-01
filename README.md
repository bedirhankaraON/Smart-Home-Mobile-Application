# Smart Home

Description : This is an open-souce flutter aplication which can communicate with your smart widgets. *Development purposes only*. 

**Folder Structure**

```
Smart-Home-Mobile-Application
├─ lib
│  ├─ core
│  │  ├─ error
│  │  │  ├─ exceptions
│  │  ├─ params
│  │  ├─ resources
│  │  │  ├─ localization
│  │  │  └─ theme
│  │  ├─ routes
│  │  ├─ usecase
│  │  └─ util
│  ├─ data
│  │  ├─ datasources
│  │  │  ├─ local
│  │  │  │  └─ mocked_storage
│  │  │  └─ remote
│  │  ├─ models
│  │  └─ repositories
│  ├─ domain
│  │  ├─ client
│  │  │  └─ converters
│  │  ├─ repositories
│  │  └─ usecases
│  ├─ main.dart
│  └─ presentation
│     ├─ blocs
│     │  ├─ device
│     │  ├─ routines
│     │  └─ weather
│     ├─ pages
│     │  ├─ dashboard
│     │  ├─ devices
│     │  │  ├─ create_device
│     │  │  ├─ device_detail
│     │  ├─ error_screen
│     │  ├─ menu
│     │  └─ routines
│     │     ├─ create_routines
│     │     ├─ routines_detail
│     └─ widgets
│        ├─ common
│        ├─ dashboard
│        └─ routines
└─ test
   └─ weather

```


**State Management** : BLoC
**Network Client** Chopper
**Local Storage** Hive

---
**Services:**
- Weather : ([openweathermap](https://openweathermap.org/api))
- Mock Data Service from Local Storage (Devices and Routines)


**Localizations:**
Localizations not implemented but you can implement localizations easily according the example in localization folder. 

**Tests:**
- Weather Repository test

**Installation:**
-
- `git clone https://github.com/bedirhankaraON/Smart-Home-Mobile-Application.git`
- run `flutter pub get`
- If API key expired, you can get a new API key from the ([openweathermap](https://openweathermap.org/api)) for free. You can add the new key to .env .
- Then `flutter run`

**For Tests:**
- run `flutter test`

