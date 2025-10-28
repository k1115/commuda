import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/common/app_nav_bar/app_nav_bar_widget.dart';
import '/components/common/comming_soon/comming_soon_widget.dart';
import '/components/common/private_thread/private_thread_widget.dart';
import '/components/empty_list_widget.dart';
import '/components/empty_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/detail/components/community_detail_header/community_detail_header_widget.dart';
import '/pages/community/detail/components/community_information/community_information_widget.dart';
import '/pages/community/threads/components/community_thread_header/community_thread_header_widget.dart';
import '/pages/home/components/bottom_sheets/identity_confirmation_bottom_sheet/identity_confirmation_bottom_sheet_widget.dart';
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'community_detail_model.dart';
export 'community_detail_model.dart';

class CommunityDetailWidget extends StatefulWidget {
  const CommunityDetailWidget({
    super.key,
    required this.community,
    bool? isShow,
    bool? isInvite,
  })  : this.isShow = isShow ?? false,
        this.isInvite = isInvite ?? false;

  final CommunityWithImageRow? community;
  final bool isShow;
  final bool isInvite;

  static String routeName = 'CommunityDetail';
  static String routePath = '/communityDetail';

  @override
  State<CommunityDetailWidget> createState() => _CommunityDetailWidgetState();
}

class _CommunityDetailWidgetState extends State<CommunityDetailWidget>
    with TickerProviderStateMixin {
  late CommunityDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((widget.community?.privacyType == 1) ||
          (widget.community?.privacyType == 3)) {
        _model.userOutput = await UsersTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'auth_user_id',
            currentUserUid,
          ),
        );
        _model.memberOutputs = await CommunityMembersTable().queryRows(
          queryFn: (q) => q
              .eqOrNull(
                'community_id',
                widget.community?.id,
              )
              .eqOrNull(
                'user_id',
                _model.userOutput?.firstOrNull?.id,
              )
              .eqOrNull(
                'participate_status',
                1,
              ),
        );
        if (_model.memberOutputs != null &&
            (_model.memberOutputs)!.isNotEmpty) {
          _model.showThread = true;
          safeSetState(() {});
        } else {
          _model.showThread = false;
          safeSetState(() {});
        }
      } else {
        _model.showThread = true;
        safeSetState(() {});
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
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

    return FutureBuilder<List<CommunityThreadDetailsRow>>(
      future: (_model.requestCompleter ??=
              Completer<List<CommunityThreadDetailsRow>>()
                ..complete(CommunityThreadDetailsTable().queryRows(
                  queryFn: (q) => q
                      .eqOrNull(
                        'community_id',
                        widget.community?.id,
                      )
                      .order('created_at'),
                )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).originalColorWhite,
            body: EmptyLoadingWidget(),
          );
        }
        List<CommunityThreadDetailsRow>
            communityDetailCommunityThreadDetailsRowList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).originalColorWhite,
            body: NestedScrollView(
              floatHeaderSlivers: false,
              headerSliverBuilder: (context, _) => [
                SliverAppBar(
                  expandedHeight: 430.0,
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
                          wrapWithModel(
                            model: _model.communityDetailHeaderModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: CommunityDetailHeaderWidget(
                              community: widget.community!,
                              isInvited: widget.isInvite,
                            ),
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
                        child: Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 100.0,
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
                                            labelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            unselectedLabelColor:
                                                FlutterFlowTheme.of(context)
                                                    .gray80,
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
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
                                            unselectedLabelStyle:
                                                FlutterFlowTheme.of(context)
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
                                            indicatorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            indicatorWeight: 3.0,
                                            tabs: [
                                              Tab(
                                                text: 'スレッド',
                                              ),
                                              Tab(
                                                text: 'イベント',
                                              ),
                                              Tab(
                                                text: '基本情報',
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
                                              Builder(
                                                builder: (context) {
                                                  if (widget.isShow) {
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gray10,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final containerVar =
                                                                communityDetailCommunityThreadDetailsRowList
                                                                    .toList();
                                                            if (containerVar
                                                                .isEmpty) {
                                                              return EmptyListWidget(
                                                                text:
                                                                    'スレッドがありません。',
                                                              );
                                                            }

                                                            return RefreshIndicator(
                                                              key: Key(
                                                                  'RefreshIndicator_isrfig5c'),
                                                              onRefresh:
                                                                  () async {
                                                                safeSetState(() =>
                                                                    _model.requestCompleter =
                                                                        null);
                                                                await _model
                                                                    .waitForRequestCompleted();
                                                              },
                                                              child:
                                                                  SingleChildScrollView(
                                                                physics:
                                                                    const AlwaysScrollableScrollPhysics(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List.generate(
                                                                      containerVar
                                                                          .length,
                                                                      (containerVarIndex) {
                                                                    final containerVarItem =
                                                                        containerVar[
                                                                            containerVarIndex];
                                                                    return wrapWithModel(
                                                                      model: _model
                                                                          .communityThreadHeaderModels
                                                                          .getModel(
                                                                        containerVarItem
                                                                            .id!
                                                                            .toString(),
                                                                        containerVarIndex,
                                                                      ),
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          CommunityThreadHeaderWidget(
                                                                        key:
                                                                            Key(
                                                                          'Keyjra_${containerVarItem.id!.toString()}',
                                                                        ),
                                                                        thread:
                                                                            containerVarItem,
                                                                        enableButton:
                                                                            true,
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
                                                  } else {
                                                    return wrapWithModel(
                                                      model: _model
                                                          .privateThreadModel1,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          PrivateThreadWidget(),
                                                    );
                                                  }
                                                },
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .gray10,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: ListView(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          if (widget.isShow) {
                                                            return wrapWithModel(
                                                              model: _model
                                                                  .commingSoonModel,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  CommingSoonWidget(),
                                                            );
                                                          } else {
                                                            return wrapWithModel(
                                                              model: _model
                                                                  .privateThreadModel2,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  PrivateThreadWidget(),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  if (widget.isShow) {
                                                    return RefreshIndicator(
                                                      key: Key(
                                                          'RefreshIndicator_ht12zkmv'),
                                                      onRefresh: () async {
                                                        safeSetState(() => _model
                                                                .requestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForRequestCompleted();
                                                      },
                                                      child: ListView(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .gray10,
                                                            ),
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .communityInformationModel,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  CommunityInformationWidget(
                                                                community: widget
                                                                    .community!,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  } else {
                                                    return Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .privateThreadModel3,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            PrivateThreadWidget(),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 16.0, 16.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    var _shouldSetState = false;
                                    _model.communityMemberOutput =
                                        await CommunityMembersTable().queryRows(
                                      queryFn: (q) => q
                                          .eqOrNull(
                                            'user_id',
                                            FFAppState().userInfo.id,
                                          )
                                          .eqOrNull(
                                            'community_id',
                                            widget.community?.id,
                                          )
                                          .eqOrNull(
                                            'participate_status',
                                            1,
                                          ),
                                    );
                                    _shouldSetState = true;
                                    if (_model.communityMemberOutput != null &&
                                        (_model.communityMemberOutput)!
                                            .isNotEmpty) {
                                      while (true) {
                                        if (FFAppState().userInfo.phone != '') {
                                          FFAppState().selectedCommunity =
                                              widget.community!.id!;
                                          safeSetState(() {});

                                          context.goNamed(
                                              CommunityThreadCreateWidget
                                                  .routeName);

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
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
                                          ).then(
                                              (value) => safeSetState(() {}));

                                          if (FFAppState().userInfo.phone ==
                                                  '') {
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }
                                        }
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'このコミュニティにはスレッドを追加できません。',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .warning,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .warningLight,
                                        ),
                                      );
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  child: Container(
                                    width: 48.0,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
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
