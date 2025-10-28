import '/components/common/app_nav_bar/app_nav_bar_widget.dart';
import '/components/common/comming_soon/comming_soon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'task_widget.dart' show TaskWidget;
import 'package:flutter/material.dart';

class TaskModel extends FlutterFlowModel<TaskWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CommingSoon component.
  late CommingSoonModel commingSoonModel;
  // Model for AppNavBar component.
  late AppNavBarModel appNavBarModel;

  @override
  void initState(BuildContext context) {
    commingSoonModel = createModel(context, () => CommingSoonModel());
    appNavBarModel = createModel(context, () => AppNavBarModel());
  }

  @override
  void dispose() {
    commingSoonModel.dispose();
    appNavBarModel.dispose();
  }
}
