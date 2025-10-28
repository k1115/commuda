import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_community_button_widget.dart' show HomeCommunityButtonWidget;
import 'package:flutter/material.dart';

class HomeCommunityButtonModel
    extends FlutterFlowModel<HomeCommunityButtonWidget> {
  ///  Local state fields for this component.

  bool disableButton = false;

  int? buttonType;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in HomeCommunityButton widget.
  List<CommunityMembersRow>? hasMemeber;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
