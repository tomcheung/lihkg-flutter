# lihkg_flutter

A LIHKG client app written in Flutter.

## About

![Image](readme/screenshot_desktop.png?)

A project to explore the possibility with Flutter using real use case,
currently this project support following features

- Responsive layout: support Desktop / Tablet / Mobile layout
- Theming (Light / Dark mode)

## Desktop platform support

This project support run in macOS desktop, you may need enable desktop support features in Flutter SDK with following command
```
flutter config --enable-macos-desktop
```

## Web support

Due to CORS restriction in LIHKG api, currently the app didn't support running in Web browser because it cannot connect the api

Reference: 
https://stackoverflow.com/questions/67253808/xmlhttprequest-error-while-using-http-post-flutter-web
