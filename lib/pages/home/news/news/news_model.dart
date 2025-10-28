import '/components/common/comming_soon/comming_soon_widget.dart';
import '/components/participate_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/news/components/news_community_item/news_community_item_widget.dart';
import '/pages/home/news/components/news_friendtem/news_friendtem_widget.dart';
import '/pages/home/news/components/news_operation_item/news_operation_item_widget.dart';
import '/index.dart';
import 'news_widget.dart' show NewsWidget;
import 'package:flutter/material.dart';

class NewsModel extends FlutterFlowModel<NewsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Models for NewsCommunityItem dynamic component.
  late FlutterFlowDynamicModels<NewsCommunityItemModel> newsCommunityItemModels;
  // Models for NewsOperationItem dynamic component.
  late FlutterFlowDynamicModels<NewsOperationItemModel> newsOperationItemModels;
  // Models for NewsFriendtem dynamic component.
  late FlutterFlowDynamicModels<NewsFriendtemModel> newsFriendtemModels;
  // Model for CommingSoon component.
  late CommingSoonModel commingSoonModel1;
  // Model for CommingSoon component.
  late CommingSoonModel commingSoonModel2;
  // Models for participateItem dynamic component.
  late FlutterFlowDynamicModels<ParticipateItemModel> participateItemModels;

  @override
  void initState(BuildContext context) {
    newsCommunityItemModels =
        FlutterFlowDynamicModels(() => NewsCommunityItemModel());
    newsOperationItemModels =
        FlutterFlowDynamicModels(() => NewsOperationItemModel());
    newsFriendtemModels = FlutterFlowDynamicModels(() => NewsFriendtemModel());
    commingSoonModel1 = createModel(context, () => CommingSoonModel());
    commingSoonModel2 = createModel(context, () => CommingSoonModel());
    participateItemModels =
        FlutterFlowDynamicModels(() => ParticipateItemModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    newsCommunityItemModels.dispose();
    newsOperationItemModels.dispose();
    newsFriendtemModels.dispose();
    commingSoonModel1.dispose();
    commingSoonModel2.dispose();
    participateItemModels.dispose();
  }
}
