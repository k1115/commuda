import '/backend/supabase/supabase.dart';
import '/components/empty_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/detail/components/community_thread_item/community_thread_item_widget.dart';
import '/pages/community/threads/create/components/sort_bottom_sheet/sort_bottom_sheet_widget.dart';
import '/pages/home/components/home_community_item/home_community_item_widget.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'book_mark_model.dart';
export 'book_mark_model.dart';

class BookMarkWidget extends StatefulWidget {
  const BookMarkWidget({
    super.key,
    required this.currentUserId,
  });

  final int? currentUserId;

  static String routeName = 'BookMark';
  static String routePath = '/bookmark';

  @override
  State<BookMarkWidget> createState() => _BookMarkWidgetState();
}

class _BookMarkWidgetState extends State<BookMarkWidget>
    with TickerProviderStateMixin {
  late BookMarkModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookMarkModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.searchTextTextController ??= TextEditingController();
    _model.searchTextFocusNode ??= FocusNode();

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
          iconTheme: IconThemeData(color: FlutterFlowTheme.of(context).primary),
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
          actions: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
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
              controller: _model.searchTextTextController,
              focusNode: _model.searchTextFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.searchTextTextController',
                Duration(milliseconds: 200),
                () => safeSetState(() {}),
              ),
              autofocus: false,
              obscureText: false,
              decoration: InputDecoration(
                isDense: true,
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      font: GoogleFonts.notoSansJp(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
                hintText: 'コミュニティを検索',
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      font: GoogleFonts.notoSansJp(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
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
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
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
                  _model.searchTextTextControllerValidator.asValidator(context),
            ),
            centerTitle: false,
            expandedTitleScale: 1.0,
            titlePadding: EdgeInsetsDirectional.fromSTEB(56.0, 0.0, 56.0, 8.0),
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
                children: [
                  Align(
                    alignment: Alignment(0.0, 0),
                    child: TabBar(
                      isScrollable: true,
                      labelColor: FlutterFlowTheme.of(context).primaryText,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      labelStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                font: GoogleFonts.notoSansJp(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                      unselectedLabelStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                font: GoogleFonts.notoSansJp(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                      indicatorColor: FlutterFlowTheme.of(context).primary,
                      indicatorWeight: 3.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                      tabs: [
                        Tab(
                          text: 'コミュニティ',
                        ),
                        Tab(
                          text: 'スレッド',
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
                      children: [
                        FutureBuilder<List<CommunityWithImageRow>>(
                          future: CommunityWithImageTable().queryRows(
                            queryFn: (q) => q
                                .inFilterOrNull(
                                  'id',
                                  FFAppState().userInfo.communityBookmarkId,
                                )
                                .ilike(
                                  'name',
                                  '%${_model.searchTextTextController.text}%',
                                )
                                .order('created_at'),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return EmptyLoadingWidget();
                            }
                            List<CommunityWithImageRow>
                                containerCommunityWithImageRowList =
                                snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).gray10,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final containerVar = () {
                                      if (FFAppState().activeSort == 0) {
                                        return containerCommunityWithImageRowList
                                            .sortedList(
                                                keyOf: (e) => e.createdAt!,
                                                desc: true);
                                      } else if (FFAppState().activeSort == 1) {
                                        return containerCommunityWithImageRowList
                                            .sortedList(
                                                keyOf: (e) => e.memberCount!,
                                                desc: true);
                                      } else {
                                        return containerCommunityWithImageRowList
                                            .sortedList(
                                                keyOf: (e) => e.commentCount!,
                                                desc: true);
                                      }
                                    }()
                                        .toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: containerVar.length,
                                      itemBuilder:
                                          (context, containerVarIndex) {
                                        final containerVarItem =
                                            containerVar[containerVarIndex];
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 16.0, 8.0, 16.0),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .homeCommunityItemModels
                                                      .getModel(
                                                    containerVarItem.id!
                                                        .toString(),
                                                    containerVarIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      HomeCommunityItemWidget(
                                                    key: Key(
                                                      'Key20e_${containerVarItem.id!.toString()}',
                                                    ),
                                                    userId:
                                                        widget.currentUserId!,
                                                    width: 10000,
                                                    community: containerVarItem,
                                                    isFriendCommunity: false,
                                                  ),
                                                ),
                                              ),
                                              Divider(
                                                height: 2.0,
                                                thickness: 2.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gray20,
                                              ),
                                            ],
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
                        FutureBuilder<List<CommunityThreadDetailsRow>>(
                          future: CommunityThreadDetailsTable().queryRows(
                            queryFn: (q) => q
                                .inFilterOrNull(
                                  'id',
                                  FFAppState().userInfo.threadBookmarkId,
                                )
                                .ilike(
                                  'nick_name',
                                  '%${_model.searchTextTextController.text}%',
                                ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return EmptyLoadingWidget();
                            }
                            List<CommunityThreadDetailsRow>
                                containerCommunityThreadDetailsRowList =
                                snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).gray10,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final containerVar = (FFAppState()
                                                    .activeSort ==
                                                0
                                            ? containerCommunityThreadDetailsRowList
                                                .sortedList(
                                                    keyOf: (e) => e.createdAt!,
                                                    desc: true)
                                            : containerCommunityThreadDetailsRowList
                                                .sortedList(
                                                    keyOf: (e) =>
                                                        e.commentCount!,
                                                    desc: true))
                                        .toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: containerVar.length,
                                      itemBuilder:
                                          (context, containerVarIndex) {
                                        final containerVarItem =
                                            containerVar[containerVarIndex];
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              wrapWithModel(
                                                model: _model
                                                    .communityThreadItemModels
                                                    .getModel(
                                                  containerVarItem.id!
                                                      .toString(),
                                                  containerVarIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child:
                                                    CommunityThreadItemWidget(
                                                  key: Key(
                                                    'Keygvj_${containerVarItem.id!.toString()}',
                                                  ),
                                                  thread: containerVarItem,
                                                ),
                                              ),
                                              Divider(
                                                height: 2.0,
                                                thickness: 2.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gray20,
                                              ),
                                            ],
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
          ),
        ),
      ),
    );
  }
}
