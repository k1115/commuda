import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/warning_text/warning_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'register_modal_widget.dart' show RegisterModalWidget;
import 'package:flutter/material.dart';

class RegisterModalModel extends FlutterFlowModel<RegisterModalWidget> {
  ///  Local state fields for this component.

  int passwordError = 0;

  bool isConfirm = false;

  bool isShowPassword = false;

  bool disableButton = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for WarningText component.
  late WarningTextModel warningTextModel;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'メールアドレスを入力してください。';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'メールアドレスの形式が正しくありません。';
    }
    return null;
  }

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'ニックネームを入力してください。';
    }

    return null;
  }

  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'パスワードを入力してください。';
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
      return '確認用パスワードを入力してください。';
    }

    if (val.length < 8) {
      return 'パスワードは8文字以上で入力してください。';
    }

    if (!RegExp('^[a-zA-Z0-9]+\$').hasMatch(val)) {
      return 'パスワードは半角英数字で入力してください。';
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateSuccess;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? emailUser;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UsersRow? userOutput;
  // Stores action output result for [Backend Call - API (GetUserInfoByAuthId)] action in Button widget.
  ApiCallResponse? userInfo;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UsersRow? googleOutput;
  // Stores action output result for [Backend Call - API (GetUserInfoByAuthId)] action in Button widget.
  ApiCallResponse? googleInfo;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UsersRow? appleOutput;
  // Stores action output result for [Backend Call - API (GetUserInfoByAuthId)] action in Button widget.
  ApiCallResponse? appleInfo;

  @override
  void initState(BuildContext context) {
    warningTextModel = createModel(context, () => WarningTextModel());
    emailTextControllerValidator = _emailTextControllerValidator;
    nameTextControllerValidator = _nameTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    passwordConfirmationVisibility = false;
    passwordConfirmationTextControllerValidator =
        _passwordConfirmationTextControllerValidator;
  }

  @override
  void dispose() {
    warningTextModel.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    passwordConfirmationFocusNode?.dispose();
    passwordConfirmationTextController?.dispose();
  }
}
