import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/footprint/components/foot_print_item/foot_print_item_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'foot_print_date_item_model.dart';
export 'foot_print_date_item_model.dart';

class FootPrintDateItemWidget extends StatefulWidget {
  const FootPrintDateItemWidget({
    super.key,
    required this.date,
    required this.isMyFootPrint,
    required this.startDate,
    required this.endDate,
  });

  final String? date;
  final bool? isMyFootPrint;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<FootPrintDateItemWidget> createState() =>
      _FootPrintDateItemWidgetState();
}

class _FootPrintDateItemWidgetState extends State<FootPrintDateItemWidget> {
  late FootPrintDateItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FootPrintDateItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).gray10,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                  child: Text(
                    valueOrDefault<String>(
                      () {
                        if (widget.date ==
                            dateTimeFormat(
                              "MM月dd日",
                              getCurrentTimestamp,
                              locale: FFLocalizations.of(context).languageCode,
                            )) {
                          return '今日(${widget.date})';
                        } else if (widget.date ==
                            dateTimeFormat(
                              "MM月dd 日",
                              functions.getYesterday(),
                              locale: FFLocalizations.of(context).languageCode,
                            )) {
                          return '昨日(${widget.date})';
                        } else {
                          return widget.date;
                        }
                      }(),
                      '今日(05月26日)',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.notoSansJp(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(),
              child: Builder(
                builder: (context) {
                  if (!widget.isMyFootPrint!) {
                    return FutureBuilder<List<FootprintDetailRow>>(
                      future: FootprintDetailTable().queryRows(
                        queryFn: (q) => q
                            .eqOrNull(
                              'target_id',
                              FFAppState().userInfo.id,
                            )
                            .gtOrNull(
                              'created_at',
                              supaSerialize<DateTime>(widget.startDate),
                            )
                            .ltOrNull(
                              'created_at',
                              supaSerialize<DateTime>(widget.endDate),
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
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<FootprintDetailRow>
                            containerFootprintDetailRowList = snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final containerVar =
                                  containerFootprintDetailRowList.toList();

                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(containerVar.length,
                                    (containerVarIndex) {
                                  final containerVarItem =
                                      containerVar[containerVarIndex];
                                  return wrapWithModel(
                                    model: _model.footPrintItemModels1.getModel(
                                      containerVarItem.id!.toString(),
                                      containerVarIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: FootPrintItemWidget(
                                      key: Key(
                                        'Keyqj8_${containerVarItem.id!.toString()}',
                                      ),
                                      footprint: containerVarItem,
                                      isMyFootPrint: widget.isMyFootPrint!,
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        );
                      },
                    );
                  } else {
                    return FutureBuilder<List<FootprintDetailRow>>(
                      future: FootprintDetailTable().queryRows(
                        queryFn: (q) => q
                            .eqOrNull(
                              'user_id',
                              FFAppState().userInfo.id,
                            )
                            .gtOrNull(
                              'created_at',
                              supaSerialize<DateTime>(widget.startDate),
                            )
                            .ltOrNull(
                              'created_at',
                              supaSerialize<DateTime>(widget.endDate),
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
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<FootprintDetailRow>
                            containerFootprintDetailRowList = snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final containerVar =
                                  containerFootprintDetailRowList.toList();

                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(containerVar.length,
                                    (containerVarIndex) {
                                  final containerVarItem =
                                      containerVar[containerVarIndex];
                                  return wrapWithModel(
                                    model: _model.footPrintItemModels2.getModel(
                                      containerVarItem.id!.toString(),
                                      containerVarIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: FootPrintItemWidget(
                                      key: Key(
                                        'Keyhuh_${containerVarItem.id!.toString()}',
                                      ),
                                      footprint: containerVarItem,
                                      isMyFootPrint: widget.isMyFootPrint!,
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
