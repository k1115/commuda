import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sort_bottom_sheet_widget.dart' show SortBottomSheetWidget;
import 'package:flutter/material.dart';

class SortBottomSheetModel extends FlutterFlowModel<SortBottomSheetWidget> {
  ///  Local state fields for this component.

  List<CommunitiesRow> communities = [];
  void addToCommunities(CommunitiesRow item) => communities.add(item);
  void removeFromCommunities(CommunitiesRow item) => communities.remove(item);
  void removeAtIndexFromCommunities(int index) => communities.removeAt(index);
  void insertAtIndexInCommunities(int index, CommunitiesRow item) =>
      communities.insert(index, item);
  void updateCommunitiesAtIndex(int index, Function(CommunitiesRow) updateFn) =>
      communities[index] = updateFn(communities[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
