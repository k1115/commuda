import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/common/app_nav_bar/app_nav_bar_widget.dart';
import '/components/drawer/drawer_widget.dart';
import '/components/empty_list_widget.dart';
import '/components/empty_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/components/bottom_sheets/identity_confirmation_bottom_sheet/identity_confirmation_bottom_sheet_widget.dart';
import '/pages/home/components/timeline_item/timeline_item_widget.dart';
import '/pages/home/home_page/friend_list/friend_list_widget.dart';
import '/pages/home/home_page/information_list/information_list_widget.dart';
import '/pages/home/home_page/new_list/new_list_widget.dart';
import '/pages/home/home_page/ranking_list/ranking_list_widget.dart';
import '/pages/home/home_page/soaring_list/soaring_list_widget.dart';
import '/backend/schema/structs/index.dart';
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'Home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userLogins = await UserLoginsTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'user_id',
              FFAppState().userInfo.id,
            )
            .eqOrNull(
              'login_date',
              dateTimeFormat(
                "yyyy/MM/dd",
                getCurrentTimestamp,
                locale: FFLocalizations.of(context).languageCode,
              ),
            ),
      );
      if (!(_model.userLogins != null && (_model.userLogins)!.isNotEmpty)) {
        await UserLoginsTable().insert({
          'user_id': FFAppState().userInfo.id,
          'login_date': dateTimeFormat(
            "yyyy/MM/dd",
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          ),
        });
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter2 ??= Completer<ApiCallResponse>()
            ..complete(SupabaseDBGroup.getCommunityInfoCall.call(
              pUserId: FFAppState().userInfo.id,
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).gray40,
                  ),
                ),
              ),
            ),
          );
        }
        final homeGetCommunityInfoResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            drawer: Container(
              width: 256.0,
              child: Drawer(
                elevation: 16.0,
                child: wrapWithModel(
                  model: _model.drawerModel,
                  updateCallback: () => safeSetState(() {}),
                  child: DrawerWidget(),
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              iconTheme:
                  IconThemeData(color: FlutterFlowTheme.of(context).tertiary),
              automaticallyImplyLeading: false,
              leading: Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                  child: Container(
                    width: 24.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        scaffoldKey.currentState!.openDrawer();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SvgPicture.asset(
                          'assets/images/ic-menu.svg',
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              title: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SvgPicture.asset(
                  'assets/images/community-logo.svg',
                  fit: BoxFit.cover,
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(NewsWidget.routeName);
                    },
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: SvgPicture.asset(
                                'assets/images/ic-bell.svg',
                                width: 24.0,
                                height: 24.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: FutureBuilder<ApiCallResponse>(
                            future: (_model.apiRequestCompleter1 ??=
                                    Completer<ApiCallResponse>()
                                      ..complete(GetunreadcountsCall.call(
                                        memberId: FFAppState().userInfo.id,
                                      )))
                                .future,
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return EmptyLoadingWidget();
                              }
                              final containerGetunreadcountsResponse =
                                  snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(),
                                child: Visibility(
                                  visible: NotificationCountStruct.maybeFromMap(
                                              containerGetunreadcountsResponse
                                                  .jsonBody)
                                          ?.total !=
                                      0,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 20.0, 0.0, 0.0),
                                    child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            getJsonField(
                                              containerGetunreadcountsResponse
                                                  .jsonBody,
                                              r'''$["total"]''',
                                            )?.toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.notoSansJp(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
              child: GestureDetector(
                onPanEnd: (details) async {
                  scaffoldKey.currentState!.openDrawer();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment(0.0, 0),
                                  child: TabBar(
                                    isScrollable: true,
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context).gray80,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts.notoSansJp(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                    unselectedLabelStyle:
                                        FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.notoSansJp(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                    indicatorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    indicatorWeight: 3.0,
                                    tabs: [
                                      Tab(
                                        text: 'ホーム',
                                      ),
                                      Tab(
                                        text: 'タイムライン',
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                    onTap: (i) async {
                                      [() async {}, () async {}][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .gray10,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: RefreshIndicator(
                                            onRefresh: () async {
                                              safeSetState(() => _model
                                                  .apiRequestCompleter2 = null);
                                              await _model
                                                  .waitForApiRequestCompleted2();
                                            },
                                            child: SingleChildScrollView(
                                              physics:
                                                  const AlwaysScrollableScrollPhysics(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  wrapWithModel(
                                                    model: _model
                                                        .informationListModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        InformationListWidget(),
                                                  ),
                                                  Divider(
                                                    height: 2.0,
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .gray10,
                                                  ),
                                                  wrapWithModel(
                                                    model:
                                                        _model.rankingListModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: RankingListWidget(
                                                      friendList: (getJsonField(
                                                        homeGetCommunityInfoResponse
                                                            .jsonBody,
                                                        r'''$["friend_user_ids"]''',
                                                        true,
                                                      ) as List?)!
                                                          .cast<int>(),
                                                    ),
                                                  ),
                                                  Divider(
                                                    height: 2.0,
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .gray10,
                                                  ),
                                                  wrapWithModel(
                                                    model: _model.newListModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: NewListWidget(
                                                      friendList: (getJsonField(
                                                        homeGetCommunityInfoResponse
                                                            .jsonBody,
                                                        r'''$["friend_user_ids"]''',
                                                        true,
                                                      ) as List?)!
                                                          .cast<int>(),
                                                    ),
                                                  ),
                                                  Divider(
                                                    height: 2.0,
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .gray10,
                                                  ),
                                                  wrapWithModel(
                                                    model:
                                                        _model.soaringListModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: SoaringListWidget(
                                                      friendList: (getJsonField(
                                                        homeGetCommunityInfoResponse
                                                            .jsonBody,
                                                        r'''$["friend_user_ids"]''',
                                                        true,
                                                      ) as List?)!
                                                          .cast<int>(),
                                                    ),
                                                  ),
                                                  Divider(
                                                    height: 2.0,
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .gray10,
                                                  ),
                                                  wrapWithModel(
                                                    model:
                                                        _model.friendListModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: FriendListWidget(
                                                      communityIds:
                                                          (getJsonField(
                                                        homeGetCommunityInfoResponse
                                                            .jsonBody,
                                                        r'''$["friends_community_ids"]''',
                                                        true,
                                                      ) as List?)!
                                                              .cast<int>(),
                                                      friendIds: (getJsonField(
                                                        homeGetCommunityInfoResponse
                                                            .jsonBody,
                                                        r'''$["friend_user_ids"]''',
                                                        true,
                                                      ) as List?)!
                                                          .cast<int>(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      StreamBuilder<
                                          List<CommunityThreadDetailsRow>>(
                                        stream: _model
                                                .timeLineContainerSupabaseStream ??=
                                            SupaFlow.client
                                                .from(
                                                    "community_thread_details")
                                                .stream(primaryKey: ['id'])
                                                .inFilterOrNull(
                                                  'community_id',
                                                  (getJsonField(
                                                    homeGetCommunityInfoResponse
                                                        .jsonBody,
                                                    r'''$["my_community_ids"]''',
                                                    true,
                                                  ) as List?)
                                                      ?.cast<int>(),
                                                )
                                                .order('created_at')
                                                .limit(10)
                                                .map((list) => list
                                                    .map((item) =>
                                                        CommunityThreadDetailsRow(
                                                            item))
                                                    .toList()),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return EmptyLoadingWidget();
                                          }
                                          List<CommunityThreadDetailsRow>
                                              timeLineContainerCommunityThreadDetailsRowList =
                                              snapshot.data!;

                                          return Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gray10,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final timeLineContainerVar =
                                                      timeLineContainerCommunityThreadDetailsRowList
                                                          .toList();
                                                  if (timeLineContainerVar
                                                      .isEmpty) {
                                                    return EmptyListWidget(
                                                      text: 'スレッドがありません。',
                                                    );
                                                  }

                                                  return RefreshIndicator(
                                                    onRefresh: () async {
                                                      safeSetState(() => _model
                                                              .apiRequestCompleter1 =
                                                          null);
                                                      await _model
                                                          .waitForApiRequestCompleted1();
                                                    },
                                                    child:
                                                        SingleChildScrollView(
                                                      physics:
                                                          const AlwaysScrollableScrollPhysics(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            timeLineContainerVar
                                                                .length,
                                                            (timeLineContainerVarIndex) {
                                                          final timeLineContainerVarItem =
                                                              timeLineContainerVar[
                                                                  timeLineContainerVarIndex];
                                                          return wrapWithModel(
                                                            model: _model
                                                                .timelineItemModels
                                                                .getModel(
                                                              timeLineContainerVarItem
                                                                  .id!
                                                                  .toString(),
                                                              timeLineContainerVarIndex,
                                                            ),
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                TimelineItemWidget(
                                                              key: Key(
                                                                'Keyrza_${timeLineContainerVarItem.id!.toString()}',
                                                              ),
                                                              thread:
                                                                  timeLineContainerVarItem,
                                                              currentUserId:
                                                                  FFAppState()
                                                                      .userInfo
                                                                      .id,
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(ActionWidget.routeName);
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/btn-floating-action.png',
                                        width: 80.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (FFAppState().userInfo.phone != '') {
                                        context.pushNamed(
                                            CommunityThreadCreateWidget
                                                .routeName);
                                      } else {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child:
                                                    IdentityConfirmationBottomSheetWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        if (FFAppState().userInfo.phone != '') {
                                          context.goNamed(
                                              CommunityThreadCreateWidget
                                                  .routeName);
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: 48.0,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 8.0,
                                            color: Color(0x40656565),
                                            offset: Offset(
                                              0.0,
                                              0.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: SvgPicture.asset(
                                            'assets/images/ic-plus-white.svg',
                                            width: 40.0,
                                            height: 40.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    wrapWithModel(
                      model: _model.appNavBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: AppNavBarWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
