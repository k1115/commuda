import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/threads/components/community_comment_item/community_comment_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'community_thread_bottom_sheet_model.dart';
export 'community_thread_bottom_sheet_model.dart';

class CommunityThreadBottomSheetWidget extends StatefulWidget {
  const CommunityThreadBottomSheetWidget({super.key});

  @override
  State<CommunityThreadBottomSheetWidget> createState() =>
      _CommunityThreadBottomSheetWidgetState();
}

class _CommunityThreadBottomSheetWidgetState
    extends State<CommunityThreadBottomSheetWidget> {
  late CommunityThreadBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityThreadBottomSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.communityMembersOutput = await CommunityMembersTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'user_id',
              FFAppState().userInfo.id,
            )
            .eqOrNull(
              'participate_status',
              1,
            )
            .order('created_at'),
      );
      for (int loop1Index = 0;
          loop1Index < _model.communityMembersOutput!.length;
          loop1Index++) {
        final currentLoop1Item = _model.communityMembersOutput![loop1Index];
        _model.communitiesOutput = await CommunityWithImageTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'id',
            currentLoop1Item.communityId,
          ),
        );
        _model.addToCommunities(_model.communitiesOutput!.firstOrNull!);
      }

      safeSetState(() {});
    });

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
      height: 400.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 80.0,
              child: Divider(
                height: 4.0,
                thickness: 4.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Text(
                'スレッド投稿先を選択',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.notoSansJp(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 8.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final mycommunities =
                        _model.communities.unique((e) => e).toList();

                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(mycommunities.length,
                            (mycommunitiesIndex) {
                          final mycommunitiesItem =
                              mycommunities[mycommunitiesIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().selectedCommunity =
                                  mycommunitiesItem.id!;
                              safeSetState(() {});
                            },
                            child: wrapWithModel(
                              model: _model.communityCommentItemModels.getModel(
                                mycommunitiesItem.id!.toString(),
                                mycommunitiesIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: CommunityCommentItemWidget(
                                key: Key(
                                  'Key27q_${mycommunitiesItem.id!.toString()}',
                                ),
                                community: mycommunitiesItem,
                                isSelected: mycommunitiesItem.id ==
                                    FFAppState().selectedCommunity,
                              ),
                            ),
                          );
                        }),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
