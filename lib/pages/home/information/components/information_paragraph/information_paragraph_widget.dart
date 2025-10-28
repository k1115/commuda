import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'information_paragraph_model.dart';
export 'information_paragraph_model.dart';

class InformationParagraphWidget extends StatefulWidget {
  const InformationParagraphWidget({
    super.key,
    required this.paragraph,
  });

  final InformationParagraphsRow? paragraph;

  @override
  State<InformationParagraphWidget> createState() =>
      _InformationParagraphWidgetState();
}

class _InformationParagraphWidgetState
    extends State<InformationParagraphWidget> {
  late InformationParagraphModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InformationParagraphModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.paragraph?.type == 1) {
          return Text(
            valueOrDefault<String>(
              widget.paragraph?.content,
              '-',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.notoSansJp(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  fontSize: () {
                    if (widget.paragraph?.headerSize == 1) {
                      return 18.0;
                    } else if (widget.paragraph?.headerSize == 2) {
                      return 16.0;
                    } else if (widget.paragraph?.headerSize == 3) {
                      return 14.0;
                    } else {
                      return 14.0;
                    }
                  }(),
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          );
        } else if (widget.paragraph?.type == 2) {
          return Visibility(
            visible: widget.paragraph?.content != null &&
                widget.paragraph?.content != '',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.paragraph!.content!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          );
        } else {
          return Text(
            valueOrDefault<String>(
              widget.paragraph?.content,
              '-',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.notoSansJp(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).gray100,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          );
        }
      },
    );
  }
}
