# 📱 MediaHub

A comprehensive Flutter media management application that allows users to view, play, and manage images, videos, audio files, and PDF documents all in one place.

## 🎥 Demo Video

Check out the app in action: [MediaHub Demo Video](https://drive.google.com/file/d/1Vl24xcGmd-uwtg-ahPUFwtT8I1C85o5Q/view?usp=drive_link)

## ✨ Features

### 🖼️ Image Viewer
- Browse and view images from your device
- Support for common image formats
- Intuitive image gallery interface

### 🎬 Video Player
- Play videos with advanced controls
- Built-in video player using `better_player_plus`
- Features include:
  - Play/Pause controls
  - Seek functionality
  - Shuffle mode
  - Loop playback
  - Previous/Next navigation
  - Custom video controls

### 🎵 Audio Player
- Play audio files with full playback controls
- Powered by `just_audio` for high-quality audio playback
- Features include:
  - Play/Pause controls
  - Seek functionality
  - Shuffle mode
  - Loop modes (off, one, all)
  - Previous/Next track navigation
  - Progress tracking

### 📄 PDF Viewer
- View PDF documents seamlessly
- Powered by `syncfusion_flutter_pdfviewer`
- Smooth scrolling and navigation

## 🏗️ Architecture

The app follows **Clean Architecture** principles with a well-organized project structure:

```
lib/
├── core/
│   ├── di/              # Dependency Injection (Service Locator)
│   ├── errors/          # Error handling
│   ├── functions/       # Utility functions
│   ├── helpers/         # Helper classes
│   ├── utils/           # Utilities
│   └── widgets/         # Reusable widgets
├── data/
│   ├── repositories/    # Repository implementations
│   └── services/        # Data services
├── domain/
│   └── repositories/    # Repository interfaces
└── presentation/
    ├── controllers/     # BLoC/Cubit state management
    └── pages/           # UI pages and widgets
```

## 🛠️ Tech Stack

- **Framework**: Flutter 3.10.0-290.4.beta
- **State Management**: BLoC/Cubit (`flutter_bloc`)
- **Dependency Injection**: GetIt
- **Navigation**: Persistent Bottom Navigation Bar
- **Media Players**:
  - Video: `better_player_plus`
  - Audio: `just_audio`
  - PDF: `syncfusion_flutter_pdfviewer`
- **File Handling**: `image_picker`, `file_picker`
- **Code Generation**: `freezed`, `build_runner`

## 📦 Dependencies

### Main Dependencies
```yaml
dependencies:
  flutter_bloc: ^8.1.6
  persistent_bottom_nav_bar: ^6.2.1
  image_picker: ^1.1.2
  file_picker: ^8.1.2
  just_audio: ^0.10.5
  better_player_plus: ^1.1.5
  syncfusion_flutter_pdfviewer: ^31.2.4
  get_it: ^8.2.0
  freezed_annotation: ^3.1.0
  path: ^1.9.0
```

### Dev Dependencies
```yaml
dev_dependencies:
  flutter_lints: ^6.0.0
  build_runner: ^2.7.1
  freezed: ^3.2.3
  flutter_launcher_icons: ^0.14.4
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.10.0-290.4.beta or higher)
- Dart SDK
- Android Studio / VS Code
- Android SDK (for Android development)
- Xcode (for iOS development, macOS only)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd media_hub
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code (Freezed models)**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```


## 🎨 UI/UX Features

- **Persistent Bottom Navigation**: Easy navigation between different media types
- **Material Design 3**: Modern and clean UI
- **Gradient Branding**: Eye-catching gradient app title
- **Custom Icons**: Dedicated icons for each media type
- **Responsive Design**: Adapts to different screen sizes

## 🔧 Configuration

### App Icon
The app uses custom launcher icons configured in `pubspec.yaml`:
```yaml
flutter_launcher_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/images/app_icon.png"
  min_sdk_android: 21
```

To generate new icons:
```bash
flutter pub run flutter_launcher_icons
```

## 🐛 Known Issues & Solutions

### Video Player
- The app uses `better_player_plus` to avoid state management issues with the standard `video_player` package
- Proper disposal of video controllers to prevent memory leaks

### Audio Player
- Manual loop handling for single-track looping to avoid buzzing sounds
- Custom restart mechanism for `LoopMode.one`

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

