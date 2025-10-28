import '/components/primary_button/primary_button_widget.dart';
import '/components/warning_text/warning_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'password_verify_code_widget.dart' show PasswordVerifyCodeWidget;
import 'package:flutter/material.dart';

class PasswordVerifyCodeModel
    extends FlutterFlowModel<PasswordVerifyCodeWidget> {
  ///  Local state fields for this page.

  bool? codeError = false;

  ///  State fields for stateful widgets in this page.

  // Model for WarningText component.
  late WarningTextModel warningTextModel;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Stores action output result for [Custom Action - confirmOtp] action in PrimaryButton widget.
  bool? isSuccess;

  @override
  void initState(BuildContext context) {
    warningTextModel = createModel(context, () => WarningTextModel());
    pinCodeController = TextEditingController();
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    warningTextModel.dispose();
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();

    primaryButtonModel.dispose();
  }
}
