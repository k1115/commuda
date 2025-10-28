import '/backend/supabase/supabase.dart';
import '/components/community/community_bookmark_button/community_bookmark_button_widget.dart';
import '/components/community/community_bottom_sheet_button/community_bottom_sheet_button_widget.dart';
import '/components/community/community_counts_row/community_counts_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_ranking_item_widget.dart' show HomeRankingItemWidget;
import 'package:flutter/material.dart';

class HomeRankingItemModel extends FlutterFlowModel<HomeRankingItemWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<CommunityMembersRow>? communityMemberOutput;
  // Model for CommunityBookmarkButton component.
  late CommunityBookmarkButtonModel communityBookmarkButtonModel;
  // Model for CommunityBottomSheetButton component.
  late CommunityBottomSheetButtonModel communityBottomSheetButtonModel;
  // Model for CommunityCountsRow component.
  late CommunityCountsRowModel communityCountsRowModel;

  @override
  void initState(BuildContext context) {
    communityBookmarkButtonModel =
        createModel(context, () => CommunityBookmarkButtonModel());
    communityBottomSheetButtonModel =
        createModel(context, () => CommunityBottomSheetButtonModel());
    communityCountsRowModel =
        createModel(context, () => CommunityCountsRowModel());
  }

  @override
  void dispose() {
    communityBookmarkButtonModel.dispose();
    communityBottomSheetButtonModel.dispose();
    communityCountsRowModel.dispose();
  }
}
