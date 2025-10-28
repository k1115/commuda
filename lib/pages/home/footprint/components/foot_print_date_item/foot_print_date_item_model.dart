import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/footprint/components/foot_print_item/foot_print_item_widget.dart';
import 'foot_print_date_item_widget.dart' show FootPrintDateItemWidget;
import 'package:flutter/material.dart';

class FootPrintDateItemModel extends FlutterFlowModel<FootPrintDateItemWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for FootPrintItem dynamic component.
  late FlutterFlowDynamicModels<FootPrintItemModel> footPrintItemModels1;
  // Models for FootPrintItem dynamic component.
  late FlutterFlowDynamicModels<FootPrintItemModel> footPrintItemModels2;

  @override
  void initState(BuildContext context) {
    footPrintItemModels1 = FlutterFlowDynamicModels(() => FootPrintItemModel());
    footPrintItemModels2 = FlutterFlowDynamicModels(() => FootPrintItemModel());
  }

  @override
  void dispose() {
    footPrintItemModels1.dispose();
    footPrintItemModels2.dispose();
  }
}
