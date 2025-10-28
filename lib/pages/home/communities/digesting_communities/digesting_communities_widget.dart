import '/backend/supabase/supabase.dart';
import '/components/common/app_nav_bar/app_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/components/community_list_item/community_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'digesting_communities_model.dart';
export 'digesting_communities_model.dart';

class DigestingCommunitiesWidget extends StatefulWidget {
  const DigestingCommunitiesWidget({
    super.key,
    required this.friendList,
  });

  final List<int>? friendList;

  static String routeName = 'DigestingCommunities';
  static String routePath = '/digestingCommunities';

  @override
  State<DigestingCommunitiesWidget> createState() =>
      _DigestingCommunitiesWidgetState();
}

class _DigestingCommunitiesWidgetState
    extends State<DigestingCommunitiesWidget> {
  late DigestingCommunitiesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DigestingCommunitiesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).gray10,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pop();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SvgPicture.asset(
                  'assets/images/ic-back.svg',
                  width: 32.0,
                  height: 32.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'タスク消化に積極的なコミュニティ',
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    font: GoogleFonts.notoSansJp(
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleSmall.fontStyle,
                  ),
            ),
            centerTitle: false,
            expandedTitleScale: 1.0,
            titlePadding: EdgeInsetsDirectional.fromSTEB(52.0, 0.0, 0.0, 18.0),
          ),
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      FutureBuilder<List<CommunityWithImageRow>>(
                        future: CommunityWithImageTable().queryRows(
                          queryFn: (q) => q,
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
                          List<CommunityWithImageRow>
                              listViewCommunityWithImageRowList =
                              snapshot.data!;

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewCommunityWithImageRowList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 2.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewCommunityWithImageRow =
                                  listViewCommunityWithImageRowList[
                                      listViewIndex];
                              return Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: wrapWithModel(
                                    model:
                                        _model.communityListItemModels.getModel(
                                      listViewCommunityWithImageRow.id!
                                          .toString(),
                                      listViewIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: CommunityListItemWidget(
                                      key: Key(
                                        'Keyw59_${listViewCommunityWithImageRow.id!.toString()}',
                                      ),
                                      rankingNo: '',
                                      community: listViewCommunityWithImageRow,
                                      userId: FFAppState().userInfo.id,
                                      friendList: widget.friendList!,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                wrapWithModel(
                  model: _model.appNavBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AppNavBarWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
