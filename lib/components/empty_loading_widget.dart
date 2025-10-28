import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_loading_model.dart';
export 'empty_loading_model.dart';

class EmptyLoadingWidget extends StatefulWidget {
  const EmptyLoadingWidget({super.key});

  @override
  State<EmptyLoadingWidget> createState() => _EmptyLoadingWidgetState();
}

class _EmptyLoadingWidgetState extends State<EmptyLoadingWidget> {
  late EmptyLoadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyLoadingModel());

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
      width: 0.0,
      height: 0.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
    );
  }
}
