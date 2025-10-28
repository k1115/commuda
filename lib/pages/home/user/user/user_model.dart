import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/components/user_community/user_community_widget.dart';
import '/pages/home/user/components/badge_item/badge_item_widget.dart';
import '/pages/home/user/components/friend_item/friend_item_widget.dart';
import '/index.dart';
import 'dart:async';
import 'user_widget.dart' show UserWidget;
import 'package:flutter/material.dart';

class UserModel extends FlutterFlowModel<UserWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  Completer<List<CommunityMembersRow>>? requestCompleter1;
  // Models for UserCommunity dynamic component.
  late FlutterFlowDynamicModels<UserCommunityModel> userCommunityModels;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Completer<List<FriendsProfileViewRow>>? requestCompleter2;
  // Models for FriendItem dynamic component.
  late FlutterFlowDynamicModels<FriendItemModel> friendItemModels;
  Completer<List<ProfileWithDetailRow>>? requestCompleter3;
  // Models for BadgeItem dynamic component.
  late FlutterFlowDynamicModels<BadgeItemModel> badgeItemModels;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<BlockUsersRow>? blockUserIdsOutput;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<ChatroomOverviewRow>? chatroomOverviewOutput;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<ChatroomOverviewRow>? chatroomOverviewOutput1;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<FriendsRow>? friendOutput;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChatroomOverviewRow>? overviewOutput;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ChatroomsRow? chatroomOutput;

  @override
  void initState(BuildContext context) {
    userCommunityModels = FlutterFlowDynamicModels(() => UserCommunityModel());
    friendItemModels = FlutterFlowDynamicModels(() => FriendItemModel());
    badgeItemModels = FlutterFlowDynamicModels(() => BadgeItemModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    userCommunityModels.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    friendItemModels.dispose();
    badgeItemModels.dispose();
  }

  /// Additional helper methods.
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
