import '/backend/supabase/supabase.dart';
import '/components/community/community_counts_row/community_counts_row_widget.dart';
import '/components/community_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_general_list_item_widget.dart'
    show CommunityGeneralListItemWidget;
import 'package:flutter/material.dart';

class CommunityGeneralListItemModel
    extends FlutterFlowModel<CommunityGeneralListItemWidget> {
  ///  Local state fields for this component.

  bool disableButton = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<CommunityMembersRow>? commuityMembers;
  // Model for CommunityCountsRow component.
  late CommunityCountsRowModel communityCountsRowModel;
  // Model for CommunityButton component.
  late CommunityButtonModel communityButtonModel;

  @override
  void initState(BuildContext context) {
    communityCountsRowModel =
        createModel(context, () => CommunityCountsRowModel());
    communityButtonModel = createModel(context, () => CommunityButtonModel());
  }

  @override
  void dispose() {
    communityCountsRowModel.dispose();
    communityButtonModel.dispose();
  }
}
