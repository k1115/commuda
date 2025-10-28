import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/components/home_column_title/home_column_title_widget.dart';
import '/pages/home/components/home_community_item/home_community_item_widget.dart';
import 'soaring_list_widget.dart' show SoaringListWidget;
import 'package:flutter/material.dart';

class SoaringListModel extends FlutterFlowModel<SoaringListWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for HomeColumnTitle component.
  late HomeColumnTitleModel homeColumnTitleModel;
  // Models for HomeCommunityItem dynamic component.
  late FlutterFlowDynamicModels<HomeCommunityItemModel> homeCommunityItemModels;

  @override
  void initState(BuildContext context) {
    homeColumnTitleModel = createModel(context, () => HomeColumnTitleModel());
    homeCommunityItemModels =
        FlutterFlowDynamicModels(() => HomeCommunityItemModel());
  }

  @override
  void dispose() {
    homeColumnTitleModel.dispose();
    homeCommunityItemModels.dispose();
  }
}
