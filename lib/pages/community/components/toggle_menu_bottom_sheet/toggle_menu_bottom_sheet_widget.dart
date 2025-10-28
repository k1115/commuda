import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/components/delete_community_member_modal/delete_community_member_modal_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'toggle_menu_bottom_sheet_model.dart';
export 'toggle_menu_bottom_sheet_model.dart';

class ToggleMenuBottomSheetWidget extends StatefulWidget {
  const ToggleMenuBottomSheetWidget({
    super.key,
    required this.userID,
    required this.communityID,
    required this.currentUserId,
  });

  final int? userID;
  final int? communityID;
  final int? currentUserId;

  @override
  State<ToggleMenuBottomSheetWidget> createState() =>
      _ToggleMenuBottomSheetWidgetState();
}

class _ToggleMenuBottomSheetWidgetState
    extends State<ToggleMenuBottomSheetWidget> {
  late ToggleMenuBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ToggleMenuBottomSheetModel());

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

    return FutureBuilder<List<UserWithProfileRow>>(
      future: UserWithProfileTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.userID,
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
        List<UserWithProfileRow> containerUserWithProfileRowList =
            snapshot.data!;

        final containerUserWithProfileRow =
            containerUserWithProfileRowList.isNotEmpty
                ? containerUserWithProfileRowList.first
                : null;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 80.0,
                  child: Divider(
                    height: 20.0,
                    thickness: 4.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.chatroomOverviewOutput =
                        await ChatroomOverviewTable().queryRows(
                      queryFn: (q) => q
                          .containsOrNull(
                            'user_ids',
                            '{${widget.userID}}',
                          )
                          .containsOrNull(
                            'user_ids',
                            '{${FFAppState().userInfo.id}}',
                          ),
                    );
                    FFAppState().selectedMenu = 3;
                    safeSetState(() {});
                    if (_model.chatroomOverviewOutput != null &&
                        (_model.chatroomOverviewOutput)!.isNotEmpty) {
                      context.pushNamed(
                        MessageDetailWidget.routeName,
                        queryParameters: {
                          'chatRoom': serializeParam(
                            _model.chatroomOverviewOutput?.firstOrNull,
                            ParamType.SupabaseRow,
                          ),
                          'targetUser': serializeParam(
                            containerUserWithProfileRow,
                            ParamType.SupabaseRow,
                          ),
                        }.withoutNulls,
                      );
                    } else {
                      _model.newChatroomOutput = await ChatroomsTable().insert({
                        'creator_id': FFAppState().userInfo.id,
                        'target_id': widget.userID,
                      });
                      _model.overviewOutput =
                          await ChatroomOverviewTable().queryRows(
                        queryFn: (q) => q.eqOrNull(
                          'chatroom_id',
                          _model.newChatroomOutput?.id,
                        ),
                      );

                      context.pushNamed(
                        MessageDetailWidget.routeName,
                        queryParameters: {
                          'chatRoom': serializeParam(
                            _model.overviewOutput?.firstOrNull,
                            ParamType.SupabaseRow,
                          ),
                          'targetUser': serializeParam(
                            containerUserWithProfileRow,
                            ParamType.SupabaseRow,
                          ),
                        }.withoutNulls,
                      );
                    }

                    safeSetState(() {});
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: SvgPicture.asset(
                              'assets/images/mail.svg',
                              width: 24.0,
                              height: 24.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'メッセージを送る',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.notoSansJp(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
                Builder(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: DeleteCommunityMemberModalWidget(
                              communityID: widget.communityID!,
                              userID: widget.userID!,
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: SvgPicture.asset(
                                'assets/images/chip_extraction.svg',
                                width: 24.0,
                                height: 24.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              '退会させる',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.notoSansJp(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).warning,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
