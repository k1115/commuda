import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'community_detail_header_small_model.dart';
export 'community_detail_header_small_model.dart';

class CommunityDetailHeaderSmallWidget extends StatefulWidget {
  const CommunityDetailHeaderSmallWidget({
    super.key,
    required this.communityImage,
  });

  final String? communityImage;

  @override
  State<CommunityDetailHeaderSmallWidget> createState() =>
      _CommunityDetailHeaderSmallWidgetState();
}

class _CommunityDetailHeaderSmallWidgetState
    extends State<CommunityDetailHeaderSmallWidget> {
  late CommunityDetailHeaderSmallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityDetailHeaderSmallModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Builder(
        builder: (context) {
          if (widget.communityImage != null && widget.communityImage != '') {
            return ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: OctoImage(
                placeholderBuilder: (_) => SizedBox.expand(
                  child: Image(
                    image: BlurHashImage('ABCDEFGHABCDEFGH'),
                    fit: BoxFit.cover,
                  ),
                ),
                image: NetworkImage(
                  widget.communityImage!,
                ),
                width: double.infinity,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            );
          } else {
            return ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.asset(
                'assets/images/image-cover.png',
                height: 100.0,
                fit: BoxFit.cover,
              ),
            );
          }
        },
      ),
    );
  }
}
