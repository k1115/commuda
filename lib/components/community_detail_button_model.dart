import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_detail_button_widget.dart' show CommunityDetailButtonWidget;
import 'package:flutter/material.dart';

class CommunityDetailButtonModel
    extends FlutterFlowModel<CommunityDetailButtonWidget> {
  ///  Local state fields for this component.

  bool disableButton = false;

  int? buttonType;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in CommunityDetailButton widget.
  List<CommunityMembersRow>? hasMemeber;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
