import '/flutter_flow/flutter_flow_util.dart';
import '/pages/mypage/badge_list_item/badge_list_item_widget.dart';
import 'profile_badge_widget.dart' show ProfileBadgeWidget;
import 'package:flutter/material.dart';

class ProfileBadgeModel extends FlutterFlowModel<ProfileBadgeWidget> {
  ///  Local state fields for this page.

  List<int> selectedBadgeIds = [];
  void addToSelectedBadgeIds(int item) => selectedBadgeIds.add(item);
  void removeFromSelectedBadgeIds(int item) => selectedBadgeIds.remove(item);
  void removeAtIndexFromSelectedBadgeIds(int index) =>
      selectedBadgeIds.removeAt(index);
  void insertAtIndexInSelectedBadgeIds(int index, int item) =>
      selectedBadgeIds.insert(index, item);
  void updateSelectedBadgeIdsAtIndex(int index, Function(int) updateFn) =>
      selectedBadgeIds[index] = updateFn(selectedBadgeIds[index]);

  ///  State fields for stateful widgets in this page.

  // Models for BadgeListItem dynamic component.
  late FlutterFlowDynamicModels<BadgeListItemModel> badgeListItemModels;

  @override
  void initState(BuildContext context) {
    badgeListItemModels = FlutterFlowDynamicModels(() => BadgeListItemModel());
  }

  @override
  void dispose() {
    badgeListItemModels.dispose();
  }
}
