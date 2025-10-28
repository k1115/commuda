import '/flutter_flow/flutter_flow_util.dart';
import 'community_participate_apply_bottom_sheet_widget.dart'
    show CommunityParticipateApplyBottomSheetWidget;
import 'package:flutter/material.dart';

class CommunityParticipateApplyBottomSheetModel
    extends FlutterFlowModel<CommunityParticipateApplyBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    commentFocusNode?.dispose();
    commentTextController?.dispose();
  }
}
