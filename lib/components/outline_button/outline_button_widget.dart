import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'outline_button_model.dart';
export 'outline_button_model.dart';

class OutlineButtonWidget extends StatefulWidget {
  const OutlineButtonWidget({
    super.key,
    this.title,
    this.onTap,
  });

  /// タイトル
  final String? title;

  final Future Function()? onTap;

  @override
  State<OutlineButtonWidget> createState() => _OutlineButtonWidgetState();
}

class _OutlineButtonWidgetState extends State<OutlineButtonWidget> {
  late OutlineButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OutlineButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        await widget.onTap?.call();
      },
      text: widget.title!,
      options: FFButtonOptions(
        width: double.infinity,
        height: 56.0,
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).secondaryBackground,
        textStyle: FlutterFlowTheme.of(context).labelMedium.override(
              font: GoogleFonts.notoSansJp(
                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
              ),
              color: FlutterFlowTheme.of(context).primaryText,
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
              lineHeight: 1.5,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).Gray40,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      showLoadingIndicator: false,
    );
  }
}
