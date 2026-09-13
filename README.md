# 🔐 Flutter Firebase Authentication App

A complete **Login & Sign Up authentication application** developed during my Flutter internship at **Big Brains**, using **GetX, MVC Architecture, Firebase Authentication, and Cloud Firestore**.

The project started with authentication UI and validation and was extended into a fully functional Firebase-based authentication system.

## 🚀 Features

* 🔑 User Login with Email & Password
* 📝 User Sign Up with Email & Password
* 🚪 Logout functionality
* 👤 User information stored in Cloud Firestore
* ✅ Form validation
* 📧 Email format validation
* 🔒 Password validation
* 🔁 Confirm password validation
* ⚡ GetX reactive state management
* 💬 GetX Snackbars for success and error messages
* 🔄 Loading states during authentication
* 🧭 GetX named-route navigation
* ⚠️ Firebase authentication error handling
* 🏗️ MVC architecture for clean code organization

## 🔥 Authentication Flow

```text
Create Account
      ↓
Firebase Authentication
      ↓
Store User Information
      ↓
Login
      ↓
Home Screen
      ↓
Logout
      ↓
Login
```

## 🛠️ Tech Stack

| Technology              | Purpose                                             |
| ----------------------- | --------------------------------------------------- |
| Flutter                 | Mobile application development                      |
| Dart                    | Programming language                                |
| GetX                    | State management, dependency injection & navigation |
| Firebase Authentication | Email & Password authentication                     |
| Cloud Firestore         | Store user information                              |
| MVC Architecture        | Application structure                               |

## 🏗️ Architecture

The application follows the **MVC (Model-View-Controller)** architecture to keep the UI, business logic, and data handling organized.

```text
lib/
├── controllers/
│   └── auth_controller.dart
│
├── models/
│   └── user_model.dart
│
├── services/
│   └── auth_service.dart
│
├── views/
│   ├── login_view.dart
│   ├── signup_view.dart
│   └── home_view.dart
│
├── routes/
│   └── app_routes.dart
│
└── main.dart
```

> The exact file structure may vary depending on the implementation of the project.

## 🔐 Firebase Integration

The application uses **Firebase Authentication** for secure Email & Password authentication.

After successful registration, user information such as:

* Name
* Email
* UID

is stored in **Cloud Firestore**.

Firebase authentication errors are handled and displayed to the user through GetX feedback messages.

## 💡 What I Learned

One of my biggest takeaways from this project was understanding the importance of separating **UI from business logic**.

By keeping authentication logic inside the Controller and Service layers, Firebase integration became much easier to manage without heavily changing the existing UI structure.

This project helped me understand that **MVC architecture is not only about organizing files**. It also makes an application easier to maintain, extend, and scale.

I also gained practical experience with:

* Firebase Authentication
* Cloud Firestore
* GetX state management
* Dependency injection
* Named-route navigation
* Form validation
* Error handling
* MVC architecture

## 📸 Screenshots

Add screenshots of the application here when available.

Suggested screenshots:

* Login Screen
* Sign Up Screen
* Home Screen
* Logout / Authentication flow

Example:

```markdown
![Login Screen](screenshots/login.png)
![Sign Up Screen](screenshots/signup.png)
![Home Screen](screenshots/home.png)
```

## ⚙️ Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/laibacodes26/flutter-firebase-auth-getx.git
```

### 2. Open the project

```bash
cd flutter-firebase-auth-getx
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Configure Firebase

Connect the Flutter application to your own Firebase project and add the required Firebase configuration files.

For security reasons, project-specific Firebase configuration files should not be committed to the repository.

### 5. Run the application

```bash
flutter run
```

## 📚 Internship Project

This project was developed as part of my **Flutter Internship at Big Brains**.

The internship provided a structured, hands-on learning environment where I worked on real application features and gradually extended them from UI implementations into functional Firebase-powered features.

## 🎯 Project Goal

The main goal of this project was to build a complete authentication flow while applying:

* Clean code practices
* MVC architecture
* GetX state management
* Firebase integration
* Form validation
* Error handling

## 👩‍💻 Developer

**Laiba**

Flutter Developer Intern

## 🙏 Acknowledgements

Thanks to **Big Brains** for providing a structured and hands-on learning path that allowed me to learn Flutter development by building practical features step by step.

---

⭐ If you find this project useful, feel free to explore the repository and follow my Flutter development journey.
