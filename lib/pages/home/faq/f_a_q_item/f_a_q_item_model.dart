import '/flutter_flow/flutter_flow_util.dart';
import 'f_a_q_item_widget.dart' show FAQItemWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class FAQItemModel extends FlutterFlowModel<FAQItemWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
