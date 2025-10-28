import '/components/event_tag/event_tag_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_event_item_widget.dart' show HomeEventItemWidget;
import 'package:flutter/material.dart';

class HomeEventItemModel extends FlutterFlowModel<HomeEventItemWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for EventTag component.
  late EventTagModel eventTagModel;

  @override
  void initState(BuildContext context) {
    eventTagModel = createModel(context, () => EventTagModel());
  }

  @override
  void dispose() {
    eventTagModel.dispose();
  }
}
