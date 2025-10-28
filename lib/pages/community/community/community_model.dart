import '/backend/supabase/supabase.dart';
import '/components/common/app_nav_bar/app_nav_bar_widget.dart';
import '/components/drawer/drawer_widget.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/components/user_community/user_community_widget.dart';
import '/pages/community/list/components/community_general_list_item/community_general_list_item_widget.dart';
import '/index.dart';
import 'community_widget.dart' show CommunityWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class CommunityModel extends FlutterFlowModel<CommunityWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  Completer<List<CommunityWithImageRow>>? requestCompleter;
  // Models for CommunityGeneralListItem dynamic component.
  late FlutterFlowDynamicModels<CommunityGeneralListItemModel>
      communityGeneralListItemModels;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Models for UserCommunity dynamic component.
  late FlutterFlowDynamicModels<UserCommunityModel> userCommunityModels;
  // Model for AppNavBar component.
  late AppNavBarModel appNavBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for Drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    communityGeneralListItemModels =
        FlutterFlowDynamicModels(() => CommunityGeneralListItemModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
    userCommunityModels = FlutterFlowDynamicModels(() => UserCommunityModel());
    appNavBarModel = createModel(context, () => AppNavBarModel());
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    communityGeneralListItemModels.dispose();
    primaryButtonModel.dispose();
    userCommunityModels.dispose();
    appNavBarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    drawerModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
