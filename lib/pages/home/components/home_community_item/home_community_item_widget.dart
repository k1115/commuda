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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_community_item_model.dart';
export 'home_community_item_model.dart';

class HomeCommunityItemWidget extends StatefulWidget {
  const HomeCommunityItemWidget({
    super.key,
    required this.community,
    required this.userId,
    int? width,
    bool? isFriendCommunity,
    this.friendList,
  })  : this.width = width ?? 290,
        this.isFriendCommunity = isFriendCommunity ?? false;

  final CommunityWithImageRow? community;
  final int? userId;
  final int width;
  final bool isFriendCommunity;
  final List<int>? friendList;

  @override
  State<HomeCommunityItemWidget> createState() =>
      _HomeCommunityItemWidgetState();
}

class _HomeCommunityItemWidgetState extends State<HomeCommunityItemWidget> {
  late HomeCommunityItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeCommunityItemModel());

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
        _model.communityMemberOutput = await CommunityMembersTable().queryRows(
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
              ((widget.community?.privacyType == 0) ||
                      (widget.community?.privacyType == 1)) ||
                  ((widget.community?.privacyType == 3) &&
                      (_model.communityMemberOutput != null &&
                          (_model.communityMemberOutput)!.isNotEmpty)),
              ParamType.bool,
            ),
            'isInvite': serializeParam(
              false,
              ParamType.bool,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );

        safeSetState(() {});
      },
      child: Container(
        width: valueOrDefault<double>(
          widget.width.toDouble(),
          290.0,
        ),
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 152.0,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: Builder(
                      builder: (context) {
                        if (widget.community?.imageUrl != null &&
                            widget.community?.imageUrl != '') {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 500),
                              fadeOutDuration: Duration(milliseconds: 500),
                              imageUrl: widget.community!.imageUrl!,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          );
                        } else {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/image-cover.png',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          wrapWithModel(
                            model: _model.communityBookmarkButtonModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
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
                    child: Builder(
                      builder: (context) {
                        if (widget.isFriendCommunity) {
                          return wrapWithModel(
                            model: _model.communityFriendsMetaRowModel,
                            updateCallback: () => safeSetState(() {}),
                            child: CommunityFriendsMetaRowWidget(
                              communityId: widget.community!.id!,
                              friendList: widget.friendList,
                            ),
                          );
                        } else {
                          return Container(
                            width: 0.0,
                            height: 0.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          );
                        }
                      },
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
                            '推し商品語り場推し商品語り場推し商品語り場推し商品語り場推し商品語り場推し商品語り場推し商品語り場推し商品語り場',
                          ).maybeHandleOverflow(
                            maxChars: 32,
                            replacement: '…',
                          ),
                          maxLines: 2,
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
                        Container(
                          height: 60.0,
                          decoration: BoxDecoration(),
                          child: Text(
                            valueOrDefault<String>(
                              widget.community?.description,
                              '「うちの冷蔵庫、これないと困る！」そんなあなたの推しを語ってください。企業からの開発裏話やアンケートもあるかも？「うちの冷蔵庫、これないと困る！」そんなあなたの推しを語ってください。企業からの開発裏話やアンケートもあるかも？',
                            ).maybeHandleOverflow(
                              maxChars: 59,
                              replacement: '…',
                            ),
                            maxLines: 3,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
