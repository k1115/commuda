import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_button_widget.dart' show CommunityButtonWidget;
import 'package:flutter/material.dart';

class CommunityButtonModel extends FlutterFlowModel<CommunityButtonWidget> {
  ///  Local state fields for this component.

  bool disableButton = false;

  int? buttonType;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in CommunityButton widget.
  List<CommunityMembersRow>? hasMemeber;
  // Stores action output result for [Backend Call - Query Rows] action in CommunityEntryButton widget.
  List<CommunityWithImageRow>? communityOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
