import '/backend/supabase/supabase.dart';
import '/components/community/bottom_sheets/community_participate_apply_bottom_sheet/community_participate_apply_bottom_sheet_widget.dart';
import '/components/empty_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/community/detail/components/withdrawal_modal/withdrawal_modal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'community_detail_button_model.dart';
export 'community_detail_button_model.dart';

class CommunityDetailButtonWidget extends StatefulWidget {
  const CommunityDetailButtonWidget({
    super.key,
    this.communityId,
    required this.creatorId,
    required this.privacyType,
    required this.communityName,
    required this.isInvited,
  });

  final int? communityId;
  final int? creatorId;
  final int? privacyType;
  final String? communityName;
  final bool? isInvited;

  @override
  State<CommunityDetailButtonWidget> createState() =>
      _CommunityDetailButtonWidgetState();
}

class _CommunityDetailButtonWidgetState
    extends State<CommunityDetailButtonWidget> {
  late CommunityDetailButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityDetailButtonModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.creatorId == FFAppState().userInfo.id) {
        _model.buttonType = 0;
        _model.updatePage(() {});
      } else {
        _model.hasMemeber = await CommunityMembersTable().queryRows(
          queryFn: (q) => q
              .eqOrNull(
                'user_id',
                FFAppState().userInfo.id,
              )
              .eqOrNull(
                'community_id',
                widget.communityId,
              ),
        );
        if (_model.hasMemeber != null && (_model.hasMemeber)!.isNotEmpty) {
          if (_model.hasMemeber?.firstOrNull?.participateStatus == 0) {
            _model.buttonType = 1;
            safeSetState(() {});
          } else {
            if (_model.hasMemeber?.firstOrNull?.participateStatus == 1) {
              _model.buttonType = 2;
              _model.updatePage(() {});
            } else {
              _model.buttonType = 3;
              _model.updatePage(() {});
            }
          }
        } else {
          if (widget.privacyType == 0) {
            _model.buttonType = 4;
            _model.updatePage(() {});
          } else {
            _model.buttonType = 5;
            _model.updatePage(() {});
          }
        }
      }

      FFAppState().valueForUpdate = !(FFAppState().valueForUpdate ?? true);
      FFAppState().update(() {});
    });

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

    return Builder(
      builder: (context) {
        if (widget.creatorId == FFAppState().userInfo.id) {
          return FFButtonWidget(
            onPressed: _model.disableButton
                ? null
                : () async {
                    await CommunityMembersTable().delete(
                      matchingRows: (rows) => rows
                          .eqOrNull(
                            'community_id',
                            widget.communityId,
                          )
                          .eqOrNull(
                            'user_id',
                            FFAppState().userInfo.id,
                          ),
                    );
                  },
            text: '管理メニュー',
            options: FFButtonOptions(
              width: 116.0,
              height: 32.0,
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).secondaryBackground,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    font: GoogleFonts.notoSansJp(
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleSmall.fontStyle,
                  ),
              elevation: 0.0,
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).gray20,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            showLoadingIndicator: false,
          );
        } else {
          return FutureBuilder<List<CommunityMembersRow>>(
            future: CommunityMembersTable().queryRows(
              queryFn: (q) => q
                  .eqOrNull(
                    'community_id',
                    widget.communityId,
                  )
                  .eqOrNull(
                    'user_id',
                    FFAppState().userInfo.id,
                  ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return EmptyLoadingWidget();
              }
              List<CommunityMembersRow> containerCommunityMembersRowList =
                  snapshot.data!;

              return Container(
                decoration: BoxDecoration(),
                child: Builder(
                  builder: (context) {
                    if (containerCommunityMembersRowList.isNotEmpty) {
                      return Builder(
                        builder: (context) {
                          if (containerCommunityMembersRowList
                                  .firstOrNull?.participateStatus ==
                              0) {
                            return FFButtonWidget(
                              onPressed: _model.disableButton
                                  ? null
                                  : () async {
                                      await CommunityMembersTable().delete(
                                        matchingRows: (rows) => rows
                                            .eqOrNull(
                                              'community_id',
                                              widget.communityId,
                                            )
                                            .eqOrNull(
                                              'user_id',
                                              FFAppState().userInfo.id,
                                            ),
                                      );
                                    },
                              text: '申請キャンセル',
                              options: FFButtonOptions(
                                width: 130.0,
                                height: 32.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.notoSansJp(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              showLoadingIndicator: false,
                            );
                          } else if (containerCommunityMembersRowList
                                  .firstOrNull?.participateStatus ==
                              1) {
                            return Builder(
                              builder: (context) => FFButtonWidget(
                                onPressed: _model.disableButton
                                    ? null
                                    : () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WithdrawalModalWidget(
                                                communityId:
                                                    widget.communityId!,
                                                communityName:
                                                    widget.communityName!,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                text: '参加中',
                                options: FFButtonOptions(
                                  width: 88.0,
                                  height: 32.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.notoSansJp(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).gray20,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                showLoadingIndicator: false,
                              ),
                            );
                          } else {
                            return Container(
                              width: 88.0,
                              height: 32.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            );
                          }
                        },
                      );
                    } else {
                      return Builder(
                        builder: (context) {
                          if (widget.privacyType == 0) {
                            return FFButtonWidget(
                              onPressed: _model.disableButton
                                  ? null
                                  : () async {
                                      await CommunityMembersTable().insert({
                                        'community_id': widget.communityId,
                                        'user_id': FFAppState().userInfo.id,
                                        'participate_status': 1,
                                      });
                                      _model.updatePage(() {});
                                    },
                              text: '参加',
                              options: FFButtonOptions(
                                width: 88.0,
                                height: 32.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.notoSansJp(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              showLoadingIndicator: false,
                            );
                          } else if (((widget.privacyType == 1) ||
                                  (widget.privacyType == 3)) ||
                              widget.isInvited!) {
                            return FFButtonWidget(
                              onPressed: _model.disableButton
                                  ? null
                                  : () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child:
                                                CommunityParticipateApplyBottomSheetWidget(
                                              community: widget.communityId!,
                                              userId: FFAppState().userInfo.id,
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                              text: '参加申請を送る',
                              options: FFButtonOptions(
                                width: 130.0,
                                height: 32.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.notoSansJp(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              showLoadingIndicator: false,
                            );
                          } else {
                            return Container(
                              width: 88.0,
                              height: 32.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            );
                          }
                        },
                      );
                    }
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}
