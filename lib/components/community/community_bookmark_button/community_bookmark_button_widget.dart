import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'community_bookmark_button_model.dart';
export 'community_bookmark_button_model.dart';

class CommunityBookmarkButtonWidget extends StatefulWidget {
  const CommunityBookmarkButtonWidget({
    super.key,
    required this.community,
    required this.userId,
  });

  final int? community;
  final int? userId;

  @override
  State<CommunityBookmarkButtonWidget> createState() =>
      _CommunityBookmarkButtonWidgetState();
}

class _CommunityBookmarkButtonWidgetState
    extends State<CommunityBookmarkButtonWidget> {
  late CommunityBookmarkButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityBookmarkButtonModel());

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

    return Builder(
      builder: (context) {
        if (FFAppState()
            .userInfo
            .communityBookmarkId
            .contains(widget.community)) {
          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              FFAppState().updateUserInfoStruct(
                (e) => e
                  ..updateCommunityBookmarkId(
                    (e) => e.remove(widget.community),
                  ),
              );
              FFAppState().update(() {});
              await CommunityBookmarksTable().delete(
                matchingRows: (rows) => rows
                    .eqOrNull(
                      'community_id',
                      widget.community,
                    )
                    .eqOrNull(
                      'user_id',
                      widget.userId,
                    ),
              );
            },
            child: Container(
              width: 32.0,
              height: 32.0,
              decoration: BoxDecoration(
                color: Color(0x65292929),
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SvgPicture.asset(
                    'assets/images/ic-bookmark-white-fill.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        } else {
          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              FFAppState().updateUserInfoStruct(
                (e) => e
                  ..updateCommunityBookmarkId(
                    (e) => e.add(widget.community!),
                  ),
              );
              FFAppState().update(() {});
              await CommunityBookmarksTable().insert({
                'community_id': widget.community,
                'user_id': widget.userId,
              });
            },
            child: Container(
              width: 32.0,
              height: 32.0,
              decoration: BoxDecoration(
                color: Color(0x65292929),
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: SvgPicture.asset(
                    'assets/images/ic-bookmark-white.svg',
                    width: 24.0,
                    height: 24.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
