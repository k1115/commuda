import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/threads/components/community_comment_item/community_comment_item_widget.dart';
import 'community_thread_bottom_sheet_widget.dart'
    show CommunityThreadBottomSheetWidget;
import 'package:flutter/material.dart';

class CommunityThreadBottomSheetModel
    extends FlutterFlowModel<CommunityThreadBottomSheetWidget> {
  ///  Local state fields for this component.

  List<CommunityWithImageRow> communities = [];
  void addToCommunities(CommunityWithImageRow item) => communities.add(item);
  void removeFromCommunities(CommunityWithImageRow item) =>
      communities.remove(item);
  void removeAtIndexFromCommunities(int index) => communities.removeAt(index);
  void insertAtIndexInCommunities(int index, CommunityWithImageRow item) =>
      communities.insert(index, item);
  void updateCommunitiesAtIndex(
          int index, Function(CommunityWithImageRow) updateFn) =>
      communities[index] = updateFn(communities[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in CommunityThreadBottomSheet widget.
  List<CommunityMembersRow>? communityMembersOutput;
  // Stores action output result for [Backend Call - Query Rows] action in CommunityThreadBottomSheet widget.
  List<CommunityWithImageRow>? communitiesOutput;
  // Models for CommunityCommentItem dynamic component.
  late FlutterFlowDynamicModels<CommunityCommentItemModel>
      communityCommentItemModels;

  @override
  void initState(BuildContext context) {
    communityCommentItemModels =
        FlutterFlowDynamicModels(() => CommunityCommentItemModel());
  }

  @override
  void dispose() {
    communityCommentItemModels.dispose();
  }
}
