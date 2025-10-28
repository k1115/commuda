import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/components/community_member_item/community_member_item_widget.dart';
import '/pages/community/components/community_member_item2/community_member_item2_widget.dart';
import 'community_member_manage_widget.dart' show CommunityMemberManageWidget;
import 'package:flutter/material.dart';

class CommunityMemberManageModel
    extends FlutterFlowModel<CommunityMemberManageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for CommunityMemberItem dynamic component.
  late FlutterFlowDynamicModels<CommunityMemberItemModel>
      communityMemberItemModels1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Models for CommunityMemberItem dynamic component.
  late FlutterFlowDynamicModels<CommunityMemberItemModel>
      communityMemberItemModels2;
  // Models for CommunityMemberItem2 dynamic component.
  late FlutterFlowDynamicModels<CommunityMemberItem2Model>
      communityMemberItem2Models;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    communityMemberItemModels1 =
        FlutterFlowDynamicModels(() => CommunityMemberItemModel());
    communityMemberItemModels2 =
        FlutterFlowDynamicModels(() => CommunityMemberItemModel());
    communityMemberItem2Models =
        FlutterFlowDynamicModels(() => CommunityMemberItem2Model());
  }

  @override
  void dispose() {
    communityMemberItemModels1.dispose();
    tabBarController?.dispose();
    communityMemberItemModels2.dispose();
    communityMemberItem2Models.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
