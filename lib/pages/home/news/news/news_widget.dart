import '/backend/supabase/supabase.dart';
import '/components/common/comming_soon/comming_soon_widget.dart';
import '/components/empty_list_widget.dart';
import '/components/empty_loading_widget.dart';
import '/components/participate_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/news/components/news_community_item/news_community_item_widget.dart';
import '/pages/home/news/components/news_friendtem/news_friendtem_widget.dart';
import '/pages/home/news/components/news_operation_item/news_operation_item_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'news_model.dart';
export 'news_model.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({super.key});

  static String routeName = 'News';
  static String routePath = '/news';

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> with TickerProviderStateMixin {
  late NewsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 6,
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).gray10,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.goNamed(HomeWidget.routeName);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SvgPicture.asset(
                  'assets/images/ic-back.svg',
                  width: 32.0,
                  height: 32.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'お知らせ',
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    font: GoogleFonts.notoSansJp(
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleSmall.fontStyle,
                  ),
            ),
            centerTitle: false,
            expandedTitleScale: 1.0,
            titlePadding: EdgeInsetsDirectional.fromSTEB(52.0, 0.0, 0.0, 18.0),
          ),
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: TabBar(
                            isScrollable: true,
                            labelColor:
                                FlutterFlowTheme.of(context).primaryText,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.notoSansJp(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                            unselectedLabelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.notoSansJp(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
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
                                text: '運営',
                              ),
                              Tab(
                                text: 'フレンド申請',
                              ),
                              Tab(
                                text: 'タスク',
                              ),
                              Tab(
                                text: 'イベント',
                              ),
                              Tab(
                                text: '参加申請',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [
                                () async {},
                                () async {},
                                () async {},
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
                              FutureBuilder<
                                  List<CommunityAnnouncementsViewRow>>(
                                future:
                                    CommunityAnnouncementsViewTable().queryRows(
                                  queryFn: (q) => q
                                      .eqOrNull(
                                        'user_id',
                                        FFAppState().userInfo.id,
                                      )
                                      .order('created_at'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return EmptyLoadingWidget();
                                  }
                                  List<CommunityAnnouncementsViewRow>
                                      containerCommunityAnnouncementsViewRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).gray10,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final containerVar =
                                              containerCommunityAnnouncementsViewRowList
                                                  .toList();
                                          if (containerVar.isEmpty) {
                                            return EmptyListWidget(
                                              text: 'お知らせがありません。',
                                            );
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.vertical,
                                            itemCount: containerVar.length,
                                            itemBuilder:
                                                (context, containerVarIndex) {
                                              final containerVarItem =
                                                  containerVar[
                                                      containerVarIndex];
                                              return wrapWithModel(
                                                model: _model
                                                    .newsCommunityItemModels
                                                    .getModel(
                                                  containerVarIndex.toString(),
                                                  containerVarIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: NewsCommunityItemWidget(
                                                  key: Key(
                                                    'Keyex9_${containerVarIndex.toString()}',
                                                  ),
                                                  communityAnnouncements:
                                                      containerVarItem,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                              FutureBuilder<List<UserAnnouncementsViewRow>>(
                                future: UserAnnouncementsViewTable().queryRows(
                                  queryFn: (q) => q
                                      .eqOrNull(
                                        'user_id',
                                        FFAppState().userInfo.id,
                                      )
                                      .ltOrNull(
                                        'scheduled_at',
                                        supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                      )
                                      .order('scheduled_at'),
                                  limit: 10,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return EmptyLoadingWidget();
                                  }
                                  List<UserAnnouncementsViewRow>
                                      containerUserAnnouncementsViewRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).gray10,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final containerVar =
                                              containerUserAnnouncementsViewRowList
                                                  .toList();
                                          if (containerVar.isEmpty) {
                                            return EmptyListWidget(
                                              text: 'お知らせがありません。',
                                            );
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.vertical,
                                            itemCount: containerVar.length,
                                            itemBuilder:
                                                (context, containerVarIndex) {
                                              final containerVarItem =
                                                  containerVar[
                                                      containerVarIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    NewsOperationWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'announcement':
                                                          serializeParam(
                                                        containerVarItem,
                                                        ParamType.SupabaseRow,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: wrapWithModel(
                                                  model: _model
                                                      .newsOperationItemModels
                                                      .getModel(
                                                    containerVarItem.id!
                                                        .toString(),
                                                    containerVarIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      NewsOperationItemWidget(
                                                    key: Key(
                                                      'Keyyfp_${containerVarItem.id!.toString()}',
                                                    ),
                                                    notice: containerVarItem,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                              FutureBuilder<List<FriendRequestsViewRow>>(
                                future: FriendRequestsViewTable().queryRows(
                                  queryFn: (q) => q
                                      .eqOrNull(
                                        'target_id',
                                        FFAppState().userInfo.id,
                                      )
                                      .order('created_at'),
                                  limit: 10,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return EmptyLoadingWidget();
                                  }
                                  List<FriendRequestsViewRow>
                                      containerFriendRequestsViewRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).gray10,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final containerVar =
                                              containerFriendRequestsViewRowList
                                                  .toList();
                                          if (containerVar.isEmpty) {
                                            return EmptyListWidget(
                                              text: 'フレンド申請がありません',
                                            );
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.vertical,
                                            itemCount: containerVar.length,
                                            itemBuilder:
                                                (context, containerVarIndex) {
                                              final containerVarItem =
                                                  containerVar[
                                                      containerVarIndex];
                                              return wrapWithModel(
                                                model: _model
                                                    .newsFriendtemModels
                                                    .getModel(
                                                  containerVarItem.id!
                                                      .toString(),
                                                  containerVarIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: NewsFriendtemWidget(
                                                  key: Key(
                                                    'Keyg78_${containerVarItem.id!.toString()}',
                                                  ),
                                                  friendRequest:
                                                      containerVarItem,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                              wrapWithModel(
                                model: _model.commingSoonModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: CommingSoonWidget(),
                              ),
                              wrapWithModel(
                                model: _model.commingSoonModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: CommingSoonWidget(),
                              ),
                              FutureBuilder<List<CommunitiesRow>>(
                                future: CommunitiesTable().queryRows(
                                  queryFn: (q) => q
                                      .eqOrNull(
                                        'creator_id',
                                        FFAppState().userInfo.id,
                                      )
                                      .neqOrNull(
                                        'privacy_type',
                                        0,
                                      ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<CommunitiesRow>
                                      containerCommunitiesRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).gray10,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: FutureBuilder<
                                          List<CommunityMembersDetailRow>>(
                                        future: CommunityMembersDetailTable()
                                            .queryRows(
                                          queryFn: (q) => q
                                              .inFilterOrNull(
                                                'community_id',
                                                containerCommunitiesRowList
                                                    .map((e) => e.id)
                                                    .toList(),
                                              )
                                              .neqOrNull(
                                                'user_id',
                                                FFAppState().userInfo.id,
                                              )
                                              .order('created_at'),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return EmptyLoadingWidget();
                                          }
                                          List<CommunityMembersDetailRow>
                                              listViewCommunityMembersDetailRowList =
                                              snapshot.data!;

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewCommunityMembersDetailRowList
                                                    .length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewCommunityMembersDetailRow =
                                                  listViewCommunityMembersDetailRowList[
                                                      listViewIndex];
                                              return wrapWithModel(
                                                model: _model
                                                    .participateItemModels
                                                    .getModel(
                                                  listViewCommunityMembersDetailRow
                                                      .id!
                                                      .toString(),
                                                  listViewIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ParticipateItemWidget(
                                                  key: Key(
                                                    'Key9ty_${listViewCommunityMembersDetailRow.id!.toString()}',
                                                  ),
                                                  communityDetail:
                                                      listViewCommunityMembersDetailRow,
                                                ),
                                              );
                                            },
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
