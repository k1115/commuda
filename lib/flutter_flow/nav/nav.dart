import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

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
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomeWidget() : OnboardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeWidget() : OnboardingWidget(),
        ),
        FFRoute(
          name: OnboardingWidget.routeName,
          path: OnboardingWidget.routePath,
          builder: (context, params) => OnboardingWidget(),
        ),
        FFRoute(
          name: ForgotEmailWidget.routeName,
          path: ForgotEmailWidget.routePath,
          builder: (context, params) => ForgotEmailWidget(),
        ),
        FFRoute(
          name: ForgotPasswordWidget.routeName,
          path: ForgotPasswordWidget.routePath,
          builder: (context, params) => ForgotPasswordWidget(),
        ),
        FFRoute(
          name: PasswordResetWidget.routeName,
          path: PasswordResetWidget.routePath,
          builder: (context, params) => PasswordResetWidget(),
        ),
        FFRoute(
          name: PasswordVerifyCodeWidget.routeName,
          path: PasswordVerifyCodeWidget.routePath,
          builder: (context, params) => PasswordVerifyCodeWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CommunityWidget.routeName,
          path: CommunityWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CommunityWidget(),
        ),
        FFRoute(
          name: TaskWidget.routeName,
          path: TaskWidget.routePath,
          builder: (context, params) => TaskWidget(),
        ),
        FFRoute(
          name: MessageWidget.routeName,
          path: MessageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => MessageWidget(),
        ),
        FFRoute(
          name: MyPageWidget.routeName,
          path: MyPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => MyPageWidget(),
        ),
        FFRoute(
          name: InformationWidget.routeName,
          path: InformationWidget.routePath,
          requireAuth: true,
          builder: (context, params) => InformationWidget(),
        ),
        FFRoute(
          name: RankingWidget.routeName,
          path: RankingWidget.routePath,
          requireAuth: true,
          builder: (context, params) => RankingWidget(
            friendList: params.getParam<int>(
              'friendList',
              ParamType.int,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: SoaringCommunitiesWidget.routeName,
          path: SoaringCommunitiesWidget.routePath,
          requireAuth: true,
          builder: (context, params) => SoaringCommunitiesWidget(
            friendList: params.getParam<int>(
              'friendList',
              ParamType.int,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: NewCommunitiesWidget.routeName,
          path: NewCommunitiesWidget.routePath,
          requireAuth: true,
          builder: (context, params) => NewCommunitiesWidget(
            friendList: params.getParam<int>(
              'friendList',
              ParamType.int,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: DigestingCommunitiesWidget.routeName,
          path: DigestingCommunitiesWidget.routePath,
          requireAuth: true,
          builder: (context, params) => DigestingCommunitiesWidget(
            friendList: params.getParam<int>(
              'friendList',
              ParamType.int,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: FriendInCommunitiesWidget.routeName,
          path: FriendInCommunitiesWidget.routePath,
          requireAuth: true,
          builder: (context, params) => FriendInCommunitiesWidget(
            friendList: params.getParam<int>(
              'friendList',
              ParamType.int,
              isList: true,
            ),
            communityList: params.getParam<int>(
              'communityList',
              ParamType.int,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: InformationDetailWidget.routeName,
          path: InformationDetailWidget.routePath,
          requireAuth: true,
          builder: (context, params) => InformationDetailWidget(
            informationId: params.getParam(
              'informationId',
              ParamType.int,
            ),
            previousPath: params.getParam(
              'previousPath',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CommunityCreateWidget.routeName,
          path: CommunityCreateWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CommunityCreateWidget(),
        ),
        FFRoute(
          name: CommunityMemberManageWidget.routeName,
          path: CommunityMemberManageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CommunityMemberManageWidget(
            community: params.getParam<CommunityWithImageRow>(
              'community',
              ParamType.SupabaseRow,
            ),
            currentUserId: params.getParam(
              'currentUserId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: CommunityEditWidget.routeName,
          path: CommunityEditWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CommunityEditWidget(
            community: params.getParam<CommunityWithImageRow>(
              'community',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: CommunityDetailWidget.routeName,
          path: CommunityDetailWidget.routePath,
          builder: (context, params) => CommunityDetailWidget(
            community: params.getParam<CommunityWithImageRow>(
              'community',
              ParamType.SupabaseRow,
            ),
            isShow: params.getParam(
              'isShow',
              ParamType.bool,
            ),
            isInvite: params.getParam(
              'isInvite',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CommunityThreadDetailWidget.routeName,
          path: CommunityThreadDetailWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CommunityThreadDetailWidget(
            thread: params.getParam<CommunityThreadDetailsRow>(
              'thread',
              ParamType.SupabaseRow,
            ),
            previousPath: params.getParam(
              'previousPath',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CommunityThreadCreateWidget.routeName,
          path: CommunityThreadCreateWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CommunityThreadCreateWidget(),
        ),
        FFRoute(
          name: NewsWidget.routeName,
          path: NewsWidget.routePath,
          builder: (context, params) => NewsWidget(),
        ),
        FFRoute(
          name: NewsOperationWidget.routeName,
          path: NewsOperationWidget.routePath,
          builder: (context, params) => NewsOperationWidget(
            announcement: params.getParam<UserAnnouncementsViewRow>(
              'announcement',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: MessageDetailWidget.routeName,
          path: MessageDetailWidget.routePath,
          requireAuth: true,
          builder: (context, params) => MessageDetailWidget(
            chatRoom: params.getParam<ChatroomOverviewRow>(
              'chatRoom',
              ParamType.SupabaseRow,
            ),
            targetUser: params.getParam<UserWithProfileRow>(
              'targetUser',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: UserWidget.routeName,
          path: UserWidget.routePath,
          builder: (context, params) => UserWidget(
            targetUser: params.getParam<UserWithProfileRow>(
              'targetUser',
              ParamType.SupabaseRow,
            ),
            currentUserId: params.getParam(
              'currentUserId',
              ParamType.int,
            ),
            communityId: params.getParam(
              'communityId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: ActionWidget.routeName,
          path: ActionWidget.routePath,
          builder: (context, params) => ActionWidget(),
        ),
        FFRoute(
          name: PointWidget.routeName,
          path: PointWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PointWidget(
            currentUserId: params.getParam(
              'currentUserId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: BookMarkWidget.routeName,
          path: BookMarkWidget.routePath,
          requireAuth: true,
          builder: (context, params) => BookMarkWidget(
            currentUserId: params.getParam(
              'currentUserId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: FaqWidget.routeName,
          path: FaqWidget.routePath,
          builder: (context, params) => FaqWidget(),
        ),
        FFRoute(
          name: InquiryWidget.routeName,
          path: InquiryWidget.routePath,
          builder: (context, params) => InquiryWidget(),
        ),
        FFRoute(
          name: TermOfUseWidget.routeName,
          path: TermOfUseWidget.routePath,
          builder: (context, params) => TermOfUseWidget(),
        ),
        FFRoute(
          name: NotationWidget.routeName,
          path: NotationWidget.routePath,
          builder: (context, params) => NotationWidget(),
        ),
        FFRoute(
          name: PrivatePolicesWidget.routeName,
          path: PrivatePolicesWidget.routePath,
          builder: (context, params) => PrivatePolicesWidget(),
        ),
        FFRoute(
          name: FootPrintWidget.routeName,
          path: FootPrintWidget.routePath,
          builder: (context, params) => FootPrintWidget(),
        ),
        FFRoute(
          name: SettingWidget.routeName,
          path: SettingWidget.routePath,
          builder: (context, params) => SettingWidget(),
        ),
        FFRoute(
          name: ChangeMailAddressWidget.routeName,
          path: ChangeMailAddressWidget.routePath,
          builder: (context, params) => ChangeMailAddressWidget(),
        ),
        FFRoute(
          name: ProfileEditWidget.routeName,
          path: ProfileEditWidget.routePath,
          builder: (context, params) => ProfileEditWidget(),
        ),
        FFRoute(
          name: IconBadgeWidget.routeName,
          path: IconBadgeWidget.routePath,
          builder: (context, params) => IconBadgeWidget(
            profile: params.getParam<ProfileRow>(
              'profile',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: ProfileBadgeWidget.routeName,
          path: ProfileBadgeWidget.routePath,
          builder: (context, params) => ProfileBadgeWidget(
            profile: params.getParam<ProfileRow>(
              'profile',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: AboutWidget.routeName,
          path: AboutWidget.routePath,
          builder: (context, params) => AboutWidget(),
        ),
        FFRoute(
          name: HomeWidget.routeName,
          path: HomeWidget.routePath,
          requireAuth: true,
          builder: (context, params) => HomeWidget(),
        ),
        FFRoute(
          name: EventWidget.routeName,
          path: EventWidget.routePath,
          builder: (context, params) => EventWidget(),
        ),
        FFRoute(
          name: InvitePageWidget.routeName,
          path: InvitePageWidget.routePath,
          builder: (context, params) => InvitePageWidget(
            inviteCode: params.getParam(
              'inviteCode',
              ParamType.String,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
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
            return '/onboarding';
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
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Splash.png',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

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

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
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
