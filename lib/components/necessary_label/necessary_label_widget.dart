import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'necessary_label_model.dart';
export 'necessary_label_model.dart';

class NecessaryLabelWidget extends StatefulWidget {
  const NecessaryLabelWidget({super.key});

  @override
  State<NecessaryLabelWidget> createState() => _NecessaryLabelWidgetState();
}

class _NecessaryLabelWidgetState extends State<NecessaryLabelWidget> {
  late NecessaryLabelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NecessaryLabelModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).warningLight,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(6.0, 2.0, 6.0, 2.0),
          child: Text(
            '必須',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.notoSansJp(
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).warning,
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  lineHeight: 1.0,
                ),
          ),
        ),
      ),
    );
  }
}
