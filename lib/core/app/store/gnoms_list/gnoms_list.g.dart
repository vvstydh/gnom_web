// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gnoms_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GnomsList on GnomsListStore, Store {
  late final _$gnomPathAtom =
      Atom(name: 'GnomsListStore.gnomPath', context: context);

  @override
  ObservableList<String> get gnomPath {
    _$gnomPathAtom.reportRead();
    return super.gnomPath;
  }

  @override
  set gnomPath(ObservableList<String> value) {
    _$gnomPathAtom.reportWrite(value, super.gnomPath, () {
      super.gnomPath = value;
    });
  }

  late final _$gnomNameAtom =
      Atom(name: 'GnomsListStore.gnomName', context: context);

  @override
  ObservableList<String> get gnomName {
    _$gnomNameAtom.reportRead();
    return super.gnomName;
  }

  @override
  set gnomName(ObservableList<String> value) {
    _$gnomNameAtom.reportWrite(value, super.gnomName, () {
      super.gnomName = value;
    });
  }

  @override
  String toString() {
    return '''
gnomPath: ${gnomPath},
gnomName: ${gnomName}
    ''';
  }
}
