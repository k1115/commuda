import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'primary_button_model.dart';
export 'primary_button_model.dart';

class PrimaryButtonWidget extends StatefulWidget {
  const PrimaryButtonWidget({
    super.key,
    this.title,
    this.onTap,
    double? height,
    bool? disabled,
  })  : this.height = height ?? 56.0,
        this.disabled = disabled ?? false;

  /// タイトル
  final String? title;

  final Future Function()? onTap;
  final double height;
  final bool disabled;

  @override
  State<PrimaryButtonWidget> createState() => _PrimaryButtonWidgetState();
}

class _PrimaryButtonWidgetState extends State<PrimaryButtonWidget> {
  late PrimaryButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrimaryButtonModel());

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
      onPressed: (widget.disabled || _model.disableButton)
          ? null
          : () async {
              _model.disableButton = true;
              safeSetState(() {});
              await widget.onTap?.call();
              _model.disableButton = false;
              safeSetState(() {});
            },
      text: widget.title!,
      options: FFButtonOptions(
        width: double.infinity,
        height: valueOrDefault<double>(
          widget.height,
          56.0,
        ),
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).titleMedium.override(
              font: GoogleFonts.notoSansJp(
                fontWeight: FontWeight.w500,
                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
              ),
              color: FlutterFlowTheme.of(context).secondaryBackground,
              fontSize: 14.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
              lineHeight: 1.5,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(8.0),
        disabledColor: Color(0xFFFDDD82),
        hoverColor: FlutterFlowTheme.of(context).Main50,
      ),
      showLoadingIndicator: false,
    );
  }
}
