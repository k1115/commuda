import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/components/community_list_item/community_list_item_widget.dart';
import '/index.dart';
import 'soaring_communities_widget.dart' show SoaringCommunitiesWidget;
import 'package:flutter/material.dart';

class SoaringCommunitiesModel
    extends FlutterFlowModel<SoaringCommunitiesWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for CommunityListItem dynamic component.
  late FlutterFlowDynamicModels<CommunityListItemModel> communityListItemModels;

  @override
  void initState(BuildContext context) {
    communityListItemModels =
        FlutterFlowDynamicModels(() => CommunityListItemModel());
  }

  @override
  void dispose() {
    communityListItemModels.dispose();
  }
}
