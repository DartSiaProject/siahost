import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class BucketDetailsPage extends StatelessWidget {
  const BucketDetailsPage({
    @PathParam('bucket') required this.bucket,
    super.key,
  });

  final String bucket;

  @override
  Widget build(BuildContext context) {
    return BucketDetailsView(
      bucketName: bucket,
    );
  }
}

class BucketDetailsView extends StatelessWidget {
  const BucketDetailsView({required this.bucketName, super.key});
  final String bucketName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Bucket details $bucketName'),
    );
  }
}
