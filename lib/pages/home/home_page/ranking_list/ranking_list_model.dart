import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/components/home_column_title/home_column_title_widget.dart';
import '/pages/home/components/home_ranking_item/home_ranking_item_widget.dart';
import 'ranking_list_widget.dart' show RankingListWidget;
import 'package:flutter/material.dart';

class RankingListModel extends FlutterFlowModel<RankingListWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for HomeColumnTitle component.
  late HomeColumnTitleModel homeColumnTitleModel;
  // Models for HomeRankingItem dynamic component.
  late FlutterFlowDynamicModels<HomeRankingItemModel> homeRankingItemModels;

  @override
  void initState(BuildContext context) {
    homeColumnTitleModel = createModel(context, () => HomeColumnTitleModel());
    homeRankingItemModels =
        FlutterFlowDynamicModels(() => HomeRankingItemModel());
  }

  @override
  void dispose() {
    homeColumnTitleModel.dispose();
    homeRankingItemModels.dispose();
  }
}
