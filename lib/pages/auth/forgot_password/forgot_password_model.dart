import '/backend/supabase/supabase.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/components/warning_text/warning_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgot_password_widget.dart' show ForgotPasswordWidget;
import 'package:flutter/material.dart';

class ForgotPasswordModel extends FlutterFlowModel<ForgotPasswordWidget> {
  ///  Local state fields for this page.

  bool notFoundError = false;

  ///  State fields for stateful widgets in this page.

  // Model for WarningText component.
  late WarningTextModel warningTextModel;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Stores action output result for [Backend Call - Query Rows] action in PrimaryButton widget.
  List<UsersRow>? existUsers;

  @override
  void initState(BuildContext context) {
    warningTextModel = createModel(context, () => WarningTextModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    warningTextModel.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    primaryButtonModel.dispose();
  }
}
