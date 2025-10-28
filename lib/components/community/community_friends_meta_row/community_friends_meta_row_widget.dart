import '/backend/supabase/supabase.dart';
import '/components/empty_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'community_friends_meta_row_model.dart';
export 'community_friends_meta_row_model.dart';

class CommunityFriendsMetaRowWidget extends StatefulWidget {
  const CommunityFriendsMetaRowWidget({
    super.key,
    required this.communityId,
    this.friendList,
  });

  final int? communityId;
  final List<int>? friendList;

  @override
  State<CommunityFriendsMetaRowWidget> createState() =>
      _CommunityFriendsMetaRowWidgetState();
}

class _CommunityFriendsMetaRowWidgetState
    extends State<CommunityFriendsMetaRowWidget> {
  late CommunityFriendsMetaRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityFriendsMetaRowModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CommunityMembersDetailRow>>(
      future: CommunityMembersDetailTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'community_id',
              widget.communityId,
            )
            .inFilterOrNull(
              'user_id',
              widget.friendList,
            )
            .eqOrNull(
              'participate_status',
              1,
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return EmptyLoadingWidget();
        }
        List<CommunityMembersDetailRow> containerCommunityMembersDetailRowList =
            snapshot.data!;

        return Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(0.0),
            ),
          ),
          child: Visibility(
            visible: containerCommunityMembersDetailRowList.isNotEmpty,
            child: Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: SvgPicture.asset(
                        'assets/images/ic-diversity-2.svg',
                        width: 18.0,
                        height: 18.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) {
                            final communityList =
                                containerCommunityMembersDetailRowList
                                    .toList()
                                    .take(3)
                                    .toList();

                            return Stack(
                              children: List.generate(communityList.length,
                                  (communityListIndex) {
                                final communityListItem =
                                    communityList[communityListIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      valueOrDefault<double>(
                                        functions
                                            .getPaddingSize(communityListIndex)
                                            ?.toDouble(),
                                        0.0,
                                      ),
                                      0.0,
                                      0.0,
                                      0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(24.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color:
                                            FlutterFlowTheme.of(context).gray20,
                                      ),
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        if (communityListItem.profileImage !=
                                                null &&
                                            communityListItem.profileImage !=
                                                '') {
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            child: Image.network(
                                              communityListItem.profileImage!,
                                              width: 26.0,
                                              height: 26.0,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        } else {
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            child: Image.asset(
                                              'assets/images/image-profile.png',
                                              width: 26.0,
                                              height: 26.0,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                        Text(
                          '他${containerCommunityMembersDetailRowList.length.toString()}人',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                      ].divide(SizedBox(width: 4.0)),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
