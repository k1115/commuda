import '/flutter_flow/flutter_flow_util.dart';
import 'thread_report_bottom_sheet_widget.dart'
    show ThreadReportBottomSheetWidget;
import 'package:flutter/material.dart';

class ThreadReportBottomSheetModel
    extends FlutterFlowModel<ThreadReportBottomSheetWidget> {
  ///  Local state fields for this component.

  List<String> reasons = [];
  void addToReasons(String item) => reasons.add(item);
  void removeFromReasons(String item) => reasons.remove(item);
  void removeAtIndexFromReasons(int index) => reasons.removeAt(index);
  void insertAtIndexInReasons(int index, String item) =>
      reasons.insert(index, item);
  void updateReasonsAtIndex(int index, Function(String) updateFn) =>
      reasons[index] = updateFn(reasons[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Checkbox1 widget.
  bool? checkbox1Value;
  // State field(s) for Checkbox2 widget.
  bool? checkbox2Value;
  // State field(s) for Checkbox3 widget.
  bool? checkbox3Value;
  // State field(s) for Checkbox4 widget.
  bool? checkbox4Value;
  // State field(s) for Checkbox5 widget.
  bool? checkbox5Value;
  // State field(s) for Detail widget.
  FocusNode? detailFocusNode;
  TextEditingController? detailTextController;
  String? Function(BuildContext, String?)? detailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    detailFocusNode?.dispose();
    detailTextController?.dispose();
  }
}
