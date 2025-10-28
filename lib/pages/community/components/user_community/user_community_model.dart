import '/backend/supabase/supabase.dart';
import '/components/community/community_bookmark_button/community_bookmark_button_widget.dart';
import '/components/community/community_bottom_sheet_button/community_bottom_sheet_button_widget.dart';
import '/components/community/community_friends_meta_row/community_friends_meta_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_community_widget.dart' show UserCommunityWidget;
import 'package:flutter/material.dart';

class UserCommunityModel extends FlutterFlowModel<UserCommunityWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<CommunityMembersRow>? communityMemberOutput;
  // Model for CommunityBookmarkButton component.
  late CommunityBookmarkButtonModel communityBookmarkButtonModel;
  // Model for CommunityBottomSheetButton component.
  late CommunityBottomSheetButtonModel communityBottomSheetButtonModel;
  // Model for CommunityFriendsMetaRow component.
  late CommunityFriendsMetaRowModel communityFriendsMetaRowModel;

  @override
  void initState(BuildContext context) {
    communityBookmarkButtonModel =
        createModel(context, () => CommunityBookmarkButtonModel());
    communityBottomSheetButtonModel =
        createModel(context, () => CommunityBottomSheetButtonModel());
    communityFriendsMetaRowModel =
        createModel(context, () => CommunityFriendsMetaRowModel());
  }

  @override
  void dispose() {
    communityBookmarkButtonModel.dispose();
    communityBottomSheetButtonModel.dispose();
    communityFriendsMetaRowModel.dispose();
  }
}
