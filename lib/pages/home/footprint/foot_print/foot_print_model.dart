import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/footprint/components/foot_print_date_item/foot_print_date_item_widget.dart';
import 'foot_print_widget.dart' show FootPrintWidget;
import 'package:flutter/material.dart';

class FootPrintModel extends FlutterFlowModel<FootPrintWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Models for FootPrintDateItem dynamic component.
  late FlutterFlowDynamicModels<FootPrintDateItemModel>
      footPrintDateItemModels1;
  // Models for FootPrintDateItem dynamic component.
  late FlutterFlowDynamicModels<FootPrintDateItemModel>
      footPrintDateItemModels2;

  @override
  void initState(BuildContext context) {
    footPrintDateItemModels1 =
        FlutterFlowDynamicModels(() => FootPrintDateItemModel());
    footPrintDateItemModels2 =
        FlutterFlowDynamicModels(() => FootPrintDateItemModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    footPrintDateItemModels1.dispose();
    footPrintDateItemModels2.dispose();
  }
}
