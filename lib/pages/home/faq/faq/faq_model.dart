import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/faq/f_a_q_item/f_a_q_item_widget.dart';
import '/index.dart';
import 'faq_widget.dart' show FaqWidget;
import 'package:flutter/material.dart';

class FaqModel extends FlutterFlowModel<FaqWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for FAQItem dynamic component.
  late FlutterFlowDynamicModels<FAQItemModel> fAQItemModels;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    fAQItemModels = FlutterFlowDynamicModels(() => FAQItemModel());
  }

  @override
  void dispose() {
    fAQItemModels.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
