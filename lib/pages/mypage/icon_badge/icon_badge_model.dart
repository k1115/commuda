import '/flutter_flow/flutter_flow_util.dart';
import '/pages/mypage/badge_list_item/badge_list_item_widget.dart';
import 'icon_badge_widget.dart' show IconBadgeWidget;
import 'package:flutter/material.dart';

class IconBadgeModel extends FlutterFlowModel<IconBadgeWidget> {
  ///  Local state fields for this page.

  int? selectedBageId;

  int? initialBdageId;

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
