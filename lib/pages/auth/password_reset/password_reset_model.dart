import '/components/primary_button/primary_button_widget.dart';
import '/components/warning_text/warning_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'password_reset_widget.dart' show PasswordResetWidget;
import 'package:flutter/material.dart';

class PasswordResetModel extends FlutterFlowModel<PasswordResetWidget> {
  ///  Local state fields for this page.

  bool passwordError = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for WarningText component.
  late WarningTextModel warningTextModel;
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'パスワードは入力してください。';
    }

    if (val.length < 8) {
      return 'パスワードは8文字以上で入力してください。';
    }

    if (!RegExp('^[a-zA-Z0-9]+\$').hasMatch(val)) {
      return 'パスワードは半角英数字で入力してください。';
    }
    return null;
  }

  // State field(s) for PasswordConfirmation widget.
  FocusNode? passwordConfirmationFocusNode;
  TextEditingController? passwordConfirmationTextController;
  late bool passwordConfirmationVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmationTextControllerValidator;
  String? _passwordConfirmationTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'パスワード(確認用)は入力してください。';
    }

    if (val.length < 8) {
      return 'パスワードは8文字以上で入力してください。';
    }

    if (!RegExp('^[a-zA-Z0-9]+\$').hasMatch(val)) {
      return 'パスワードは半角英数字で入力してください。';
    }
    return null;
  }

  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Stores action output result for [Validate Form] action in PrimaryButton widget.
  bool? validateSuccess;

  @override
  void initState(BuildContext context) {
    warningTextModel = createModel(context, () => WarningTextModel());
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    passwordConfirmationVisibility = false;
    passwordConfirmationTextControllerValidator =
        _passwordConfirmationTextControllerValidator;
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    warningTextModel.dispose();
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    passwordConfirmationFocusNode?.dispose();
    passwordConfirmationTextController?.dispose();

    primaryButtonModel.dispose();
  }
}
