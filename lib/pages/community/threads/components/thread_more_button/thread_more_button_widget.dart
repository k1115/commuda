import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/components/bottom_sheets/thread_more_action_bottom_sheet/thread_more_action_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'thread_more_button_model.dart';
export 'thread_more_button_model.dart';

class ThreadMoreButtonWidget extends StatefulWidget {
  const ThreadMoreButtonWidget({
    super.key,
    required this.thread,
    this.userId,
    required this.action,
  });

  final CommunityThreadDetailsRow? thread;
  final int? userId;
  final Future Function()? action;

  @override
  State<ThreadMoreButtonWidget> createState() => _ThreadMoreButtonWidgetState();
}

class _ThreadMoreButtonWidgetState extends State<ThreadMoreButtonWidget> {
  late ThreadMoreButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThreadMoreButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (!_model.disableButton) {
          _model.disableButton = true;
          safeSetState(() {});
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: ThreadMoreActionBottomSheetWidget(
                  thread: widget.thread!,
                ),
              );
            },
          ).then((value) => safeSetState(() {}));

          _model.disableButton = false;
          safeSetState(() {});
        }
      },
      child: Container(
        width: 32.0,
        height: 32.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              'assets/images/ic-more_vert-color.svg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
