import 'package:mobx/mobx.dart';

part 'gnoms_list.g.dart';

class GnomsList = GnomsListStore with _$GnomsList;

abstract class GnomsListStore with Store {
  @observable
  ObservableList<String> gnomPath = ObservableList<String>();

  @observable
  ObservableList<String> gnomName = ObservableList<String>();
}
