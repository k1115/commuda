import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'invite_page_widget.dart' show InvitePageWidget;
import 'package:flutter/material.dart';

class InvitePageModel extends FlutterFlowModel<InvitePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CommunityWithImageRow>? communityOutput;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CommunityMembersRow>? communityMemberOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
