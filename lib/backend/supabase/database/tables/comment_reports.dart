import '../database.dart';

class CommentReportsTable extends SupabaseTable<CommentReportsRow> {
  @override
  String get tableName => 'comment_reports';

  @override
  CommentReportsRow createRow(Map<String, dynamic> data) =>
      CommentReportsRow(data);
}

class CommentReportsRow extends SupabaseDataRow {
  CommentReportsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommentReportsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get reportUserId => getField<int>('report_user_id')!;
  set reportUserId(int value) => setField<int>('report_user_id', value);

  int get reportedCommentId => getField<int>('reported_comment_id')!;
  set reportedCommentId(int value) =>
      setField<int>('reported_comment_id', value);

  List<String> get reasons => getListField<String>('reasons');
  set reasons(List<String>? value) => setListField<String>('reasons', value);

  String get detail => getField<String>('detail')!;
  set detail(String value) => setField<String>('detail', value);

  int get status => getField<int>('status')!;
  set status(int value) => setField<int>('status', value);
}
