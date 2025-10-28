import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/news/components/news_community_bar/news_community_bar_widget.dart';
import 'participate_item_widget.dart' show ParticipateItemWidget;
import 'package:flutter/material.dart';

class ParticipateItemModel extends FlutterFlowModel<ParticipateItemWidget> {
  ///  Local state fields for this component.

  bool disableButton = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Update Row(s)] action in participateItem widget.
  List<CommunityMembersRow>? communityMemberOutput;
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
