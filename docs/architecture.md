# Easy SMI — Architecture Overview

This document summarizes the app’s structure, conventions, and key integration points to help you navigate and extend the codebase quickly.

## Stack

- Framework: Flutter (Dart SDK ^3.8.0)
- State management: flutter_bloc + Freezed
- Routing: auto_route (codegen)
- DI/Service locator: get_it
- HTTP: dio (+ PrettyDioLogger in debug)
- Connectivity: connectivity_plus
- Local storage: shared_preferences
- Env/Flavors: flutter_dotenv + flavor
- UI: Google Fonts, Responsive Framework, flutter_svg, FlutterGen (assets)
- i18n: Flutter gen-l10n (ARB -> generated Dart files)

## High-level flow

- Entrypoint: `lib/main.dart`
  - Initializes env via `EnvManager().init(env: Environment.dev)`
  - Registers BLoCs and services via `lib/injection_container.dart`
  - Sets system UI style and runs `App`

- App shell: `lib/src/presentation/app.dart`
  - Uses `MaterialApp.router` with `AppRouter` (auto_route) for navigation
  - Provides global `ConnectedBloc` and listens for connectivity changes
  - Sets localization delegates, supported locales (en, fr), default `locale: fr`
  - Wraps UI with `ResponsiveBreakpoints.builder`

- Initial route: `SplashPage` (`/`), then navigates to `HomeRoute` (or login later)

## Layers and conventions

- Presentation: `lib/src/presentation/**`
  - Pages use `@RoutePage()` and define a `static const routeName`
  - Common theming in `_commons/theming/*` and widgets in `_commons_widgets/*`
  - Router: `_commons/route/app_router.dart` (source) and `app_router.gr.dart` (generated)

- Application (BLoC): `lib/src/application/**`
  - Feature-first folders (auth, splash, connected)
  - Events/States generated with Freezed (e.g., `*_bloc.freezed.dart`)

- Domain: `lib/src/domain/**`
  - Business contracts (e.g., `IAuthRepository`) and value objects
  - Failures modeled with Freezed unions

- Infrastructure: `lib/src/infrastructure/**`
  - Network: Dio client config, interceptors, requests wrapper
  - Auth: remote/local data sources, DTOs, repository implementation

- Dependency Injection: `lib/injection_container.dart`
  - Registers core singletons/factories (Connectivity, UserSession, SharedPreferences, AppRequests)
  - Wires repositories and blocs

## Routing

- Config: `lib/src/presentation/_commons/route/app_router.dart`
- Generated: `app_router.gr.dart` via `auto_route_generator`
- Usage examples:
  - Navigate: `context.router.push(const HomeRoute());`
  - Replace stack: `context.router.replaceAll([const LoginRoute()]);`

## Networking

- Base client: `AppHttpService` constructs a single Dio instance with:
  - Base URL from `RequestUrl().apiUrl` (see below)
  - Timeouts, validation, interceptors (`RequestHeaderInterceptorJsonImpl`)
  - Pretty logs in debug
- Request wrapper: `IAppRequests` in `app_requests.dart` for GET/POST/... abstractions
- Connectivity check via `INetworkInfo` -> `NetworkInfo`

## Environment/Flavors

- Manager: `EnvManager` reads `.dev/.stage/.prod` from `assets/env/`
- Keys exposed: `NAME`, `BASE_URL`, `SANDBOX`, `KKIAPAY_KEY` (if present)
- Switch env at runtime by logging in with email `EnvManager.emailEnv` and password equal to an `Environment` name (`dev|stage|prod`)
- Flavor mapping provided via `getFlavorEnv()`

## Localization (i18n)

- ARB files: `lib/l10n/app_fr.arb`, `lib/l10n/app_en.arb`
- Generated delegates/classes: `lib/l10n/app_localizations*.dart`
- Configure via `l10n.yaml` and `flutter: generate: true`
- Access strings: `AppLocalizations.of(context)!.title`

## Assets

- Declared in `pubspec.yaml` under `flutter/assets`
- FlutterGen generates `lib/gen/assets.gen.dart` for typesafe access
- Example: `Assets.images.onboarding1.image()` or `Assets.svgs.menu.svg()`

## Platform setup

- Android: `android/app/src/main/AndroidManifest.xml` (label: EasySMI, icon from launcher_icon)
- iOS: `ios/Runner/Info.plist` (DisplayName EasySMI, LaunchScreen/Main storyboards)
- Splash: configured via `flutter_native_splash.yaml`
- App icons: configured via `flutter_launcher_icons.yaml`

## Adding a new feature (contract)

- UI: add a page under `lib/src/presentation/<feature>/<page>.dart`
  - Annotate with `@RoutePage()` and expose `routeName`
  - Register route in `app_router.dart`, then run codegen
- State: add a BLoC under `lib/src/application/<feature>/`
  - Define events/states using Freezed, connect to repository
- Domain: define interfaces/value objects in `lib/src/domain/<feature>/`
- Data: implement data sources and repositories under `lib/src/infrastructure/<feature>/`
- DI: register your bloc/repository in `lib/injection_container.dart`

## Code generation

- Run build when changing routes, Freezed, or serializable DTOs:
  - `dart run build_runner build --delete-conflicting-outputs`

## Notes/TODOs

- `assets/env/*.env` currently have empty `BASE_URL`; set appropriate endpoints.
- Ensure `RequestUrl().apiUrl` reflects `EnvManager.getBaseUrl()` (verify mapping in `request_url.dart`).
- Integrate real auth flows in `SplashBloc` (token presence -> home/login).

---
This overview should be enough to quickly answer “where do I add X?” and “how does Y work?” in future requests.
