import '/backend/supabase/supabase.dart';
import '/components/common/comming_soon/comming_soon_widget.dart';
import '/components/common/private_thread/private_thread_widget.dart';
import '/components/empty_list_widget.dart';
import '/components/empty_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/detail/components/community_information/community_information_widget.dart';
import '/pages/community/threads/components/community_thread_header/community_thread_header_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'community_tab_bar_model.dart';
export 'community_tab_bar_model.dart';

class CommunityTabBarWidget extends StatefulWidget {
  const CommunityTabBarWidget({
    super.key,
    required this.community,
    required this.isShow,
  });

  final CommunityWithImageRow? community;
  final bool? isShow;

  @override
  State<CommunityTabBarWidget> createState() => _CommunityTabBarWidgetState();
}

class _CommunityTabBarWidgetState extends State<CommunityTabBarWidget>
    with TickerProviderStateMixin {
  late CommunityTabBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityTabBarModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment(-1.0, 0),
          child: TabBar(
            isScrollable: true,
            labelColor: FlutterFlowTheme.of(context).primaryText,
            unselectedLabelColor: FlutterFlowTheme.of(context).gray80,
            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.notoSansJp(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
            unselectedLabelStyle: FlutterFlowTheme.of(context)
                .bodyMedium
                .override(
                  font: GoogleFonts.notoSansJp(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
            indicatorColor: FlutterFlowTheme.of(context).primary,
            indicatorWeight: 3.0,
            tabs: [
              Tab(
                text: 'スレッド',
              ),
              Tab(
                text: 'イベント',
              ),
              Tab(
                text: '基本情報',
              ),
            ],
            controller: _model.tabBarController,
            onTap: (i) async {
              [() async {}, () async {}, () async {}][i]();
            },
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _model.tabBarController,
            children: [
              Builder(
                builder: (context) {
                  if (widget.isShow ?? false) {
                    return FutureBuilder<List<CommunityThreadDetailsRow>>(
                      future: (_model.requestCompleter ??= Completer<
                              List<CommunityThreadDetailsRow>>()
                            ..complete(CommunityThreadDetailsTable().queryRows(
                              queryFn: (q) => q
                                  .eqOrNull(
                                    'community_id',
                                    widget.community?.id,
                                  )
                                  .order('created_at'),
                            )))
                          .future,
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return EmptyLoadingWidget();
                        }
                        List<CommunityThreadDetailsRow>
                            threadContainerCommunityThreadDetailsRowList =
                            snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).gray10,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final containerVar =
                                    threadContainerCommunityThreadDetailsRowList
                                        .toList();
                                if (containerVar.isEmpty) {
                                  return EmptyListWidget(
                                    text: 'スレッドがありません。',
                                  );
                                }

                                return RefreshIndicator(
                                  key: Key('RefreshIndicator_d7sz0qgw'),
                                  onRefresh: () async {
                                    safeSetState(
                                        () => _model.requestCompleter = null);
                                    await _model.waitForRequestCompleted();
                                  },
                                  child: SingleChildScrollView(
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                          List.generate(containerVar.length,
                                              (containerVarIndex) {
                                        final containerVarItem =
                                            containerVar[containerVarIndex];
                                        return wrapWithModel(
                                          model: _model
                                              .communityThreadHeaderModels
                                              .getModel(
                                            containerVarItem.id!.toString(),
                                            containerVarIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: CommunityThreadHeaderWidget(
                                            key: Key(
                                              'Keyuzw_${containerVarItem.id!.toString()}',
                                            ),
                                            thread: containerVarItem,
                                            enableButton: true,
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return wrapWithModel(
                      model: _model.privateThreadModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: PrivateThreadWidget(),
                    );
                  }
                },
              ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).gray10,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Builder(
                        builder: (context) {
                          if (widget.isShow ?? false) {
                            return wrapWithModel(
                              model: _model.commingSoonModel,
                              updateCallback: () => safeSetState(() {}),
                              child: CommingSoonWidget(),
                            );
                          } else {
                            return wrapWithModel(
                              model: _model.privateThreadModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: PrivateThreadWidget(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Builder(
                builder: (context) {
                  if (widget.isShow ?? false) {
                    return ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        wrapWithModel(
                          model: _model.communityInformationModel,
                          updateCallback: () => safeSetState(() {}),
                          child: CommunityInformationWidget(
                            community: widget.community!,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container(
                      decoration: BoxDecoration(),
                      child: wrapWithModel(
                        model: _model.privateThreadModel3,
                        updateCallback: () => safeSetState(() {}),
                        child: PrivateThreadWidget(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
