import '/backend/supabase/supabase.dart';
import '/components/community/community_bookmark_button/community_bookmark_button_widget.dart';
import '/components/community/community_bottom_sheet_button/community_bottom_sheet_button_widget.dart';
import '/components/community/community_counts_row/community_counts_row_widget.dart';
import '/components/community/community_friends_meta_row/community_friends_meta_row_widget.dart';
import '/components/community/community_tags/community_tags_widget.dart';
import '/components/home_community_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_list_item_widget.dart' show CommunityListItemWidget;
import 'package:flutter/material.dart';

class CommunityListItemModel extends FlutterFlowModel<CommunityListItemWidget> {
  ///  Local state fields for this component.

  bool disableButton = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<CommunityMembersRow>? communityMember;
  // Model for CommunityBookmarkButton component.
  late CommunityBookmarkButtonModel communityBookmarkButtonModel;
  // Model for CommunityBottomSheetButton component.
  late CommunityBottomSheetButtonModel communityBottomSheetButtonModel;
  // Model for CommunityFriendsMetaRow component.
  late CommunityFriendsMetaRowModel communityFriendsMetaRowModel;
  // Model for CommunityTags component.
  late CommunityTagsModel communityTagsModel;
  // Model for CommunityCountsRow component.
  late CommunityCountsRowModel communityCountsRowModel;
  // Model for HomeCommunityButton component.
  late HomeCommunityButtonModel homeCommunityButtonModel;

  @override
  void initState(BuildContext context) {
    communityBookmarkButtonModel =
        createModel(context, () => CommunityBookmarkButtonModel());
    communityBottomSheetButtonModel =
        createModel(context, () => CommunityBottomSheetButtonModel());
    communityFriendsMetaRowModel =
        createModel(context, () => CommunityFriendsMetaRowModel());
    communityTagsModel = createModel(context, () => CommunityTagsModel());
    communityCountsRowModel =
        createModel(context, () => CommunityCountsRowModel());
    homeCommunityButtonModel =
        createModel(context, () => HomeCommunityButtonModel());
  }

  @override
  void dispose() {
    communityBookmarkButtonModel.dispose();
    communityBottomSheetButtonModel.dispose();
    communityFriendsMetaRowModel.dispose();
    communityTagsModel.dispose();
    communityCountsRowModel.dispose();
    homeCommunityButtonModel.dispose();
  }
}
