# Yagodka Android Client

Android-клиент Ягодки: Capacitor shell поверх общего web runtime. Серверная часть не входит в этот репозиторий.

## Что внутри

- `src/`, `public/`, `scripts/` - общий клиентский UI/runtime и сборка web assets.
- `capacitor.config.ts` - Capacitor конфигурация приложения.
- `android/` - native Android workspace.
- `test/` - web + Android/Capacitor regression tests.

## Команды

```bash
npm install
npm run typecheck
npm run test
npm run android:sync
```

Собрать debug APK:

```bash
npm run android:build:debug
```

APK после успешной сборки:

```text
android/app/build/outputs/apk/debug/app-debug.apk
```

## Требования Android

- JDK 21 или новее.
- Android Studio или Android SDK command-line tools.
- Android SDK Platform 36.
- `ANDROID_HOME` или `ANDROID_SDK_ROOT`.
- Доступ к `google()` и `mavenCentral()` для Gradle dependencies.

## Runtime

По умолчанию Android WebView использует production endpoints:

- gateway: `wss://yagodka.org/ws`
- public base: `https://yagodka.org/`
- meet: `https://meet.yagodka.org`

Service Worker в Capacitor runtime отключён: Android получает обновления через новую APK/AAB сборку.

## License

GPL-3.0-or-later. См. `LICENSE`.
