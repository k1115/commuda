import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/components/bottom_sheets/identity_confirmation_bottom_sheet/identity_confirmation_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'timeline_reaction_model.dart';
export 'timeline_reaction_model.dart';

class TimelineReactionWidget extends StatefulWidget {
  const TimelineReactionWidget({
    super.key,
    required this.threadDetail,
    required this.active,
    required this.count,
    required this.type,
    required this.code,
  });

  final CommunityThreadDetailsRow? threadDetail;
  final bool? active;
  final int? count;
  final int? type;
  final ReactionType? code;

  @override
  State<TimelineReactionWidget> createState() => _TimelineReactionWidgetState();
}

class _TimelineReactionWidgetState extends State<TimelineReactionWidget> {
  late TimelineReactionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimelineReactionModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.active = widget.active!;
      _model.count = widget.count!;
      safeSetState(() {});
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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (_model.disableButton) {
          return;
        }

        _model.disableButton = true;
        safeSetState(() {});
        while (true) {
          if (FFAppState().userInfo.phone != '') {
            if (_model.active) {
              _model.active = false;
              _model.count = _model.count + -1;
              safeSetState(() {});
              await CommunityThreadReactionsTable().delete(
                matchingRows: (rows) => rows
                    .eqOrNull(
                      'reaction_type',
                      widget.type,
                    )
                    .eqOrNull(
                      'thread_id',
                      widget.threadDetail?.id,
                    )
                    .eqOrNull(
                      'user_id',
                      FFAppState().userInfo.id,
                    ),
              );
            } else {
              _model.active = true;
              _model.count = _model.count + 1;
              safeSetState(() {});
              await CommunityThreadReactionsTable().insert({
                'thread_id': widget.threadDetail?.id,
                'reaction_type': widget.type,
                'user_id': FFAppState().userInfo.id,
                'community_id': widget.threadDetail?.communityId,
              });
              if (widget.threadDetail?.creatorId != FFAppState().userInfo.id) {
                await CommunityAnnouncementsTable().insert({
                  'thread_id': widget.threadDetail?.id,
                  'type': 1,
                  'reaction_type': widget.type,
                  'user_id': widget.threadDetail?.creatorId,
                  'creator_id': FFAppState().userInfo.id,
                  'is_read': false,
                });
                await NotificationsTable().insert({
                  'user_id': FFAppState().userInfo.id,
                  'target_id': widget.threadDetail?.creatorId,
                  'notification_flag': 1,
                });
              }
            }

            break;
          } else {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: false,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: IdentityConfirmationBottomSheetWidget(),
                );
              },
            ).then((value) => safeSetState(() {}));

            if (FFAppState().userInfo.phone == '') {
              break;
            }
          }
        }
        _model.disableButton = false;
        safeSetState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          color: _model.active
              ? Color(0xFFFFF8E6)
              : FlutterFlowTheme.of(context).gray10,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: _model.active
                ? FlutterFlowTheme.of(context).primary
                : Color(0x00000000),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(6.0, 4.0, 8.0, 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Builder(
                builder: (context) {
                  if (widget.code == ReactionType.Reaction0) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/ic-reaction0.png',
                        width: 20.0,
                        height: 20.0,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else if (widget.code == ReactionType.Reaction1) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/ic-reaction1.png',
                        width: 20.0,
                        height: 20.0,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else if (widget.code == ReactionType.Reaction2) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/ic-reaction2.png',
                        width: 20.0,
                        height: 20.0,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/ic-reaction3.png',
                        width: 20.0,
                        height: 20.0,
                        fit: BoxFit.cover,
                      ),
                    );
                  }
                },
              ),
              Text(
                valueOrDefault<String>(
                  _model.count.toString(),
                  '0',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.notoSansJp(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: _model.active
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).gray100,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ].divide(SizedBox(width: 4.0)),
          ),
        ),
      ),
    );
  }
}
