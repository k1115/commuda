import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_loading_widget.dart';
import '/components/image_view_widget.dart';
import '/components/timeline_reaction/timeline_reaction_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/threads/components/comment_action_bottom_sheet/comment_action_bottom_sheet_widget.dart';
import '/pages/community/threads/components/thread_bookmark_button/thread_bookmark_button_widget.dart';
import '/pages/community/threads/components/thread_more_button/thread_more_button_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'timeline_item_model.dart';
export 'timeline_item_model.dart';

class TimelineItemWidget extends StatefulWidget {
  const TimelineItemWidget({
    super.key,
    required this.thread,
    required this.currentUserId,
  });

  final CommunityThreadDetailsRow? thread;
  final int? currentUserId;

  @override
  State<TimelineItemWidget> createState() => _TimelineItemWidgetState();
}

class _TimelineItemWidgetState extends State<TimelineItemWidget> {
  late TimelineItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimelineItemModel());

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

    return FutureBuilder<List<CommunityThreadReactionsRow>>(
      future: CommunityThreadReactionsTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'thread_id',
              widget.thread?.id,
            )
            .eqOrNull(
              'user_id',
              widget.currentUserId,
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return EmptyLoadingWidget();
        }
        List<CommunityThreadReactionsRow>
            containerCommunityThreadReactionsRowList = snapshot.data!;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.userOutput =
                                        await UserWithProfileTable().queryRows(
                                      queryFn: (q) => q.eqOrNull(
                                        'id',
                                        widget.thread?.creatorId,
                                      ),
                                    );

                                    context.pushNamed(
                                      UserWidget.routeName,
                                      queryParameters: {
                                        'targetUser': serializeParam(
                                          _model.userOutput?.firstOrNull,
                                          ParamType.SupabaseRow,
                                        ),
                                        'currentUserId': serializeParam(
                                          widget.currentUserId,
                                          ParamType.int,
                                        ),
                                        'communityId': serializeParam(
                                          widget.thread?.communityId,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );

                                    safeSetState(() {});
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 45.0,
                                        height: 45.0,
                                        child: Stack(
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                if (widget.thread
                                                            ?.profileImage !=
                                                        null &&
                                                    widget.thread
                                                            ?.profileImage !=
                                                        '') {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                    child: OctoImage(
                                                      placeholderBuilder: (_) =>
                                                          SizedBox.expand(
                                                        child: Image(
                                                          image: BlurHashImage(
                                                              'BlurHashString'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      image: NetworkImage(
                                                        widget.thread!
                                                            .profileImage!,
                                                      ),
                                                      width: 40.0,
                                                      height: 40.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                } else {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                    child: Image.asset(
                                                      'assets/images/image-profile.png',
                                                      width: 40.0,
                                                      height: 40.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: Builder(
                                                builder: (context) {
                                                  if (widget.thread
                                                              ?.iconBadgeUrl !=
                                                          null &&
                                                      widget.thread
                                                              ?.iconBadgeUrl !=
                                                          '') {
                                                    return Container(
                                                      width: 20.0,
                                                      height: 20.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        widget.thread!
                                                            .iconBadgeUrl!,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    );
                                                  } else {
                                                    return Container(
                                                      width: 20.0,
                                                      height: 20.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x00FFFFFF),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              widget.thread?.nickName,
                                              '未設定',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.notoSansJp(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                '[${widget.thread?.id?.toString()}]',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSansJp(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gray100,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  functions.getGoneTime(widget
                                                      .thread?.createdAt),
                                                  '30分前',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSansJp(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gray100,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 4.0)),
                                          ),
                                        ].divide(SizedBox(height: 2.0)),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  wrapWithModel(
                                    model: _model.threadBookmarkButtonModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ThreadBookmarkButtonWidget(
                                      userId: FFAppState().userInfo.id,
                                      thread: widget.thread!,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.threadMoreButtonModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ThreadMoreButtonWidget(
                                      thread: widget.thread!,
                                      userId: widget.currentUserId,
                                      action: () async {},
                                    ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ],
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.thread?.content,
                              '〇〇の素や〇〇ドレッシングを使った野菜嫌いレシピを教えてください！※来月の企業のブログに記載しても良い方でお願いします。',
                            ),
                            maxLines: 3,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.notoSansJp(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Builder(
                            builder: (context) {
                              if (widget.thread?.imageUrl != null &&
                                  (widget.thread?.imageUrl)!.isNotEmpty) {
                                return wrapWithModel(
                                  model: _model.imageViewModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ImageViewWidget(
                                    images: widget.thread?.imageUrl,
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
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.communityOutput =
                                  await CommunityWithImageTable().queryRows(
                                queryFn: (q) => q.eqOrNull(
                                  'id',
                                  widget.thread?.communityId,
                                ),
                              );
                              _model.communityMemberOutput =
                                  await CommunityMembersTable().queryRows(
                                queryFn: (q) => q
                                    .eqOrNull(
                                      'community_id',
                                      widget.thread?.communityId,
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
                                    _model.communityOutput?.firstOrNull,
                                    ParamType.SupabaseRow,
                                  ),
                                  'isShow': serializeParam(
                                    widget.thread?.privacyType == 0,
                                    ParamType.bool,
                                  ),
                                }.withoutNulls,
                              );

                              safeSetState(() {});
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).gray10,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    7.0, 4.0, 7.0, 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if (widget.thread
                                                    ?.communityCoverImage !=
                                                null &&
                                            widget.thread
                                                    ?.communityCoverImage !=
                                                '') {
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: OctoImage(
                                              placeholderBuilder: (_) =>
                                                  SizedBox.expand(
                                                child: Image(
                                                  image: BlurHashImage(
                                                      'BlurHashString'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              image: NetworkImage(
                                                widget.thread!
                                                    .communityCoverImage!,
                                              ),
                                              width: 40.0,
                                              height: 40.0,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        } else {
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/image-cover.png',
                                              width: 40.0,
                                              height: 40.0,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        widget.thread?.communityName,
                                        '未設定',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.notoSansJp(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.timelineReactionModel1,
                                      updateCallback: () => safeSetState(() {}),
                                      child: TimelineReactionWidget(
                                        active:
                                            containerCommunityThreadReactionsRowList
                                                .where(
                                                    (e) => e.reactionType == 0)
                                                .toList()
                                                .isNotEmpty,
                                        count: widget.thread!.reaction0!,
                                        type: 0,
                                        threadDetail: widget.thread!,
                                        code: ReactionType.Reaction0,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.timelineReactionModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: TimelineReactionWidget(
                                        active:
                                            containerCommunityThreadReactionsRowList
                                                .where(
                                                    (e) => e.reactionType == 1)
                                                .toList()
                                                .isNotEmpty,
                                        count: widget.thread!.reaction1!,
                                        type: 1,
                                        threadDetail: widget.thread!,
                                        code: ReactionType.Reaction1,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.timelineReactionModel3,
                                      updateCallback: () => safeSetState(() {}),
                                      child: TimelineReactionWidget(
                                        active:
                                            containerCommunityThreadReactionsRowList
                                                .where(
                                                    (e) => e.reactionType == 2)
                                                .toList()
                                                .isNotEmpty,
                                        count: widget.thread!.reaction2!,
                                        type: 2,
                                        threadDetail: widget.thread!,
                                        code: ReactionType.Reaction2,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.timelineReactionModel4,
                                      updateCallback: () => safeSetState(() {}),
                                      child: TimelineReactionWidget(
                                        active:
                                            containerCommunityThreadReactionsRowList
                                                .where(
                                                    (e) => e.reactionType == 3)
                                                .toList()
                                                .isNotEmpty,
                                        count: widget.thread!.reaction3!,
                                        type: 3,
                                        threadDetail: widget.thread!,
                                        code: ReactionType.Reaction3,
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.goNamed(
                                  CommunityThreadDetailWidget.routeName,
                                  queryParameters: {
                                    'thread': serializeParam(
                                      widget.thread,
                                      ParamType.SupabaseRow,
                                    ),
                                    'previousPath': serializeParam(
                                      'Home',
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: SvgPicture.asset(
                                      'assets/images/ic-forum.svg',
                                      width: 24.0,
                                      height: 24.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.thread?.commentCount
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.notoSansJp(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .gray100,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 4.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
              ),
              FutureBuilder<List<CommunityThreadCommentsDetailsRow>>(
                future: CommunityThreadCommentsDetailsTable().querySingleRow(
                  queryFn: (q) => q
                      .eqOrNull(
                        'thread_id',
                        widget.thread?.id,
                      )
                      .order('created_at'),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return EmptyLoadingWidget();
                  }
                  List<CommunityThreadCommentsDetailsRow>
                      containerCommunityThreadCommentsDetailsRowList =
                      snapshot.data!;

                  final containerCommunityThreadCommentsDetailsRow =
                      containerCommunityThreadCommentsDetailsRowList.isNotEmpty
                          ? containerCommunityThreadCommentsDetailsRowList.first
                          : null;

                  return Container(
                    decoration: BoxDecoration(),
                    child: Builder(
                      builder: (context) {
                        if (containerCommunityThreadCommentsDetailsRow
                                    ?.content !=
                                null &&
                            containerCommunityThreadCommentsDetailsRow
                                    ?.content !=
                                '') {
                          return Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 2.0,
                                    height: 83.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).gray40,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.userCommentOutput =
                                                    await UserWithProfileTable()
                                                        .queryRows(
                                                  queryFn: (q) => q.eqOrNull(
                                                    'id',
                                                    containerCommunityThreadCommentsDetailsRow
                                                        ?.creatorId,
                                                  ),
                                                );

                                                context.pushNamed(
                                                  UserWidget.routeName,
                                                  queryParameters: {
                                                    'targetUser':
                                                        serializeParam(
                                                      _model.userCommentOutput
                                                          ?.firstOrNull,
                                                      ParamType.SupabaseRow,
                                                    ),
                                                    'currentUserId':
                                                        serializeParam(
                                                      widget.currentUserId,
                                                      ParamType.int,
                                                    ),
                                                    'communityId':
                                                        serializeParam(
                                                      widget
                                                          .thread?.communityId,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                safeSetState(() {});
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      if (containerCommunityThreadCommentsDetailsRow
                                                                  ?.profileImage !=
                                                              null &&
                                                          containerCommunityThreadCommentsDetailsRow
                                                                  ?.profileImage !=
                                                              '') {
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                          child: OctoImage(
                                                            placeholderBuilder:
                                                                (_) => SizedBox
                                                                    .expand(
                                                              child: Image(
                                                                image: BlurHashImage(
                                                                    'BlurHashString'),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            image: NetworkImage(
                                                              containerCommunityThreadCommentsDetailsRow!
                                                                  .profileImage!,
                                                            ),
                                                            width: 34.0,
                                                            height: 34.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        );
                                                      } else {
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                          child: Image.asset(
                                                            'assets/images/image-profile.png',
                                                            width: 34.0,
                                                            height: 34.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          containerCommunityThreadCommentsDetailsRow
                                                              ?.nickName,
                                                          '未設定',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .notoSansJp(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions.getGoneTime(
                                                                  containerCommunityThreadCommentsDetailsRow
                                                                      ?.createdAt),
                                                              '30分前',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansJp(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .gray100,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 2.0)),
                                                  ),
                                                ].divide(SizedBox(width: 8.0)),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          CommentActionBottomSheetWidget(
                                                        comment:
                                                            containerCommunityThreadCommentsDetailsRow!,
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/ic-more_vert-color.svg',
                                                  width: 24.0,
                                                  height: 24.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            containerCommunityThreadCommentsDetailsRow
                                                ?.content,
                                            'うちはキッズが「コーン入りドレッシング」で作ったシチューが大好きで、野菜嫌いでもモリモリ食べます！',
                                          ),
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.notoSansJp(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gray100,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
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
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
