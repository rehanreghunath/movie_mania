# run script to clean and rebuild application

flutter clean
flutter pub get
cd android && ./gradlew clean
flutter run
