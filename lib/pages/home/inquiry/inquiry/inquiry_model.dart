import '/backend/supabase/supabase.dart';
import '/components/info_text/info_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'inquiry_widget.dart' show InquiryWidget;
import 'package:flutter/material.dart';

class InquiryModel extends FlutterFlowModel<InquiryWidget> {
  ///  Local state fields for this page.

  bool isInputed = false;

  String? mailAddress;

  int? categoryId;

  String? content;

  String? categrory;

  bool disableButton = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '入力してください';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'メールアドレスの形式が正しくではありません';
    }
    return null;
  }

  // State field(s) for category widget.
  String? categoryValue;
  FormFieldController<String>? categoryValueController;
  // Stores action output result for [Backend Call - Query Rows] action in category widget.
  List<InquiryCategoriesRow>? categoryOutput;
  // State field(s) for content widget.
  FocusNode? contentFocusNode;
  TextEditingController? contentTextController;
  String? Function(BuildContext, String?)? contentTextControllerValidator;
  String? _contentTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '入力してください';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<InquiryCategoriesRow>? inquiryOutput;
  // Model for InfoText component.
  late InfoTextModel infoTextModel;

  @override
  void initState(BuildContext context) {
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    contentTextControllerValidator = _contentTextControllerValidator;
    infoTextModel = createModel(context, () => InfoTextModel());
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    contentFocusNode?.dispose();
    contentTextController?.dispose();

    infoTextModel.dispose();
  }
}
