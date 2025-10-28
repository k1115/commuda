import '/components/common/app_nav_bar/app_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/components/community_list_item/community_list_item_widget.dart';
import 'digesting_communities_widget.dart' show DigestingCommunitiesWidget;
import 'package:flutter/material.dart';

class DigestingCommunitiesModel
    extends FlutterFlowModel<DigestingCommunitiesWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for CommunityListItem dynamic component.
  late FlutterFlowDynamicModels<CommunityListItemModel> communityListItemModels;
  // Model for AppNavBar component.
  late AppNavBarModel appNavBarModel;

  @override
  void initState(BuildContext context) {
    communityListItemModels =
        FlutterFlowDynamicModels(() => CommunityListItemModel());
    appNavBarModel = createModel(context, () => AppNavBarModel());
  }

  @override
  void dispose() {
    communityListItemModels.dispose();
    appNavBarModel.dispose();
  }
}
