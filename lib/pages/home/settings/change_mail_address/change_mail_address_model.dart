import '/backend/api_requests/api_calls.dart';
import '/components/warning_text/warning_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'change_mail_address_widget.dart' show ChangeMailAddressWidget;
import 'package:flutter/material.dart';

class ChangeMailAddressModel extends FlutterFlowModel<ChangeMailAddressWidget> {
  ///  Local state fields for this page.

  int isPasswordCorrect = 0;

  String? password;

  bool disableButton = false;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for WarningText component.
  late WarningTextModel warningTextModel;
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '入力してください';
    }

    return null;
  }

  // Stores action output result for [Custom Action - authLogin] action in Button widget.
  bool? loginSuccess;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '入力してください';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'メールアドレスの形式が正しくではありません';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (updateUserEmail)] action in Button widget.
  ApiCallResponse? updateEmail;

  @override
  void initState(BuildContext context) {
    warningTextModel = createModel(context, () => WarningTextModel());
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
  }

  @override
  void dispose() {
    warningTextModel.dispose();
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
