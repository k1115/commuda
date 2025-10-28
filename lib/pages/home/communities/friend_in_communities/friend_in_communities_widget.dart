import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/components/community_list_item/community_list_item_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'friend_in_communities_model.dart';
export 'friend_in_communities_model.dart';

class FriendInCommunitiesWidget extends StatefulWidget {
  const FriendInCommunitiesWidget({
    super.key,
    required this.friendList,
    required this.communityList,
  });

  final List<int>? friendList;
  final List<int>? communityList;

  static String routeName = 'FriendInCommunities';
  static String routePath = '/friendInCommunities';

  @override
  State<FriendInCommunitiesWidget> createState() =>
      _FriendInCommunitiesWidgetState();
}

class _FriendInCommunitiesWidgetState extends State<FriendInCommunitiesWidget> {
  late FriendInCommunitiesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FriendInCommunitiesModel());

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

    return FutureBuilder<List<CommunityWithImageRow>>(
      future: CommunityWithImageTable().queryRows(
        queryFn: (q) => q
            .inFilterOrNull(
              'id',
              widget.communityList,
            )
            .inFilterOrNull(
              'privacy_type',
              FFAppConstants.enableMode,
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).gray10,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<CommunityWithImageRow>
            friendInCommunitiesCommunityWithImageRowList = snapshot.data!;

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
                    context.goNamed(
                      HomeWidget.routeName,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.leftToRight,
                        ),
                      },
                    );
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
                  '友人が参加しているコミュニティ',
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
                titlePadding:
                    EdgeInsetsDirectional.fromSTEB(52.0, 0.0, 0.0, 18.0),
              ),
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final communities =
                        friendInCommunitiesCommunityWithImageRowList.toList();

                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      primary: false,
                      scrollDirection: Axis.vertical,
                      itemCount: communities.length,
                      separatorBuilder: (_, __) => SizedBox(height: 2.0),
                      itemBuilder: (context, communitiesIndex) {
                        final communitiesItem = communities[communitiesIndex];
                        return Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: wrapWithModel(
                              model: _model.communityListItemModels.getModel(
                                communitiesItem.id!.toString(),
                                communitiesIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: CommunityListItemWidget(
                                key: Key(
                                  'Keyryi_${communitiesItem.id!.toString()}',
                                ),
                                rankingNo: '',
                                community: communitiesItem,
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
              ),
            ),
          ),
        );
      },
    );
  }
}
