import '/backend/supabase/supabase.dart';
import '/components/common/app_nav_bar/app_nav_bar_widget.dart';
import '/components/drawer/drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/components/user_community/user_community_widget.dart';
import '/pages/home/user/components/badge_item/badge_item_widget.dart';
import '/pages/home/user/components/friend_item/friend_item_widget.dart';
import '/index.dart';
import 'dart:async';
import 'my_page_widget.dart' show MyPageWidget;
import 'package:flutter/material.dart';

class MyPageModel extends FlutterFlowModel<MyPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  Completer<List<CommunityMembersRow>>? requestCompleter2;
  // Models for UserCommunity dynamic component.
  late FlutterFlowDynamicModels<UserCommunityModel> userCommunityModels;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Completer<List<FriendsProfileViewRow>>? requestCompleter1;
  // Models for FriendItem dynamic component.
  late FlutterFlowDynamicModels<FriendItemModel> friendItemModels;
  Completer<List<ProfileWithDetailRow>>? requestCompleter3;
  // Models for BadgeItem dynamic component.
  late FlutterFlowDynamicModels<BadgeItemModel> badgeItemModels;
  // Model for AppNavBar component.
  late AppNavBarModel appNavBarModel;
  // Model for Drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    userCommunityModels = FlutterFlowDynamicModels(() => UserCommunityModel());
    friendItemModels = FlutterFlowDynamicModels(() => FriendItemModel());
    badgeItemModels = FlutterFlowDynamicModels(() => BadgeItemModel());
    appNavBarModel = createModel(context, () => AppNavBarModel());
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    userCommunityModels.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    friendItemModels.dispose();
    badgeItemModels.dispose();
    appNavBarModel.dispose();
    drawerModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
