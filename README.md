# FitnessApp

# Developer Notes

## Starting Projects

1. Create flutter project `flutter create fitness_app`
2. Run flutter project `flutter run`

## Adding New Fonts

1. Put fonts in assets/fonts/
2. pubspec.yaml

```yaml
fonts:
    - family: Cairo
      fonts:
          - asset: assets/fonts/Cairo-ExtraLight.ttf
            weight: 200
          - asset: assets/fonts/Cairo-Light.ttf
            weight: 300
          - asset: assets/fonts/Cairo-Regular.ttf
            weight: 400
          - asset: assets/fonts/Cairo-Medium.ttf
            weight: 500
          - asset: assets/fonts/Cairo-SemiBold.ttf
            weight: 600
          - asset: assets/fonts/Cairo-Bold.ttf
            weight: 700
          - asset: assets/fonts/Cairo-ExtraBold.ttf
            weight: 800
          - asset: assets/fonts/Cairo-Black.ttf
            weight: 900
```

3. Use them (Eg: fontFamily: 'Cairo', font)

## FlutterFire Setup

FlutterFire is a set of Flutter plugins whch connect your Flutter application to Firebase (https://firebase.flutter.dev/docs/overview/)

1. Install Firebase CLI (https://firebase.google.com/docs/cli#install-cli-windows)
2. Install FlutterFire CLI `dart pub global activate flutterfire_cli`
3. Run `flutterfire configure`
4. Do the configuration (remove iOS if you want)
5. You should have `firebase_options.dart` inside `lib/`
6. Get Firebase Core `flutter pub add firebase_core` (needed dependency in `firebase_options.dart`)`
7. You should have `generated_plugin_registrant.dart` as well
8. Call `Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);` before starting app.

### Cloud Firestore

(https://firebase.google.com/docs/firestore?authuser=0)
Cloud hosted (NoSQL) cloud database to store and sync dataf or client- and server-side development. It's a flexible scalable database for mobile, web, and server development from Firebase and GoogleCloud. Key capabilities: Flexibility, expressive querying, realtime updates, offline support (caches data for you), designed to scale.

Collections:

-   Holds documents

Documents:

-   Is a unit of storage
-   Contains fields which map to values

### Realtime Database

### Firestore vs Realtime

Cloud Firestore is Firebase's newest database for mobile app development. It succeeds Realtime Database and features richer, faster queries and scales further than the Realtime Database.
Database picker quiz: https://firebase.google.com/docs/database/rtdb-vs-firestore?authuser=0
Realtime Database is a heck of a lot easier to implement though.

### Firebase Auth

1. `flutter pub add firebase_auth`
2. See `auth_card.dart` for `FirebaseAuth.instance` examples

## Providers

1. `flutter pub add provider`
2. Create a Provider

```dart
import 'package:flutter/material.dart';

class Sessions with ChangeNotifier {
  List<Session> _sessions = [];

  void addSession(Session session) {
    _sessions.add(session);
    notifyListeners();
  }
}
```

3. return this in runApp(arg): (Sessions is a mixin with ChangeNotifier and fitnessApp is a MaterialApp)

```dart
return MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (context) => Sessions()),
  ],
  child: fitnessApp,
);
```

4. Use your provider:

```dart
Provider.of<Sessions>(context).addSession(sessionArg);
```

5. notifyListeners() will rebuild all places where Provider.of<Sessions> is used.
6. \*Optional: Use Consumer<Sessions> widget where you use the provider in only a part of your widget

## Run Code After initState()

```dart
@override
void initState() {
  super.initState();
  WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    // _navigatePage(context);
  });
}
```
