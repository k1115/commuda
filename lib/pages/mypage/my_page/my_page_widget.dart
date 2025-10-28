import '/backend/supabase/supabase.dart';
import '/components/common/app_nav_bar/app_nav_bar_widget.dart';
import '/components/drawer/drawer_widget.dart';
import '/components/empty_list_widget.dart';
import '/components/empty_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/community/components/user_community/user_community_widget.dart';
import '/pages/home/user/components/badge_item/badge_item_widget.dart';
import '/pages/home/user/components/friend_item/friend_item_widget.dart';
import '/index.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'my_page_model.dart';
export 'my_page_model.dart';

class MyPageWidget extends StatefulWidget {
  const MyPageWidget({super.key});

  static String routeName = 'MyPage';
  static String routePath = '/myPage';

  @override
  State<MyPageWidget> createState() => _MyPageWidgetState();
}

class _MyPageWidgetState extends State<MyPageWidget>
    with TickerProviderStateMixin {
  late MyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return FutureBuilder<List<ProfileWithDetailRow>>(
      future:
          (_model.requestCompleter3 ??= Completer<List<ProfileWithDetailRow>>()
                ..complete(ProfileWithDetailTable().querySingleRow(
                  queryFn: (q) => q.eqOrNull(
                    'user_id',
                    FFAppState().userInfo.id,
                  ),
                )))
              .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ProfileWithDetailRow> myPageProfileWithDetailRowList =
            snapshot.data!;

        final myPageProfileWithDetailRow =
            myPageProfileWithDetailRowList.isNotEmpty
                ? myPageProfileWithDetailRowList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            drawer: Drawer(
              elevation: 16.0,
              child: wrapWithModel(
                model: _model.drawerModel,
                updateCallback: () => safeSetState(() {}),
                child: DrawerWidget(),
              ),
            ),
            body: NestedScrollView(
              floatHeaderSlivers: false,
              headerSliverBuilder: (context, _) => [
                SliverAppBar(
                  expandedHeight: 300.0,
                  pinned: false,
                  floating: false,
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  automaticallyImplyLeading: false,
                  actions: [],
                  flexibleSpace: FlexibleSpaceBar(
                    title: Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            children: [
                              Builder(
                                builder: (context) {
                                  if (myPageProfileWithDetailRow?.coverImage !=
                                          null &&
                                      myPageProfileWithDetailRow?.coverImage !=
                                          '') {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: OctoImage(
                                        placeholderBuilder: (_) =>
                                            SizedBox.expand(
                                          child: Image(
                                            image:
                                                BlurHashImage('BlurHashString'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        image: NetworkImage(
                                          myPageProfileWithDetailRow!
                                              .coverImage!,
                                        ),
                                        width: double.infinity,
                                        height: 125.0,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/image-cover.png',
                                        width: double.infinity,
                                        height: 125.0,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  }
                                },
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        scaffoldKey.currentState!.openDrawer();
                                      },
                                      child: Container(
                                        width: 32.0,
                                        height: 32.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x66000000),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        child: Icon(
                                          Icons.menu,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 20.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 80.0, 0.0, 0.0),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 30.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(16.0),
                                            topRight: Radius.circular(16.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 40.0, 8.0, 8.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      FFAppState()
                                                          .userInfo
                                                          .name
                                                          .maybeHandleOverflow(
                                                            maxChars: 10,
                                                            replacement: '…',
                                                          ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .notoSansJp(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        context.goNamed(
                                                            ProfileEditWidget
                                                                .routeName);
                                                      },
                                                      text: 'プロフィール編集',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansJp(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gray20,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    myPageProfileWithDetailRow
                                                        ?.description,
                                                    '未設定',
                                                  ),
                                                  maxLines: 5,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansJp(
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
                                                        letterSpacing: 0.0,
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
                                                ),
                                              ].divide(SizedBox(height: 8.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 64.0,
                                        height: 64.0,
                                        child: Stack(
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                if (myPageProfileWithDetailRow
                                                            ?.profileImage !=
                                                        null &&
                                                    myPageProfileWithDetailRow
                                                            ?.profileImage !=
                                                        '') {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                64.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                64.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                64.0),
                                                        topRight:
                                                            Radius.circular(
                                                                64.0),
                                                      ),
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width: 64.0,
                                                      height: 64.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        myPageProfileWithDetailRow!
                                                            .profileImage!,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  return Container(
                                                    width: 64.0,
                                                    height: 64.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                64.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                64.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                64.0),
                                                        topRight:
                                                            Radius.circular(
                                                                64.0),
                                                      ),
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width: 64.0,
                                                      height: 64.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.asset(
                                                        'assets/images/image-profile.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: Builder(
                                                builder: (context) {
                                                  if (myPageProfileWithDetailRow
                                                              ?.iconBadgeUrl !=
                                                          null &&
                                                      myPageProfileWithDetailRow
                                                              ?.iconBadgeUrl !=
                                                          '') {
                                                    return Container(
                                                      width: 28.0,
                                                      height: 28.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        myPageProfileWithDetailRow!
                                                            .iconBadgeUrl!,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    );
                                                  } else {
                                                    return Container(
                                                      width: 0.0,
                                                      height: 0.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    centerTitle: true,
                    expandedTitleScale: 1.0,
                  ),
                  elevation: 0.0,
                )
              ],
              body: Builder(
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment(-1.0, 0),
                                  child: TabBar(
                                    isScrollable: true,
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
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
                                        text: 'コミュニティ',
                                      ),
                                      Tab(
                                        text: 'フレンド(${valueOrDefault<String>(
                                          myPageProfileWithDetailRow
                                              ?.friendCount
                                              ?.toString(),
                                          '0',
                                        )})',
                                      ),
                                      Tab(
                                        text:
                                            'バッジ(${myPageProfileWithDetailRow?.profileBadges.length.toString()})',
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                    onTap: (i) async {
                                      [
                                        () async {},
                                        () async {},
                                        () async {}
                                      ][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    children: [
                                      FutureBuilder<List<CommunityMembersRow>>(
                                        future: (_model.requestCompleter2 ??=
                                                Completer<
                                                    List<CommunityMembersRow>>()
                                                  ..complete(
                                                      CommunityMembersTable()
                                                          .queryRows(
                                                    queryFn: (q) => q
                                                        .eqOrNull(
                                                          'user_id',
                                                          FFAppState()
                                                              .userInfo
                                                              .id,
                                                        )
                                                        .eqOrNull(
                                                          'participate_status',
                                                          1,
                                                        )
                                                        .order('created_at'),
                                                  )))
                                            .future,
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return EmptyLoadingWidget();
                                          }
                                          List<CommunityMembersRow>
                                              communityContainerCommunityMembersRowList =
                                              snapshot.data!;

                                          return Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gray10,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final containerVar =
                                                      communityContainerCommunityMembersRowList
                                                          .map((e) =>
                                                              e.communityId)
                                                          .toList()
                                                          .unique((e) => e)
                                                          .toList();
                                                  if (containerVar.isEmpty) {
                                                    return EmptyLoadingWidget();
                                                  }

                                                  return RefreshIndicator(
                                                    onRefresh: () async {
                                                      safeSetState(() => _model
                                                              .requestCompleter2 =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted2();
                                                    },
                                                    child:
                                                        SingleChildScrollView(
                                                      physics:
                                                          const AlwaysScrollableScrollPhysics(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            containerVar.length,
                                                            (containerVarIndex) {
                                                          final containerVarItem =
                                                              containerVar[
                                                                  containerVarIndex];
                                                          return FutureBuilder<
                                                              List<
                                                                  CommunityWithImageRow>>(
                                                            future: CommunityWithImageTable()
                                                                .querySingleRow(
                                                              queryFn: (q) =>
                                                                  q.eqOrNull(
                                                                'id',
                                                                containerVarItem,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return EmptyLoadingWidget();
                                                              }
                                                              List<CommunityWithImageRow>
                                                                  userCommunityCommunityWithImageRowList =
                                                                  snapshot
                                                                      .data!;

                                                              final userCommunityCommunityWithImageRow =
                                                                  userCommunityCommunityWithImageRowList
                                                                          .isNotEmpty
                                                                      ? userCommunityCommunityWithImageRowList
                                                                          .first
                                                                      : null;

                                                              return wrapWithModel(
                                                                model: _model
                                                                    .userCommunityModels
                                                                    .getModel(
                                                                  containerVarItem
                                                                      .toString(),
                                                                  containerVarIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    UserCommunityWidget(
                                                                  key: Key(
                                                                    'Keyrtq_${containerVarItem.toString()}',
                                                                  ),
                                                                  community:
                                                                      userCommunityCommunityWithImageRow,
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }).divide(SizedBox(
                                                            height: 2.0)),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      FutureBuilder<
                                          List<FriendsProfileViewRow>>(
                                        future: (_model.requestCompleter1 ??=
                                                Completer<
                                                    List<
                                                        FriendsProfileViewRow>>()
                                                  ..complete(
                                                      FriendsProfileViewTable()
                                                          .queryRows(
                                                    queryFn: (q) => q
                                                        .eqOrNull(
                                                          'user_id',
                                                          FFAppState()
                                                              .userInfo
                                                              .id,
                                                        )
                                                        .ilike(
                                                          'friend_nick_name',
                                                          '%${_model.textController.text}%',
                                                        )
                                                        .order(
                                                            'friend_nick_name'),
                                                  )))
                                            .future,
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return EmptyLoadingWidget();
                                          }
                                          List<FriendsProfileViewRow>
                                              friendContainerFriendsProfileViewRowList =
                                              snapshot.data!;

                                          return Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gray10,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (friendContainerFriendsProfileViewRowList
                                                    .isNotEmpty)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    8.0,
                                                                    16.0,
                                                                    8.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textController,
                                                            focusNode: _model
                                                                .textFieldFocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.textController',
                                                              Duration(
                                                                  milliseconds:
                                                                      200),
                                                              () =>
                                                                  safeSetState(
                                                                      () {}),
                                                            ),
                                                            autofocus: false,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .search,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .notoSansJp(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                              hintText:
                                                                  'メンバーを検索',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .notoSansJp(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              filled: true,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .gray10,
                                                              prefixIcon: Icon(
                                                                Icons.search,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansJp(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .textControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final containerVar =
                                                            friendContainerFriendsProfileViewRowList
                                                                .toList();
                                                        if (containerVar
                                                            .isEmpty) {
                                                          return EmptyListWidget(
                                                            text:
                                                                'フレンドの情報がありません',
                                                          );
                                                        }

                                                        return RefreshIndicator(
                                                          onRefresh: () async {
                                                            safeSetState(() =>
                                                                _model.requestCompleter1 =
                                                                    null);
                                                            await _model
                                                                .waitForRequestCompleted1();
                                                          },
                                                          child:
                                                              ListView.builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                containerVar
                                                                    .length,
                                                            itemBuilder: (context,
                                                                containerVarIndex) {
                                                              final containerVarItem =
                                                                  containerVar[
                                                                      containerVarIndex];
                                                              return wrapWithModel(
                                                                model: _model
                                                                    .friendItemModels
                                                                    .getModel(
                                                                  containerVarIndex
                                                                      .toString(),
                                                                  containerVarIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    FriendItemWidget(
                                                                  key: Key(
                                                                    'Key29h_${containerVarIndex.toString()}',
                                                                  ),
                                                                  friend:
                                                                      containerVarItem,
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .gray10,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final profileBadges =
                                                  myPageProfileWithDetailRow
                                                          ?.profileBadges
                                                          .toList() ??
                                                      [];
                                              if (profileBadges.isEmpty) {
                                                return EmptyListWidget(
                                                  text: 'バッジの情報がありません',
                                                );
                                              }

                                              return RefreshIndicator(
                                                onRefresh: () async {
                                                  safeSetState(() =>
                                                      _model.requestCompleter3 =
                                                          null);
                                                  await _model
                                                      .waitForRequestCompleted3();
                                                },
                                                child: GridView.builder(
                                                  padding: EdgeInsets.zero,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 2.0,
                                                    mainAxisSpacing: 2.0,
                                                    childAspectRatio: 1.0,
                                                  ),
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      profileBadges.length,
                                                  itemBuilder: (context,
                                                      profileBadgesIndex) {
                                                    final profileBadgesItem =
                                                        profileBadges[
                                                            profileBadgesIndex];
                                                    return wrapWithModel(
                                                      model: _model
                                                          .badgeItemModels
                                                          .getModel(
                                                        profileBadgesItem
                                                            .toString(),
                                                        profileBadgesIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: BadgeItemWidget(
                                                        key: Key(
                                                          'Keyh0f_${profileBadgesItem.toString()}',
                                                        ),
                                                        badgeID:
                                                            profileBadgesItem,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.appNavBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: AppNavBarWidget(),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
