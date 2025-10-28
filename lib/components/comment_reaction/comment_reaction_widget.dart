import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/components/bottom_sheets/identity_confirmation_bottom_sheet/identity_confirmation_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comment_reaction_model.dart';
export 'comment_reaction_model.dart';

class CommentReactionWidget extends StatefulWidget {
  const CommentReactionWidget({
    super.key,
    required this.code,
    required this.count,
    bool? active,
    required this.type,
    this.commentId,
  }) : this.active = active ?? false;

  final ReactionType? code;
  final int? count;
  final bool active;
  final int? type;
  final int? commentId;

  @override
  State<CommentReactionWidget> createState() => _CommentReactionWidgetState();
}

class _CommentReactionWidgetState extends State<CommentReactionWidget> {
  late CommentReactionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentReactionModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.count = widget.count!;
      _model.active = widget.active;
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
              _model.count = _model.count + -1;
              _model.active = false;
              safeSetState(() {});
              await CommunityThreadCommentReactionsTable().delete(
                matchingRows: (rows) => rows
                    .eqOrNull(
                      'reaction_type',
                      widget.type,
                    )
                    .eqOrNull(
                      'comment_id',
                      widget.commentId,
                    )
                    .eqOrNull(
                      'user_id',
                      FFAppState().userInfo.id,
                    ),
              );
            } else {
              _model.count = _model.count + 1;
              _model.active = true;
              safeSetState(() {});
              await CommunityThreadCommentReactionsTable().insert({
                'comment_id': widget.commentId,
                'reaction_type': widget.type,
                'user_id': FFAppState().userInfo.id,
              });
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
                      color: widget.active
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
