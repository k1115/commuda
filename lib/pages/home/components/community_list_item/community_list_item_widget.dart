import '/backend/supabase/supabase.dart';
import '/components/community/community_bookmark_button/community_bookmark_button_widget.dart';
import '/components/community/community_bottom_sheet_button/community_bottom_sheet_button_widget.dart';
import '/components/community/community_counts_row/community_counts_row_widget.dart';
import '/components/community/community_friends_meta_row/community_friends_meta_row_widget.dart';
import '/components/community/community_tags/community_tags_widget.dart';
import '/components/home_community_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'community_list_item_model.dart';
export 'community_list_item_model.dart';

class CommunityListItemWidget extends StatefulWidget {
  const CommunityListItemWidget({
    super.key,
    this.rankingNo,
    required this.community,
    required this.userId,
    required this.friendList,
  });

  final String? rankingNo;
  final CommunityWithImageRow? community;
  final int? userId;
  final List<int>? friendList;

  @override
  State<CommunityListItemWidget> createState() =>
      _CommunityListItemWidgetState();
}

class _CommunityListItemWidgetState extends State<CommunityListItemWidget> {
  late CommunityListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityListItemModel());

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        _model.communityMember = await CommunityMembersTable().queryRows(
          queryFn: (q) => q
              .eqOrNull(
                'community_id',
                widget.community?.id,
              )
              .eqOrNull(
                'user_id',
                FFAppState().userInfo.id,
              )
              .eqOrNull(
                'participate_status',
                1,
              ),
        );

        context.pushNamed(
          CommunityDetailWidget.routeName,
          queryParameters: {
            'community': serializeParam(
              widget.community,
              ParamType.SupabaseRow,
            ),
            'isShow': serializeParam(
              ((widget.community?.privacyType == 0) &&
                      (widget.community?.privacyType == 1)) ||
                  ((widget.community?.privacyType == 3) &&
                      (_model.communityMember != null &&
                          (_model.communityMember)!.isNotEmpty)),
              ParamType.bool,
            ),
          }.withoutNulls,
        );

        safeSetState(() {});
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 189.0,
              child: Stack(
                children: [
                  FutureBuilder<List<CommunityCoverImagesRow>>(
                    future: CommunityCoverImagesTable().querySingleRow(
                      queryFn: (q) => q.eqOrNull(
                        'community_id',
                        widget.community?.id,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<CommunityCoverImagesRow>
                          communityImageCommunityCoverImagesRowList =
                          snapshot.data!;

                      final communityImageCommunityCoverImagesRow =
                          communityImageCommunityCoverImagesRowList.isNotEmpty
                              ? communityImageCommunityCoverImagesRowList.first
                              : null;

                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          communityImageCommunityCoverImagesRow!.imageUrl,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                  if (widget.rankingNo != null && widget.rankingNo != '')
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Container(
                        width: 80.0,
                        height: 44.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.rankingNo,
                                '-',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.notoSansJp(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.0,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          wrapWithModel(
                            model: _model.communityBookmarkButtonModel,
                            updateCallback: () => safeSetState(() {}),
                            child: CommunityBookmarkButtonWidget(
                              userId: widget.userId!,
                              community: widget.community!.id!,
                            ),
                          ),
                          wrapWithModel(
                            model: _model.communityBottomSheetButtonModel,
                            updateCallback: () => safeSetState(() {}),
                            child: CommunityBottomSheetButtonWidget(
                              userId: widget.userId!,
                              community: widget.community!.id!,
                            ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 1.0),
                    child: wrapWithModel(
                      model: _model.communityFriendsMetaRowModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CommunityFriendsMetaRowWidget(
                        communityId: widget.community!.id!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.community?.name,
                            '-',
                          ),
                          maxLines: 1,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.notoSansJp(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.community?.description,
                            '-',
                          ),
                          maxLines: 3,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.notoSansJp(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).gray100,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: wrapWithModel(
                        model: _model.communityTagsModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CommunityTagsWidget(
                          categories: widget.community!.categories,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        wrapWithModel(
                          model: _model.communityCountsRowModel,
                          updateCallback: () => safeSetState(() {}),
                          child: CommunityCountsRowWidget(
                            community: widget.community!,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.homeCommunityButtonModel,
                          updateCallback: () => safeSetState(() {}),
                          child: HomeCommunityButtonWidget(
                            communityId: widget.community?.id,
                            creatorId: widget.community!.creatorId!,
                            privacyType: widget.community!.privacyType!,
                            communityName: widget.community!.name!,
                          ),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(height: 7.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
