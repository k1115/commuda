import '/backend/supabase/supabase.dart';
import '/components/common/app_nav_bar/app_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/components/home_info_item/home_info_item_widget.dart';
import '/index.dart';
import 'dart:async';
import 'information_widget.dart' show InformationWidget;
import 'package:flutter/material.dart';

class InformationModel extends FlutterFlowModel<InformationWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<List<InformationsRow>>? requestCompleter;
  // Models for HomeInfoItem dynamic component.
  late FlutterFlowDynamicModels<HomeInfoItemModel> homeInfoItemModels;
  // Model for AppNavBar component.
  late AppNavBarModel appNavBarModel;

  @override
  void initState(BuildContext context) {
    homeInfoItemModels = FlutterFlowDynamicModels(() => HomeInfoItemModel());
    appNavBarModel = createModel(context, () => AppNavBarModel());
  }

  @override
  void dispose() {
    homeInfoItemModels.dispose();
    appNavBarModel.dispose();
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
