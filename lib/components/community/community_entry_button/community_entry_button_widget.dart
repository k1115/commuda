import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'community_entry_button_model.dart';
export 'community_entry_button_model.dart';

class CommunityEntryButtonWidget extends StatefulWidget {
  const CommunityEntryButtonWidget({
    super.key,
    required this.communityId,
  });

  final CommunityWithImageRow? communityId;

  @override
  State<CommunityEntryButtonWidget> createState() =>
      _CommunityEntryButtonWidgetState();
}

class _CommunityEntryButtonWidgetState
    extends State<CommunityEntryButtonWidget> {
  late CommunityEntryButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityEntryButtonModel());

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
      decoration: BoxDecoration(),
      child: FutureBuilder<List<CommunityMembersRow>>(
        future: CommunityMembersTable().querySingleRow(
          queryFn: (q) => q
              .eqOrNull(
                'community_id',
                widget.communityId?.id,
              )
              .eqOrNull(
                'user_id',
                FFAppState().userInfo.id,
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
          List<CommunityMembersRow> conditionalBuilderCommunityMembersRowList =
              snapshot.data!;

          final conditionalBuilderCommunityMembersRow =
              conditionalBuilderCommunityMembersRowList.isNotEmpty
                  ? conditionalBuilderCommunityMembersRowList.first
                  : null;

          return Builder(
            builder: (context) {
              if ((conditionalBuilderCommunityMembersRow?.id != null) &&
                  (conditionalBuilderCommunityMembersRow?.participateStatus ==
                      0)) {
                return Container(
                  height: 32.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 5.5, 16.0, 5.5),
                    child: Text(
                      '参加申請中',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.notoSansJp(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                );
              } else if ((conditionalBuilderCommunityMembersRow?.id != null) &&
                  (conditionalBuilderCommunityMembersRow?.participateStatus ==
                      1)) {
                return Container(
                  width: 0.0,
                  height: 0.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                );
              } else if ((conditionalBuilderCommunityMembersRow?.id != null) &&
                  (conditionalBuilderCommunityMembersRow?.participateStatus ==
                      2)) {
                return Container(
                  height: 32.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).gray100,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 5.5, 16.0, 5.5),
                    child: Text(
                      '拒否済み',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.notoSansJp(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                );
              } else {
                return Builder(
                  builder: (context) {
                    if (widget.communityId?.privacyType == 0) {
                      return Container(
                        height: 32.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 5.5, 16.0, 5.5),
                          child: Text(
                            '参加する',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.notoSansJp(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      );
                    } else if ((widget.communityId?.privacyType == 1) ||
                        (widget.communityId?.privacyType == 3)) {
                      return Container(
                        height: 32.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 5.5, 16.0, 5.5),
                          child: Text(
                            '参加申請',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.notoSansJp(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        width: 0.0,
                        height: 0.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      );
                    }
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
