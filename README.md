<p align="center">
  <a href="https://flutter.dev/">
    <img alt="Flutter" src="https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png" width="300" />
  </a>
</p>
<h1 align="center">
  Demonstration
</h1>

# Demonstration App
Demonstration app with split environments

## Important info
- project has written by flutter
- project support `null safety`
- project system (deploy, build, env) build to work with android studio
- env update, build, deploy build with Android Studio configurations
- info: [Android Studio configurations](https://developer.android.com/studio/run/rundebugconfig)
- run from configuration support auto reload (without press `R`)
- Android Studio configurations (further in the text just `configurations`)
- All configuration have support of .env variables
- Read how to add variables to `.env` (important)

## Prerequisites
- check path for ALL configurations (apply configurations)
- check path / options inside env files
- apply ios certificates / profiles to your keychain (double click on each file in `./certificates` folder)

## Installation
- run `flutter pub get`

---

## Run Project
- run dev configuration
- run stage configuration
- run prod configuration

## Run Project (from terminal without env options)
- run `flutter run` (hot reload with `press R`)

## Deploy Project
- change version in `./pubspec.yaml`: `version: 1.0.0+1`
- run one of `deploy dev` configurations
- run one of `deploy stage` configurations

---

## Add new env variable:
- variable should start from "ENV_FLUTTER_"
- add to env files (.env, .env.dev, .env.stage, .env.example)
- add values to `./android/app/build.gradle` dartEnvironmentVariables
- add value to `./ios/Flutter/Defineexample-defaults.xcconfig`
- update all configurations with run `update-env-all` configuration
- if you forgot to run configurations for update and run project, the env variables will be automatically update, but won't be applied for current run

## Build
- change version in `./pubspec.yaml`: `version: 1.0.0+1`
- run one of `build dev` configurations
- run one of `build stage` configurations
- run one of `build prod` configurations

## Build (from terminal without env options)
- change version in `./pubspec.yaml`: `version: 1.0.0+1`
- android: run `flutter build appbundle` (build bundle)
- android run: `flutter build apk --split-per-abi` (build apk)
- file will be: `/build/app/outputs/apk/release/`
- ios: run `flutter build ipa`

## Install (Beta)
- choose android device
- run `flutter install`

---

### Future plans
- update project to use flutter 2.5.0
- add splash screen
- add new functionality

### Secure Files
Files that should be clear / removed if project will be shared (or should be restored if you got project without this files):
- certificates (whole folder)
- android/local.properties
- android/key.properties
- android/upload-keystore.jks
- android/app/src/google-services.json
- ios/Runner/GoogleService/GoogleService-Info-DEV.plist
- ios/Runner/GoogleService/GoogleService-Info-PROD.plist
- ios/Runner/GoogleService/GoogleService-Info-STAGE.plist
- ios/Flutter/Defineexample.xcconfig (if exist)
- fastline/Appfile
- fastline/.env.dev
- fastline/.env.stage
- fastline/.env
- .env
- .env.dev
- .env.stage



