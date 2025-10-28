import '/backend/supabase/supabase.dart';
import '/components/common/app_nav_bar/app_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/components/home_info_item/home_info_item_widget.dart';
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'information_model.dart';
export 'information_model.dart';

class InformationWidget extends StatefulWidget {
  const InformationWidget({super.key});

  static String routeName = 'Information';
  static String routePath = '/information';

  @override
  State<InformationWidget> createState() => _InformationWidgetState();
}

class _InformationWidgetState extends State<InformationWidget> {
  late InformationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InformationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<InformationsRow>>(
      future: (_model.requestCompleter ??= Completer<List<InformationsRow>>()
            ..complete(InformationsTable().queryRows(
              queryFn: (q) => q.order('sent_at'),
              limit: 10,
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).gray10,
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
        List<InformationsRow> informationInformationsRowList = snapshot.data!;

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
                    context.goNamed(
                      HomeWidget.routeName,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.leftToRight,
                        ),
                      },
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SvgPicture.asset(
                      'assets/images/ic-back.svg',
                      width: 24.0,
                      height: 24.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'インフォメーション',
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
                titlePadding:
                    EdgeInsetsDirectional.fromSTEB(52.0, 0.0, 0.0, 18.0),
              ),
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          final informationVar =
                              informationInformationsRowList.toList();

                          return RefreshIndicator(
                            onRefresh: () async {
                              safeSetState(
                                  () => _model.requestCompleter = null);
                              await _model.waitForRequestCompleted();
                            },
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              scrollDirection: Axis.vertical,
                              itemCount: informationVar.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 2.0),
                              itemBuilder: (context, informationVarIndex) {
                                final informationVarItem =
                                    informationVar[informationVarIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.goNamed(
                                      InformationDetailWidget.routeName,
                                      queryParameters: {
                                        'informationId': serializeParam(
                                          informationVarItem.id,
                                          ParamType.int,
                                        ),
                                        'previousPath': serializeParam(
                                          'Information',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: wrapWithModel(
                                    model: _model.homeInfoItemModels.getModel(
                                      informationVarItem.id.toString(),
                                      informationVarIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: HomeInfoItemWidget(
                                      key: Key(
                                        'Key2t1_${informationVarItem.id.toString()}',
                                      ),
                                      information: informationVarItem,
                                    ),
                                  ),
                                );
                              },
                            ),
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
          ),
        );
      },
    );
  }
}
