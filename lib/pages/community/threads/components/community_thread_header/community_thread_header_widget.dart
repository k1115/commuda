import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_loading_widget.dart';
import '/components/image_view_widget.dart';
import '/components/timeline_reaction/timeline_reaction_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
import 'community_thread_header_model.dart';
export 'community_thread_header_model.dart';

class CommunityThreadHeaderWidget extends StatefulWidget {
  const CommunityThreadHeaderWidget({
    super.key,
    required this.thread,
    required this.enableButton,
  });

  final CommunityThreadDetailsRow? thread;
  final bool? enableButton;

  @override
  State<CommunityThreadHeaderWidget> createState() =>
      _CommunityThreadHeaderWidgetState();
}

class _CommunityThreadHeaderWidgetState
    extends State<CommunityThreadHeaderWidget> {
  late CommunityThreadHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityThreadHeaderModel());

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

    return Shortcuts(
      shortcuts: {},
      child: Actions(
        actions: {
          VoidCallbackIntent: CallbackAction<VoidCallbackIntent>(
            onInvoke: (intent) => intent.callback(),
          ),
        },
        child: Focus(
          autofocus: isShortcutsSupported,
          focusNode: _model.communityThreadHeaderShortcutsFocusNode,
          child: GestureDetector(
              onTap: () => _model
                      .communityThreadHeaderShortcutsFocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(
                      _model.communityThreadHeaderShortcutsFocusNode)
                  : FocusScope.of(context).unfocus(),
              child: FutureBuilder<List<CommunityThreadReactionsRow>>(
                future: CommunityThreadReactionsTable().queryRows(
                  queryFn: (q) => q
                      .eqOrNull(
                        'thread_id',
                        widget.thread?.id,
                      )
                      .eqOrNull(
                        'user_id',
                        FFAppState().userInfo.id,
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 12.0),
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
                                              _model.creatorOutput =
                                                  await UserWithProfileTable()
                                                      .queryRows(
                                                queryFn: (q) => q.eqOrNull(
                                                  'id',
                                                  widget.thread?.creatorId,
                                                ),
                                              );

                                              context.pushNamed(
                                                UserWidget.routeName,
                                                queryParameters: {
                                                  'targetUser': serializeParam(
                                                    _model.creatorOutput
                                                        ?.firstOrNull,
                                                    ParamType.SupabaseRow,
                                                  ),
                                                  'currentUserId':
                                                      serializeParam(
                                                    FFAppState().userInfo.id,
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
                                                                image:
                                                                    NetworkImage(
                                                                  widget
                                                                      .thread!
                                                                      .profileImage!,
                                                                ),
                                                                width: 40.0,
                                                                height: 40.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            );
                                                          } else {
                                                            return ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/image-profile.png',
                                                                width: 40.0,
                                                                height: 40.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
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
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  widget
                                                                      .thread!
                                                                      .iconBadgeUrl!,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              );
                                                            } else {
                                                              return Container(
                                                                width: 20.0,
                                                                height: 20.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x00FFFFFF),
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        widget
                                                            .thread?.nickName,
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
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                                          '[${valueOrDefault<String>(
                                                            widget.thread?.id
                                                                ?.toString(),
                                                            '112',
                                                          )}]',
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
                                                                fontSize: 12.0,
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
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            functions.getGoneTime(
                                                                widget.thread
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
                                                                fontSize: 12.0,
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
                                                      ].divide(
                                                          SizedBox(width: 4.0)),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 2.0)),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            wrapWithModel(
                                              model: _model
                                                  .threadBookmarkButtonModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: ThreadBookmarkButtonWidget(
                                                userId:
                                                    FFAppState().userInfo.id,
                                                thread: widget.thread!,
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.threadMoreButtonModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: ThreadMoreButtonWidget(
                                                thread: widget.thread!,
                                                userId:
                                                    FFAppState().userInfo.id,
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
                                    Builder(
                                      builder: (context) {
                                        if (widget.thread?.imageUrl != null &&
                                            (widget.thread?.imageUrl)!
                                                .isNotEmpty) {
                                          return wrapWithModel(
                                            model: _model.imageViewModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ImageViewWidget(
                                              images: widget.thread?.imageUrl,
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            width: 0.0,
                                            height: 0.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            wrapWithModel(
                                              model:
                                                  _model.timelineReactionModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: TimelineReactionWidget(
                                                active:
                                                    containerCommunityThreadReactionsRowList
                                                        .where((e) =>
                                                            e.reactionType == 0)
                                                        .toList()
                                                        .isNotEmpty,
                                                count:
                                                    widget.thread!.reaction0!,
                                                threadDetail: widget.thread!,
                                                type: 0,
                                                code: ReactionType.Reaction0,
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.timelineReactionModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: TimelineReactionWidget(
                                                active:
                                                    containerCommunityThreadReactionsRowList
                                                        .where((e) =>
                                                            e.reactionType == 1)
                                                        .toList()
                                                        .isNotEmpty,
                                                count:
                                                    widget.thread!.reaction1!,
                                                threadDetail: widget.thread!,
                                                type: 1,
                                                code: ReactionType.Reaction1,
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.timelineReactionModel3,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: TimelineReactionWidget(
                                                active:
                                                    containerCommunityThreadReactionsRowList
                                                        .where((e) =>
                                                            e.reactionType == 2)
                                                        .toList()
                                                        .isNotEmpty,
                                                count:
                                                    widget.thread!.reaction2!,
                                                threadDetail: widget.thread!,
                                                type: 2,
                                                code: ReactionType.Reaction2,
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.timelineReactionModel4,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: TimelineReactionWidget(
                                                active:
                                                    containerCommunityThreadReactionsRowList
                                                        .where((e) =>
                                                            e.reactionType == 3)
                                                        .toList()
                                                        .isNotEmpty,
                                                count:
                                                    widget.thread!.reaction3!,
                                                threadDetail: widget.thread!,
                                                type: 3,
                                                code: ReactionType.Reaction3,
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (widget.enableButton!) {
                                            _model.threadOutput =
                                                await CommunityThreadDetailsTable()
                                                    .queryRows(
                                              queryFn: (q) => q.eqOrNull(
                                                'id',
                                                widget.thread?.id,
                                              ),
                                            );

                                            context.goNamed(
                                              CommunityThreadDetailWidget
                                                  .routeName,
                                              queryParameters: {
                                                'thread': serializeParam(
                                                  _model.threadOutput
                                                      ?.firstOrNull,
                                                  ParamType.SupabaseRow,
                                                ),
                                                'previousPath': serializeParam(
                                                  'CommunityDetail',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          }

                                          safeSetState(() {});
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/ic-forum.svg',
                                                width: 24.45,
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
                                                          fontSize: 14.0,
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
                      ],
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}
