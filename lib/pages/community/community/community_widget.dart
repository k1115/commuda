import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/common/app_nav_bar/app_nav_bar_widget.dart';
import '/components/drawer/drawer_widget.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/components/user_community/user_community_widget.dart';
import '/pages/community/list/components/community_general_list_item/community_general_list_item_widget.dart';
import '/pages/community/threads/create/components/sort_bottom_sheet/sort_bottom_sheet_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'community_model.dart';
export 'community_model.dart';

class CommunityWidget extends StatefulWidget {
  const CommunityWidget({super.key});

  static String routeName = 'Community';
  static String routePath = '/community';

  @override
  State<CommunityWidget> createState() => _CommunityWidgetState();
}

class _CommunityWidgetState extends State<CommunityWidget>
    with TickerProviderStateMixin {
  late CommunityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
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

    return FutureBuilder<ApiCallResponse>(
      future: SupabaseDBGroup.getCommunityInfoCall.call(
        pUserId: FFAppState().userInfo.id,
      ),
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
        final communityGetCommunityInfoResponse = snapshot.data!;

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
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              iconTheme:
                  IconThemeData(color: FlutterFlowTheme.of(context).primary),
              automaticallyImplyLeading: false,
              leading: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
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
                      width: 24.0,
                      height: 24.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              actions: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: SortBottomSheetWidget(),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: SvgPicture.asset(
                          'assets/images/ic-community-menu.svg',
                          width: 24.0,
                          height: 24.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.textController',
                    Duration(milliseconds: 200),
                    () => safeSetState(() {}),
                  ),
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              font: GoogleFonts.notoSansJp(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                    hintText: 'コミュニティを検索',
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              font: GoogleFonts.notoSansJp(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).gray10,
                    prefixIcon: Icon(
                      Icons.search,
                      color: FlutterFlowTheme.of(context).gray100,
                      size: 24.0,
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.notoSansJp(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  textAlign: TextAlign.start,
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
                centerTitle: false,
                expandedTitleScale: 1.0,
                titlePadding:
                    EdgeInsetsDirectional.fromSTEB(56.0, 0.0, 56.0, 6.0),
              ),
              elevation: 0.0,
            ),
            body: GestureDetector(
              onPanEnd: (details) async {
                scaffoldKey.currentState!.openDrawer();
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: FutureBuilder<List<CommunityWithImageRow>>(
                      future: (_model.requestCompleter ??=
                              Completer<List<CommunityWithImageRow>>()
                                ..complete(CommunityWithImageTable().queryRows(
                                  queryFn: (q) => q,
                                )))
                          .future,
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<CommunityWithImageRow>
                            tabBarCommunityWithImageRowList = snapshot.data!;

                        return Column(
                          children: [
                            Align(
                              alignment: Alignment(0.0, 0),
                              child: TabBar(
                                isScrollable: true,
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).gray80,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansJp(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                unselectedLabelStyle:
                                    FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoSansJp(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                indicatorColor:
                                    FlutterFlowTheme.of(context).primary,
                                indicatorWeight: 3.0,
                                tabs: [
                                  Tab(
                                    text: 'コミュニティ一覧',
                                  ),
                                  Tab(
                                    text: 'マイコミュニティ',
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
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).gray10,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final containerVar = () {
                                            if (FFAppState().activeSort == 0) {
                                              return tabBarCommunityWithImageRowList
                                                  .sortedList(
                                                      keyOf: (e) =>
                                                          e.createdAt!,
                                                      desc: true)
                                                  .where((e) =>
                                                      functions.checkCommunity(
                                                          e.categories.toList(),
                                                          e.name,
                                                          _model.textController
                                                              .text))
                                                  .toList();
                                            } else if (FFAppState()
                                                    .activeSort ==
                                                1) {
                                              return tabBarCommunityWithImageRowList
                                                  .sortedList(
                                                      keyOf: (e) =>
                                                          e.memberCount!,
                                                      desc: true)
                                                  .where((e) =>
                                                      functions.checkCommunity(
                                                          e.categories.toList(),
                                                          e.name,
                                                          _model.textController
                                                              .text))
                                                  .toList();
                                            } else {
                                              return tabBarCommunityWithImageRowList
                                                  .sortedList(
                                                      keyOf: (e) =>
                                                          e.commentCount!,
                                                      desc: true)
                                                  .where((e) =>
                                                      functions.checkCommunity(
                                                          e.categories.toList(),
                                                          e.name,
                                                          _model.textController
                                                              .text))
                                                  .toList();
                                            }
                                          }()
                                              .toList();

                                          return RefreshIndicator(
                                            onRefresh: () async {
                                              safeSetState(() => _model
                                                  .requestCompleter = null);
                                              await _model
                                                  .waitForRequestCompleted();
                                            },
                                            child: MasonryGridView.builder(
                                              gridDelegate:
                                                  SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                              ),
                                              crossAxisSpacing: 4.0,
                                              mainAxisSpacing: 4.0,
                                              itemCount: containerVar.length,
                                              itemBuilder:
                                                  (context, containerVarIndex) {
                                                final containerVarItem =
                                                    containerVar[
                                                        containerVarIndex];
                                                return wrapWithModel(
                                                  model: _model
                                                      .communityGeneralListItemModels
                                                      .getModel(
                                                    containerVarItem.id!
                                                        .toString(),
                                                    containerVarIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      CommunityGeneralListItemWidget(
                                                    key: Key(
                                                      'Key0c3_${containerVarItem.id!.toString()}',
                                                    ),
                                                    community: containerVarItem,
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 4.0, 8.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/ic_community.svg',
                                                          width: 56.0,
                                                          height: 56.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'コミュニティを作ってみよう！',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .notoSansJp(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                            ),
                                                            Text(
                                                              '好きなこと、話したいこと、みんなで語りましょう！',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .gray100,
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
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .primaryButtonModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: PrimaryButtonWidget(
                                                      title: 'コミュニティを作る',
                                                      height: 40.0,
                                                      onTap: () async {
                                                        context.goNamed(
                                                            CommunityCreateWidget
                                                                .routeName);
                                                      },
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final containerVar = () {
                                                    if (FFAppState()
                                                            .activeSort ==
                                                        0) {
                                                      return tabBarCommunityWithImageRowList
                                                          .sortedList(
                                                              keyOf: (e) =>
                                                                  e.createdAt!,
                                                              desc: true);
                                                    } else if (FFAppState()
                                                            .activeSort ==
                                                        1) {
                                                      return tabBarCommunityWithImageRowList
                                                          .sortedList(
                                                              keyOf: (e) => e
                                                                  .memberCount!,
                                                              desc: true);
                                                    } else {
                                                      return tabBarCommunityWithImageRowList
                                                          .sortedList(
                                                              keyOf: (e) => e
                                                                  .commentCount!,
                                                              desc: true);
                                                    }
                                                  }()
                                                      .where((e) =>
                                                          functions.hasMember(
                                                              (getJsonField(
                                                                communityGetCommunityInfoResponse
                                                                    .jsonBody,
                                                                r'''$["my_community_ids"]''',
                                                                true,
                                                              ) as List?)
                                                                  ?.cast<int>(),
                                                              e.id) &&
                                                          functions.checkCommunity(
                                                              e.categories
                                                                  .toList(),
                                                              e.name,
                                                              _model
                                                                  .textController
                                                                  .text))
                                                      .toList();

                                                  return RefreshIndicator(
                                                    onRefresh: () async {
                                                      safeSetState(() => _model
                                                              .requestCompleter =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted();
                                                    },
                                                    child: ListView.separated(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                        0,
                                                        4.0,
                                                        0,
                                                        4.0,
                                                      ),
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          containerVar.length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(height: 4.0),
                                                      itemBuilder: (context,
                                                          containerVarIndex) {
                                                        final containerVarItem =
                                                            containerVar[
                                                                containerVarIndex];
                                                        return wrapWithModel(
                                                          model: _model
                                                              .userCommunityModels
                                                              .getModel(
                                                            containerVarItem.id!
                                                                .toString(),
                                                            containerVarIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              UserCommunityWidget(
                                                            key: Key(
                                                              'Keyqez_${containerVarItem.id!.toString()}',
                                                            ),
                                                            community:
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
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
        );
      },
    );
  }
}
