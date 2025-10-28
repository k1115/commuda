import '../database.dart';

class ThreadReportsTable extends SupabaseTable<ThreadReportsRow> {
  @override
  String get tableName => 'thread_reports';

  @override
  ThreadReportsRow createRow(Map<String, dynamic> data) =>
      ThreadReportsRow(data);
}

class ThreadReportsRow extends SupabaseDataRow {
  ThreadReportsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ThreadReportsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get reportUserId => getField<int>('report_user_id')!;
  set reportUserId(int value) => setField<int>('report_user_id', value);

  int get reportedThreadId => getField<int>('reported_thread_id')!;
  set reportedThreadId(int value) => setField<int>('reported_thread_id', value);

  List<String> get reasons => getListField<String>('reasons');
  set reasons(List<String>? value) => setListField<String>('reasons', value);

  String get detail => getField<String>('detail')!;
  set detail(String value) => setField<String>('detail', value);

  int get status => getField<int>('status')!;
  set status(int value) => setField<int>('status', value);

  int? get processorId => getField<int>('processor_id');
  set processorId(int? value) => setField<int>('processor_id', value);
}
