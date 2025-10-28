import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/detail/components/community_main_info_member_list_item/community_main_info_member_list_item_widget.dart';
import 'community_information_widget.dart' show CommunityInformationWidget;
import 'package:flutter/material.dart';

class CommunityInformationModel
    extends FlutterFlowModel<CommunityInformationWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for CommunityMainInfoMemberListItem dynamic component.
  late FlutterFlowDynamicModels<CommunityMainInfoMemberListItemModel>
      communityMainInfoMemberListItemModels;
  // Stores action output result for [Backend Call - Query Rows] action in CommunityMainInfoMemberListItem widget.
  List<UserWithProfileRow>? userOutput;

  @override
  void initState(BuildContext context) {
    communityMainInfoMemberListItemModels =
        FlutterFlowDynamicModels(() => CommunityMainInfoMemberListItemModel());
  }

  @override
  void dispose() {
    communityMainInfoMemberListItemModels.dispose();
  }
}
