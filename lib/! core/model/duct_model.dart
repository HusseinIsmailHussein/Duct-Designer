class DuctModel {
  int id;
  String name;
  String category;
  String expression;
  List<List<String>>? tests = [
    ['0', '0']
  ];
  String? secondTestMessage = '';
  Set<VariableModel> variables;

  DuctModel({
    required this.id,
    required this.name,
    required this.category,
    required this.expression,
    this.tests,
    this.secondTestMessage,
    required this.variables,
  });
}

class VariableModel {
  String name;
  String category;
  VariableModel({
    required this.name,
    required this.category,
  });
}
