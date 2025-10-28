import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/common/app_nav_bar/app_nav_bar_widget.dart';
import '/components/drawer/drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/components/timeline_item/timeline_item_widget.dart';
import '/pages/home/home_page/friend_list/friend_list_widget.dart';
import '/pages/home/home_page/information_list/information_list_widget.dart';
import '/pages/home/home_page/new_list/new_list_widget.dart';
import '/pages/home/home_page/ranking_list/ranking_list_widget.dart';
import '/pages/home/home_page/soaring_list/soaring_list_widget.dart';
import '/index.dart';
import 'dart:async';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Home widget.
  List<UserLoginsRow>? userLogins;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  Completer<ApiCallResponse>? apiRequestCompleter2;
  // Model for informationList component.
  late InformationListModel informationListModel;
  // Model for rankingList component.
  late RankingListModel rankingListModel;
  // Model for newList component.
  late NewListModel newListModel;
  // Model for soaringList component.
  late SoaringListModel soaringListModel;
  // Model for friendList component.
  late FriendListModel friendListModel;
  Stream<List<CommunityThreadDetailsRow>>? timeLineContainerSupabaseStream;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  // Models for TimelineItem dynamic component.
  late FlutterFlowDynamicModels<TimelineItemModel> timelineItemModels;
  // Model for AppNavBar component.
  late AppNavBarModel appNavBarModel;
  // Model for Drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    informationListModel = createModel(context, () => InformationListModel());
    rankingListModel = createModel(context, () => RankingListModel());
    newListModel = createModel(context, () => NewListModel());
    soaringListModel = createModel(context, () => SoaringListModel());
    friendListModel = createModel(context, () => FriendListModel());
    timelineItemModels = FlutterFlowDynamicModels(() => TimelineItemModel());
    appNavBarModel = createModel(context, () => AppNavBarModel());
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    informationListModel.dispose();
    rankingListModel.dispose();
    newListModel.dispose();
    soaringListModel.dispose();
    friendListModel.dispose();
    timelineItemModels.dispose();
    appNavBarModel.dispose();
    drawerModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
