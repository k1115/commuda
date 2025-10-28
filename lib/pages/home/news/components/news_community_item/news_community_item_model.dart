import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/news/components/news_community_bar/news_community_bar_widget.dart';
import 'news_community_item_widget.dart' show NewsCommunityItemWidget;
import 'package:flutter/material.dart';

class NewsCommunityItemModel extends FlutterFlowModel<NewsCommunityItemWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<CommunityThreadDetailsRow>? threadOutput;
  // Model for NewsCommunityBar component.
  late NewsCommunityBarModel newsCommunityBarModel;

  @override
  void initState(BuildContext context) {
    newsCommunityBarModel = createModel(context, () => NewsCommunityBarModel());
  }

  @override
  void dispose() {
    newsCommunityBarModel.dispose();
  }
}
