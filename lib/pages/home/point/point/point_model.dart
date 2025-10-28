import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/point/point_item/point_item_widget.dart';
import 'point_widget.dart' show PointWidget;
import 'package:flutter/material.dart';

class PointModel extends FlutterFlowModel<PointWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Models for PointItem dynamic component.
  late FlutterFlowDynamicModels<PointItemModel> pointItemModels;

  @override
  void initState(BuildContext context) {
    pointItemModels = FlutterFlowDynamicModels(() => PointItemModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    pointItemModels.dispose();
  }
}
