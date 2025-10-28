import '../database.dart';

class InformationParagraphsTable
    extends SupabaseTable<InformationParagraphsRow> {
  @override
  String get tableName => 'information_paragraphs';

  @override
  InformationParagraphsRow createRow(Map<String, dynamic> data) =>
      InformationParagraphsRow(data);
}

class InformationParagraphsRow extends SupabaseDataRow {
  InformationParagraphsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InformationParagraphsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get informationId => getField<int>('information_id')!;
  set informationId(int value) => setField<int>('information_id', value);

  int get type => getField<int>('type')!;
  set type(int value) => setField<int>('type', value);

  int? get headerSize => getField<int>('header_size');
  set headerSize(int? value) => setField<int>('header_size', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
