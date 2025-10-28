import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/action/components/action_progress_list_item/action_progress_list_item_widget.dart';
import 'action_widget.dart' show ActionWidget;
import 'package:flutter/material.dart';

class ActionModel extends FlutterFlowModel<ActionWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<UserActionProgressRow>>? actionSupabaseStream;
  // Models for ActionProgressListItem dynamic component.
  late FlutterFlowDynamicModels<ActionProgressListItemModel>
      actionProgressListItemModels;

  @override
  void initState(BuildContext context) {
    actionProgressListItemModels =
        FlutterFlowDynamicModels(() => ActionProgressListItemModel());
  }

  @override
  void dispose() {
    actionProgressListItemModels.dispose();
  }
}
