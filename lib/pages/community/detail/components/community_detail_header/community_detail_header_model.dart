import '/backend/supabase/supabase.dart';
import '/components/community/community_bookmark_button/community_bookmark_button_widget.dart';
import '/components/community/community_bottom_sheet_button/community_bottom_sheet_button_widget.dart';
import '/components/community/community_counts_row/community_counts_row_widget.dart';
import '/components/community/community_friends_meta_row/community_friends_meta_row_widget.dart';
import '/components/community/community_tags/community_tags_widget.dart';
import '/components/community_detail_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_detail_header_widget.dart' show CommunityDetailHeaderWidget;
import 'package:flutter/material.dart';

class CommunityDetailHeaderModel
    extends FlutterFlowModel<CommunityDetailHeaderWidget> {
  ///  Local state fields for this component.

  int count = 3;

  int buttonType = 0;

  List<ProfileRow> friendImages = [];
  void addToFriendImages(ProfileRow item) => friendImages.add(item);
  void removeFromFriendImages(ProfileRow item) => friendImages.remove(item);
  void removeAtIndexFromFriendImages(int index) => friendImages.removeAt(index);
  void insertAtIndexInFriendImages(int index, ProfileRow item) =>
      friendImages.insert(index, item);
  void updateFriendImagesAtIndex(int index, Function(ProfileRow) updateFn) =>
      friendImages[index] = updateFn(friendImages[index]);

  bool disableButton = false;

  bool? showAll = false;

  ///  State fields for stateful widgets in this component.

  // Model for CommunityFriendsMetaRow component.
  late CommunityFriendsMetaRowModel communityFriendsMetaRowModel;
  // Model for CommunityBookmarkButton component.
  late CommunityBookmarkButtonModel communityBookmarkButtonModel;
  // Model for CommunityBottomSheetButton component.
  late CommunityBottomSheetButtonModel communityBottomSheetButtonModel;
  // Model for CommunityCountsRow component.
  late CommunityCountsRowModel communityCountsRowModel;
  // Model for CommunityDetailButton component.
  late CommunityDetailButtonModel communityDetailButtonModel;
  // Model for CommunityTags component.
  late CommunityTagsModel communityTagsModel;

  @override
  void initState(BuildContext context) {
    communityFriendsMetaRowModel =
        createModel(context, () => CommunityFriendsMetaRowModel());
    communityBookmarkButtonModel =
        createModel(context, () => CommunityBookmarkButtonModel());
    communityBottomSheetButtonModel =
        createModel(context, () => CommunityBottomSheetButtonModel());
    communityCountsRowModel =
        createModel(context, () => CommunityCountsRowModel());
    communityDetailButtonModel =
        createModel(context, () => CommunityDetailButtonModel());
    communityTagsModel = createModel(context, () => CommunityTagsModel());
  }

  @override
  void dispose() {
    communityFriendsMetaRowModel.dispose();
    communityBookmarkButtonModel.dispose();
    communityBottomSheetButtonModel.dispose();
    communityCountsRowModel.dispose();
    communityDetailButtonModel.dispose();
    communityTagsModel.dispose();
  }
}
