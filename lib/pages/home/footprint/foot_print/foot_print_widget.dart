import '/backend/supabase/supabase.dart';
import '/components/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/footprint/components/foot_print_date_item/foot_print_date_item_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'foot_print_model.dart';
export 'foot_print_model.dart';

class FootPrintWidget extends StatefulWidget {
  const FootPrintWidget({super.key});

  static String routeName = 'FootPrint';
  static String routePath = '/footPrint';

  @override
  State<FootPrintWidget> createState() => _FootPrintWidgetState();
}

class _FootPrintWidgetState extends State<FootPrintWidget>
    with TickerProviderStateMixin {
  late FootPrintModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FootPrintModel());

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
                context.pop();
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
              '足あと',
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
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
                                text: '足あと',
                              ),
                              Tab(
                                text: '自分の足あと',
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
                              FutureBuilder<List<FootprintWithDateRow>>(
                                future: FootprintWithDateTable().queryRows(
                                  queryFn: (q) => q
                                      .eqOrNull(
                                        'target_id',
                                        FFAppState().userInfo.id,
                                      )
                                      .order('formatted_created_at'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context).gray40,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<FootprintWithDateRow>
                                      containerFootprintWithDateRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final containerVar =
                                            containerFootprintWithDateRowList
                                                .unique((e) =>
                                                    e.formattedCreatedAt!)
                                                .toList();
                                        if (containerVar.isEmpty) {
                                          return EmptyListWidget(
                                            text: '足あとがありません。',
                                          );
                                        }

                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                containerVar.length,
                                                (containerVarIndex) {
                                              final containerVarItem =
                                                  containerVar[
                                                      containerVarIndex];
                                              return wrapWithModel(
                                                model: _model
                                                    .footPrintDateItemModels1
                                                    .getModel(
                                                  containerVarItem
                                                      .formattedCreatedAt!,
                                                  containerVarIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: FootPrintDateItemWidget(
                                                  key: Key(
                                                    'Keyxd9_${containerVarItem.formattedCreatedAt!}',
                                                  ),
                                                  date: containerVarItem
                                                      .formattedCreatedAt!,
                                                  isMyFootPrint: false,
                                                  startDate:
                                                      functions.getStartTime(
                                                          containerVarItem
                                                              .createdAt),
                                                  endDate:
                                                      functions.getLastTime(
                                                          containerVarItem
                                                              .createdAt),
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                              FutureBuilder<List<FootprintWithDateRow>>(
                                future: FootprintWithDateTable().queryRows(
                                  queryFn: (q) => q
                                      .eqOrNull(
                                        'user_id',
                                        FFAppState().userInfo.id,
                                      )
                                      .order('formatted_created_at'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context).gray40,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<FootprintWithDateRow>
                                      containerFootprintWithDateRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final containerVar =
                                            containerFootprintWithDateRowList
                                                .unique((e) =>
                                                    e.formattedCreatedAt!)
                                                .toList();
                                        if (containerVar.isEmpty) {
                                          return EmptyListWidget(
                                            text: '自分の足あとがありません。',
                                          );
                                        }

                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                containerVar.length,
                                                (containerVarIndex) {
                                              final containerVarItem =
                                                  containerVar[
                                                      containerVarIndex];
                                              return wrapWithModel(
                                                model: _model
                                                    .footPrintDateItemModels2
                                                    .getModel(
                                                  containerVarIndex.toString(),
                                                  containerVarIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: FootPrintDateItemWidget(
                                                  key: Key(
                                                    'Key7fd_${containerVarIndex.toString()}',
                                                  ),
                                                  date: containerVarItem
                                                      .formattedCreatedAt!,
                                                  isMyFootPrint: true,
                                                  startDate:
                                                      functions.getStartTime(
                                                          containerVarItem
                                                              .createdAt),
                                                  endDate:
                                                      functions.getLastTime(
                                                          containerVarItem
                                                              .createdAt),
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
