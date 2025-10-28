import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_member_item_widget.dart' show CommunityMemberItemWidget;
import 'package:flutter/material.dart';

class CommunityMemberItemModel
    extends FlutterFlowModel<CommunityMemberItemWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<UsersRow>? currentUserOutput;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<UserWithProfileRow>? targetUserOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
