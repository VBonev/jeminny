cd "$(cd "$(dirname "$0")" && pwd)/.." || exit

flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs