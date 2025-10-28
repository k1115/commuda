import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/threads/components/thread_bookmark_button/thread_bookmark_button_widget.dart';
import '/pages/community/threads/components/thread_more_button/thread_more_button_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'community_thread_item_model.dart';
export 'community_thread_item_model.dart';

class CommunityThreadItemWidget extends StatefulWidget {
  const CommunityThreadItemWidget({
    super.key,
    required this.thread,
  });

  final CommunityThreadDetailsRow? thread;

  @override
  State<CommunityThreadItemWidget> createState() =>
      _CommunityThreadItemWidgetState();
}

class _CommunityThreadItemWidgetState extends State<CommunityThreadItemWidget> {
  late CommunityThreadItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityThreadItemModel());

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
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
                                  width: 45.0,
                                  height: 45.0,
                                  child: Stack(
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (widget.thread?.profileImage !=
                                                  null &&
                                              widget.thread?.profileImage !=
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
                                                  widget.thread!.profileImage!,
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
                                            if (widget.thread?.iconBadgeUrl !=
                                                    null &&
                                                widget.thread?.iconBadgeUrl !=
                                                    '') {
                                              return Container(
                                                width: 20.0,
                                                height: 20.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  widget.thread!.iconBadgeUrl!,
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
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '[${widget.thread?.id?.toString()}]',
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
                                        Text(
                                          valueOrDefault<String>(
                                            functions.getGoneTime(
                                                widget.thread?.createdAt),
                                            '30分前',
                                          ),
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
                                  userId: FFAppState().userInfo.id,
                                  thread: widget.thread!,
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
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: OctoImage(
                                placeholderBuilder: (_) => SizedBox.expand(
                                  child: Image(
                                    image: BlurHashImage('BlurHashString'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                image: NetworkImage(
                                  widget.thread!.imageUrl.firstOrNull!,
                                ),
                                width: double.infinity,
                                height: 184.0,
                                fit: BoxFit.cover,
                              ),
                            );
                          } else {
                            return Container(
                              width: 1.0,
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
                ].divide(SizedBox(height: 8.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
