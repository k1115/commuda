import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'thread_bookmark_button_model.dart';
export 'thread_bookmark_button_model.dart';

class ThreadBookmarkButtonWidget extends StatefulWidget {
  const ThreadBookmarkButtonWidget({
    super.key,
    required this.thread,
    required this.userId,
  });

  final CommunityThreadDetailsRow? thread;
  final int? userId;

  @override
  State<ThreadBookmarkButtonWidget> createState() =>
      _ThreadBookmarkButtonWidgetState();
}

class _ThreadBookmarkButtonWidgetState
    extends State<ThreadBookmarkButtonWidget> {
  late ThreadBookmarkButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThreadBookmarkButtonModel());

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
      child: Builder(
        builder: (context) {
          if (FFAppState()
              .userInfo
              .threadBookmarkId
              .contains(widget.thread?.id)) {
            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                FFAppState().updateUserInfoStruct(
                  (e) => e
                    ..updateThreadBookmarkId(
                      (e) => e.remove(widget.thread?.id),
                    ),
                );
                FFAppState().update(() {});
                await CommunityThreadBookmarksTable().delete(
                  matchingRows: (rows) => rows
                      .eqOrNull(
                        'thread_id',
                        widget.thread?.id,
                      )
                      .eqOrNull(
                        'user_id',
                        widget.userId,
                      ),
                );
              },
              child: Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Icon(
                  Icons.bookmark,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
              ),
            );
          } else {
            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                FFAppState().updateUserInfoStruct(
                  (e) => e
                    ..updateThreadBookmarkId(
                      (e) => e.add(widget.thread!.id!),
                    ),
                );
                FFAppState().update(() {});
                await CommunityThreadBookmarksTable().insert({
                  'thread_id': widget.thread?.id,
                  'user_id': widget.userId,
                });
              },
              child: Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Icon(
                  Icons.bookmark,
                  color: FlutterFlowTheme.of(context).gray10,
                  size: 24.0,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
