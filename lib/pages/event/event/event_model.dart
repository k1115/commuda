import '/components/common/comming_soon/comming_soon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'event_widget.dart' show EventWidget;
import 'package:flutter/material.dart';

class EventModel extends FlutterFlowModel<EventWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CommingSoon component.
  late CommingSoonModel commingSoonModel;

  @override
  void initState(BuildContext context) {
    commingSoonModel = createModel(context, () => CommingSoonModel());
  }

  @override
  void dispose() {
    commingSoonModel.dispose();
  }
}
