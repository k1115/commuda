import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'event_tag_model.dart';
export 'event_tag_model.dart';

class EventTagWidget extends StatefulWidget {
  const EventTagWidget({
    super.key,
    String? text,
  }) : this.text = text ?? '';

  final String text;

  @override
  State<EventTagWidget> createState() => _EventTagWidgetState();
}

class _EventTagWidgetState extends State<EventTagWidget> {
  late EventTagModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventTagModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(0.0),
          child: SvgPicture.asset(
            'assets/images/ic-connect_without_contact.svg',
            width: 20.0,
            height: 20.0,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          valueOrDefault<String>(
            widget.text,
            '子育てとごはん',
          ),
          maxLines: 2,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.notoSansJp(
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).gray100,
                fontSize: 12.0,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
        ),
      ].divide(SizedBox(width: 4.0)),
    );
  }
}
