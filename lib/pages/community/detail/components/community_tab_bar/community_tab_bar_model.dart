import '/backend/supabase/supabase.dart';
import '/components/common/comming_soon/comming_soon_widget.dart';
import '/components/common/private_thread/private_thread_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/detail/components/community_information/community_information_widget.dart';
import '/pages/community/threads/components/community_thread_header/community_thread_header_widget.dart';
import 'community_tab_bar_widget.dart' show CommunityTabBarWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class CommunityTabBarModel extends FlutterFlowModel<CommunityTabBarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  Completer<List<CommunityThreadDetailsRow>>? requestCompleter;
  // Models for CommunityThreadHeader dynamic component.
  late FlutterFlowDynamicModels<CommunityThreadHeaderModel>
      communityThreadHeaderModels;
  // Model for PrivateThread component.
  late PrivateThreadModel privateThreadModel1;
  // Model for CommingSoon component.
  late CommingSoonModel commingSoonModel;
  // Model for PrivateThread component.
  late PrivateThreadModel privateThreadModel2;
  // Model for CommunityInformation component.
  late CommunityInformationModel communityInformationModel;
  // Model for PrivateThread component.
  late PrivateThreadModel privateThreadModel3;

  @override
  void initState(BuildContext context) {
    communityThreadHeaderModels =
        FlutterFlowDynamicModels(() => CommunityThreadHeaderModel());
    privateThreadModel1 = createModel(context, () => PrivateThreadModel());
    commingSoonModel = createModel(context, () => CommingSoonModel());
    privateThreadModel2 = createModel(context, () => PrivateThreadModel());
    communityInformationModel =
        createModel(context, () => CommunityInformationModel());
    privateThreadModel3 = createModel(context, () => PrivateThreadModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    communityThreadHeaderModels.dispose();
    privateThreadModel1.dispose();
    commingSoonModel.dispose();
    privateThreadModel2.dispose();
    communityInformationModel.dispose();
    privateThreadModel3.dispose();
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
