# Day 24 - Firebase Email & Password Authentication (GetX + MVC)

## Setup
1. `flutter pub get`
2. In your existing Firebase project (console.firebase.google.com):
   - Authentication -> Sign-in method -> enable Email/Password
   - Firestore Database should already exist (from the CRUD task) - a `users` collection will be used here too
3. Connect this project to that Firebase project if not already done:
   - `dart pub global activate flutterfire_cli` (once)
   - `flutterfire configure` from this project's root, select your existing Firebase project
   - This generates `lib/firebase_options.dart`
   - Update `main.dart`: add `import 'firebase_options.dart';` and change
     `await Firebase.initializeApp();` to
     `await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);`
4. `flutter run`

## What changed from the mock version
- `services/auth_service.dart` (new) - all Firebase Auth + Firestore calls live here:
  - `signUp()` creates the account, sets the display name, saves name/email to
    Firestore under `users/{uid}`, then signs the user out (so Sign Up -> Login,
    not straight into Home, matching the task flow)
  - `login()` signs in and pulls the saved name from Firestore
  - `logout()` signs out of Firebase
  - `mapError()` turns FirebaseAuthException codes (wrong-password,
    email-already-in-use, user-not-found, weak-password, etc.) into readable
    messages
- `controllers/auth_controller.dart` - same public API as before (login(),
  signup(), logout()), but now calls AuthService and catches
  FirebaseAuthException instead of faking a delay. Validation (empty fields,
  email format, password length, matching confirm password) still happens
  here before Firebase is ever called.
- `models/user_model.dart` - added `uid` and Firestore `toMap`/`fromMap`
- `main.dart` - initializes Firebase before the app runs
- Views (`login_view.dart`, `signup_view.dart`, `home_view.dart`) - unchanged,
  since all Firebase logic stays out of the View per the task requirements

## Flow
Sign Up -> Firebase createUserWithEmailAndPassword -> Firestore user doc saved
-> signed out -> Login screen
Login -> Firebase signInWithEmailAndPassword -> Home screen
Logout (Home screen button) -> Firebase signOut -> Login screen, and
`Get.offAllNamed` clears the navigation stack so the back button can't return
to Home after logging out.
