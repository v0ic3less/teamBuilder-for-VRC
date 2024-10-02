import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const HomePageWidget() : const EntryWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const HomePageWidget() : const EntryWidget(),
          routes: [
            FFRoute(
              name: 'HomePage',
              path: 'home',
              requireAuth: true,
              builder: (context, params) => HomePageWidget(
                from: params.getParam(
                  'from',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'login',
              path: 'login',
              builder: (context, params) => const LoginWidget(),
            ),
            FFRoute(
              name: 'settings',
              path: 'settings',
              requireAuth: true,
              builder: (context, params) => const SettingsWidget(),
            ),
            FFRoute(
              name: 'loading',
              path: 'loading',
              requireAuth: true,
              builder: (context, params) => LoadingWidget(
                loadName: params.getParam(
                  'loadName',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'createaccount',
              path: 'createaccount',
              builder: (context, params) => const CreateaccountWidget(),
            ),
            FFRoute(
              name: 'AccountCreation2',
              path: 'accountCreation2',
              requireAuth: true,
              builder: (context, params) => const AccountCreation2Widget(),
            ),
            FFRoute(
              name: 'settings-general',
              path: 'settingsGeneral',
              requireAuth: true,
              builder: (context, params) => const SettingsGeneralWidget(),
            ),
            FFRoute(
              name: 'settings-yourteam',
              path: 'settingsYourteam',
              requireAuth: true,
              builder: (context, params) => const SettingsYourteamWidget(),
            ),
            FFRoute(
              name: 'settings-notifications',
              path: 'settingsNotifications',
              requireAuth: true,
              builder: (context, params) => const SettingsNotificationsWidget(),
            ),
            FFRoute(
              name: 'chat_2_Details',
              path: 'chat2Details',
              requireAuth: true,
              asyncParams: {
                'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
              },
              builder: (context, params) => Chat2DetailsWidget(
                chatRef: params.getParam(
                  'chatRef',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'Messages',
              path: 'messages',
              requireAuth: true,
              builder: (context, params) => MessagesWidget(
                from: params.getParam(
                  'from',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'image_Details',
              path: 'imageDetails',
              requireAuth: true,
              asyncParams: {
                'chatMessage':
                    getDoc(['chat_messages'], ChatMessagesRecord.fromSnapshot),
              },
              builder: (context, params) => ImageDetailsWidget(
                chatMessage: params.getParam(
                  'chatMessage',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'Capture',
              path: 'capture',
              requireAuth: true,
              builder: (context, params) => const CaptureWidget(),
            ),
            FFRoute(
              name: 'Upgrade',
              path: 'upgrade',
              requireAuth: true,
              builder: (context, params) => const UpgradeWidget(),
            ),
            FFRoute(
              name: 'Schedule',
              path: 'schedule',
              requireAuth: true,
              builder: (context, params) => ScheduleWidget(
                from: params.getParam(
                  'from',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'teamCreation',
              path: 'teamCreation',
              requireAuth: true,
              builder: (context, params) => const TeamCreationWidget(),
            ),
            FFRoute(
              name: 'passwordReset',
              path: 'passwordReset',
              builder: (context, params) => const PasswordResetWidget(),
            ),
            FFRoute(
              name: 'Explore',
              path: 'explore',
              requireAuth: true,
              builder: (context, params) => ExploreWidget(
                from: params.getParam(
                  'from',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'Schedule-EventDetails',
              path: 'scheduleEventDetails',
              requireAuth: true,
              builder: (context, params) => ScheduleEventDetailsWidget(
                teamsMatches: params.getParam(
                  'teamsMatches',
                  ParamType.JSON,
                ),
                eventsMatches: params.getParam(
                  'eventsMatches',
                  ParamType.JSON,
                ),
              ),
            ),
            FFRoute(
              name: 'More',
              path: 'more',
              requireAuth: true,
              builder: (context, params) => MoreWidget(
                from: params.getParam(
                  'from',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'ContentCode',
              path: 'contentCode',
              requireAuth: true,
              builder: (context, params) => const ContentCodeWidget(),
            ),
            FFRoute(
              name: 'TeamContent',
              path: 'content',
              builder: (context, params) => TeamContentWidget(
                teamID: params.getParam(
                  'teamID',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'MatchChecklist',
              path: 'matchChecklist',
              requireAuth: true,
              builder: (context, params) => const MatchChecklistWidget(),
            ),
            FFRoute(
              name: 'JoinTeam',
              path: 'joinTeam',
              requireAuth: true,
              builder: (context, params) => const JoinTeamWidget(),
            ),
            FFRoute(
              name: 'ChooseVerifyMethod',
              path: 'chooseVerifyMethod',
              requireAuth: true,
              builder: (context, params) => const ChooseVerifyMethodWidget(),
            ),
            FFRoute(
              name: 'VerifyWithNotebook',
              path: 'verifyWithNotebook',
              requireAuth: true,
              builder: (context, params) => const VerifyWithNotebookWidget(),
            ),
            FFRoute(
              name: 'VerificationInProgress',
              path: 'verificationInProgress',
              requireAuth: true,
              builder: (context, params) => const VerificationInProgressWidget(),
            ),
            FFRoute(
              name: 'AddTeamMember',
              path: 'addTeamMember',
              requireAuth: true,
              builder: (context, params) => const AddTeamMemberWidget(),
            ),
            FFRoute(
              name: 'VerificationFailed',
              path: 'verificationFailed',
              requireAuth: true,
              builder: (context, params) => const VerificationFailedWidget(),
            ),
            FFRoute(
              name: 'VerifyInProgress-Other',
              path: 'verifyInProgressOther',
              requireAuth: true,
              builder: (context, params) => const VerifyInProgressOtherWidget(),
            ),
            FFRoute(
              name: 'JoinTeamCode',
              path: 'joinTeamCode',
              requireAuth: true,
              builder: (context, params) => const JoinTeamCodeWidget(),
            ),
            FFRoute(
              name: 'VerifyWithPicture',
              path: 'verifyWithPicture',
              requireAuth: true,
              builder: (context, params) => const VerifyWithPictureWidget(),
            ),
            FFRoute(
              name: 'AllTeams',
              path: 'allTeams',
              requireAuth: true,
              builder: (context, params) => const AllTeamsWidget(),
            ),
            FFRoute(
              name: 'To-DoList',
              path: 'toDoList',
              requireAuth: true,
              builder: (context, params) => const ToDoListWidget(),
            ),
            FFRoute(
              name: 'TeamProfile',
              path: 'teamProfile',
              requireAuth: true,
              builder: (context, params) => const TeamProfileWidget(),
            ),
            FFRoute(
              name: 'WelcomeScreen1',
              path: 'welcomeScreen1',
              requireAuth: true,
              builder: (context, params) => const WelcomeScreen1Widget(),
            ),
            FFRoute(
              name: 'entry',
              path: 'entry',
              builder: (context, params) => const EntryWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/entry';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  child: Center(
                    child: Image.asset(
                      'assets/images/TB-Star-Logo.png',
                      width: MediaQuery.sizeOf(context).width * 0.25,
                      height: MediaQuery.sizeOf(context).height * 0.25,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
