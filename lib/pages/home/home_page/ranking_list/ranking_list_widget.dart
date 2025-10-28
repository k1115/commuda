import '/backend/supabase/supabase.dart';
import '/components/empty_list_widget.dart';
import '/components/empty_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/components/home_column_title/home_column_title_widget.dart';
import '/pages/home/components/home_ranking_item/home_ranking_item_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ranking_list_model.dart';
export 'ranking_list_model.dart';

class RankingListWidget extends StatefulWidget {
  const RankingListWidget({
    super.key,
    required this.friendList,
  });

  final List<int>? friendList;

  @override
  State<RankingListWidget> createState() => _RankingListWidgetState();
}

class _RankingListWidgetState extends State<RankingListWidget> {
  late RankingListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RankingListModel());

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
                  RankingWidget.routeName,
                  queryParameters: {
                    'friendList': serializeParam(
                      widget.friendList,
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
                  title: '総合ランキング',
                ),
              ),
            ),
            FutureBuilder<List<CommunityWithImageRow>>(
              future: CommunityWithImageTable().queryRows(
                queryFn: (q) => q
                    .or("privacy_type.eq.0, privacy_type.eq.1")
                    .order('ranking'),
                limit: 20,
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
                      final containerVar =
                          containerCommunityWithImageRowList.toList();
                      if (containerVar.isEmpty) {
                        return Container(
                          height: 120.0,
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
                          children: List.generate(containerVar.length,
                              (containerVarIndex) {
                            final containerVarItem =
                                containerVar[containerVarIndex];
                            return wrapWithModel(
                              model: _model.homeRankingItemModels.getModel(
                                containerVarItem.id!.toString(),
                                containerVarIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: HomeRankingItemWidget(
                                key: Key(
                                  'Key120_${containerVarItem.id!.toString()}',
                                ),
                                ranking: containerVarIndex + 1,
                                community: containerVarItem,
                                userId: FFAppState().userInfo.id,
                                friendList: widget.friendList!,
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
