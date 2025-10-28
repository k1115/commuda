import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/comment_reaction/comment_reaction_widget.dart';
import '/components/image_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/threads/components/comment_action_bottom_sheet/comment_action_bottom_sheet_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'community_thread_comment_model.dart';
export 'community_thread_comment_model.dart';

class CommunityThreadCommentWidget extends StatefulWidget {
  const CommunityThreadCommentWidget({
    super.key,
    required this.comment,
    required this.metion,
  });

  final CommunityThreadCommentsDetailsRow? comment;
  final Future Function()? metion;

  @override
  State<CommunityThreadCommentWidget> createState() =>
      _CommunityThreadCommentWidgetState();
}

class _CommunityThreadCommentWidgetState
    extends State<CommunityThreadCommentWidget> {
  late CommunityThreadCommentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityThreadCommentModel());

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

    return FutureBuilder<List<CommunityThreadCommentReactionsRow>>(
      future: CommunityThreadCommentReactionsTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'user_id',
              FFAppState().userInfo.id,
            )
            .eqOrNull(
              'comment_id',
              widget.comment?.id,
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
        List<CommunityThreadCommentReactionsRow>
            containerCommunityThreadCommentReactionsRowList = snapshot.data!;

        return Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
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
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                decoration: BoxDecoration(),
                                child: Container(
                                  width: 45.0,
                                  height: 45.0,
                                  child: Stack(
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (widget.comment?.profileImage !=
                                                  null &&
                                              widget.comment?.profileImage !=
                                                  '') {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
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
                                                  widget
                                                      .comment!.profileImage!,
                                                ),
                                                width: 40.0,
                                                height: 40.0,
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          } else {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
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
                                        alignment:
                                            AlignmentDirectional(1.0, 1.0),
                                        child: Builder(
                                          builder: (context) {
                                            if (widget.comment?.iconBadgeUrl !=
                                                    null &&
                                                widget.comment?.iconBadgeUrl !=
                                                    '') {
                                              return Container(
                                                width: 20.0,
                                                height: 20.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  widget
                                                      .comment!.iconBadgeUrl!,
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                width: 20.0,
                                                height: 20.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00FFFFFF),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.comment?.nickName,
                                        '未設定',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.notoSansJp(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          functions.getGoneTime(
                                              widget.comment?.createdAt),
                                          '30分前',
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gray100,
                                              fontSize: 12.0,
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
                                    ].divide(SizedBox(width: 4.0)),
                                  ),
                                ].divide(SizedBox(height: 2.0)),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 4.0, 4.0, 4.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: CommentActionBottomSheetWidget(
                                          comment: widget.comment!,
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: SvgPicture.asset(
                                    'assets/images/ic-more_vert-color.svg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ],
                    ),
                    Builder(
                      builder: (context) {
                        if (widget.comment?.content != null &&
                            widget.comment?.content != '') {
                          return Text(
                            valueOrDefault<String>(
                              widget.comment?.content,
                              'うちはキッズが「コーン入りドレッシング」で作ったシチューが大好きで、野菜嫌いでもモリモリ食べます！',
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
                    Builder(
                      builder: (context) {
                        if (widget.comment?.image != null &&
                            (widget.comment?.image)!.isNotEmpty) {
                          return wrapWithModel(
                            model: _model.imageViewModel,
                            updateCallback: () => safeSetState(() {}),
                            child: ImageViewWidget(
                              images: widget.comment?.image,
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
                  ].divide(SizedBox(height: 8.0)),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
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
                                  model: _model.commentReactionModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CommentReactionWidget(
                                    count: widget.comment!.reaction0!,
                                    active:
                                        containerCommunityThreadCommentReactionsRowList
                                            .where((e) => e.reactionType == 0)
                                            .toList()
                                            .isNotEmpty,
                                    code: ReactionType.Reaction0,
                                    type: 0,
                                    commentId: widget.comment?.id,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.commentReactionModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CommentReactionWidget(
                                    count: widget.comment!.reaction1!,
                                    active:
                                        containerCommunityThreadCommentReactionsRowList
                                            .where((e) => e.reactionType == 1)
                                            .toList()
                                            .isNotEmpty,
                                    code: ReactionType.Reaction1,
                                    type: 1,
                                    commentId: widget.comment?.id,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.commentReactionModel3,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CommentReactionWidget(
                                    count: widget.comment!.reaction2!,
                                    active:
                                        containerCommunityThreadCommentReactionsRowList
                                            .where((e) => e.reactionType == 2)
                                            .toList()
                                            .isNotEmpty,
                                    code: ReactionType.Reaction2,
                                    type: 2,
                                    commentId: widget.comment?.id,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.commentReactionModel4,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CommentReactionWidget(
                                    count: widget.comment!.reaction3!,
                                    active:
                                        containerCommunityThreadCommentReactionsRowList
                                            .where((e) => e.reactionType == 3)
                                            .toList()
                                            .isNotEmpty,
                                    code: ReactionType.Reaction3,
                                    type: 3,
                                    commentId: widget.comment?.id,
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
                            await widget.metion?.call();
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: SvgPicture.asset(
                                  'assets/images/ic-reply.svg',
                                  width: 24.0,
                                  height: 24.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                '返信',
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ),
        );
      },
    );
  }
}
