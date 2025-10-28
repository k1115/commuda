import '/backend/supabase/supabase.dart';
import '/components/empty_list_widget.dart';
import '/components/empty_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/components/home_column_title/home_column_title_widget.dart';
import '/pages/home/components/home_community_item/home_community_item_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'friend_list_model.dart';
export 'friend_list_model.dart';

class FriendListWidget extends StatefulWidget {
  const FriendListWidget({
    super.key,
    required this.communityIds,
    required this.friendIds,
  });

  final List<int>? communityIds;
  final List<int>? friendIds;

  @override
  State<FriendListWidget> createState() => _FriendListWidgetState();
}

class _FriendListWidgetState extends State<FriendListWidget> {
  late FriendListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FriendListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.goNamed(
                  FriendInCommunitiesWidget.routeName,
                  queryParameters: {
                    'friendList': serializeParam(
                      widget.friendIds,
                      ParamType.int,
                      isList: true,
                    ),
                    'communityList': serializeParam(
                      widget.communityIds,
                      ParamType.int,
                      isList: true,
                    ),
                  }.withoutNulls,
                );
              },
              child: wrapWithModel(
                model: _model.homeColumnTitleModel,
                updateCallback: () => safeSetState(() {}),
                child: HomeColumnTitleWidget(
                  title: '友人が参加しているコミュニティ',
                ),
              ),
            ),
            FutureBuilder<List<CommunityWithImageRow>>(
              future: CommunityWithImageTable().queryRows(
                queryFn: (q) => q
                    .inFilterOrNull(
                      'id',
                      widget.communityIds,
                    )
                    .inFilterOrNull(
                      'privacy_type',
                      FFAppConstants.enableMode,
                    ),
                limit: 5,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return EmptyLoadingWidget();
                }
                List<CommunityWithImageRow> containerCommunityWithImageRowList =
                    snapshot.data!;

                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Builder(
                    builder: (context) {
                      final communityList =
                          containerCommunityWithImageRowList.toList();
                      if (communityList.isEmpty) {
                        return Container(
                          height: 150.0,
                          child: EmptyListWidget(
                            text: 'コミュニティがありません。',
                          ),
                        );
                      }

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(communityList.length,
                              (communityListIndex) {
                            final communityListItem =
                                communityList[communityListIndex];
                            return wrapWithModel(
                              model: _model.homeCommunityItemModels.getModel(
                                communityListIndex.toString(),
                                communityListIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: HomeCommunityItemWidget(
                                key: Key(
                                  'Keyswf_${communityListIndex.toString()}',
                                ),
                                community: communityListItem,
                                userId: FFAppState().userInfo.id,
                                width: 290,
                                isFriendCommunity: true,
                                friendList: widget.friendIds,
                              ),
                            );
                          }).divide(SizedBox(width: 8.0)),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ].divide(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
