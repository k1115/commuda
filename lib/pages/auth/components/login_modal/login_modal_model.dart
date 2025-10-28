import '/backend/api_requests/api_calls.dart';
import '/components/warning_text/warning_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_modal_widget.dart' show LoginModalWidget;
import 'package:flutter/material.dart';

class LoginModalModel extends FlutterFlowModel<LoginModalWidget> {
  ///  Local state fields for this component.

  bool authError = false;

  bool disableButton = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for WarningText component.
  late WarningTextModel warningTextModel;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '入力してください。';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'メールアドレスの形式が正しくありません。';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '入力してください。';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateSuccess;
  // Stores action output result for [Custom Action - authLogin] action in Button widget.
  bool? loginSuccess;
  // Stores action output result for [Backend Call - API (GetUserInfoByAuthId)] action in Button widget.
  ApiCallResponse? userInfo;
  // Stores action output result for [Backend Call - API (GetUserInfoByAuthId)] action in Button widget.
  ApiCallResponse? googleInfo;
  // Stores action output result for [Backend Call - API (GetUserInfoByAuthId)] action in Button widget.
  ApiCallResponse? applenfo;

  @override
  void initState(BuildContext context) {
    warningTextModel = createModel(context, () => WarningTextModel());
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    warningTextModel.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
