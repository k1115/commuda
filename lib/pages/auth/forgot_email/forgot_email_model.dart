import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/components/warning_text/warning_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgot_email_widget.dart' show ForgotEmailWidget;
import 'package:flutter/material.dart';

class ForgotEmailModel extends FlutterFlowModel<ForgotEmailWidget> {
  ///  Local state fields for this page.

  bool? showError = false;

  ///  State fields for stateful widgets in this page.

  // Model for WarningText component.
  late WarningTextModel warningTextModel;
  // State field(s) for NickName widget.
  FocusNode? nickNameFocusNode;
  TextEditingController? nickNameTextController;
  String? Function(BuildContext, String?)? nickNameTextControllerValidator;
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Stores action output result for [Backend Call - Query Rows] action in PrimaryButton widget.
  List<UsersRow>? userOutput;
  // Stores action output result for [Custom Action - authLogin] action in PrimaryButton widget.
  bool? isSuccess;
  // Stores action output result for [Backend Call - API (sendEmail)] action in PrimaryButton widget.
  ApiCallResponse? sendEmail;

  @override
  void initState(BuildContext context) {
    warningTextModel = createModel(context, () => WarningTextModel());
    passwordVisibility = false;
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    warningTextModel.dispose();
    nickNameFocusNode?.dispose();
    nickNameTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    primaryButtonModel.dispose();
  }
}
