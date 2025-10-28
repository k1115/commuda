import '/flutter_flow/flutter_flow_util.dart';
import 'identity_confirmation_bottom_sheet_widget.dart'
    show IdentityConfirmationBottomSheetWidget;
import 'package:flutter/material.dart';

class IdentityConfirmationBottomSheetModel
    extends FlutterFlowModel<IdentityConfirmationBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for Phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for Code widget.
  FocusNode? codeFocusNode;
  TextEditingController? codeTextController;
  String? Function(BuildContext, String?)? codeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    codeFocusNode?.dispose();
    codeTextController?.dispose();
  }
}
