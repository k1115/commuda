import '../database.dart';

class InformationsTable extends SupabaseTable<InformationsRow> {
  @override
  String get tableName => 'informations';

  @override
  InformationsRow createRow(Map<String, dynamic> data) => InformationsRow(data);
}

class InformationsRow extends SupabaseDataRow {
  InformationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InformationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get coverImage => getField<String>('cover_image')!;
  set coverImage(String value) => setField<String>('cover_image', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get content => getField<String>('content')!;
  set content(String value) => setField<String>('content', value);

  DateTime? get scheduledAt => getField<DateTime>('scheduled_at');
  set scheduledAt(DateTime? value) => setField<DateTime>('scheduled_at', value);

  DateTime? get sentAt => getField<DateTime>('sent_at');
  set sentAt(DateTime? value) => setField<DateTime>('sent_at', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
