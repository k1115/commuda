import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_bottom_sheet_button_widget.dart'
    show CommunityBottomSheetButtonWidget;
import 'package:flutter/material.dart';

class CommunityBottomSheetButtonModel
    extends FlutterFlowModel<CommunityBottomSheetButtonWidget> {
  ///  Local state fields for this component.

  bool disableButton = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in More widget.
  List<CommunityWithImageRow>? communityOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
