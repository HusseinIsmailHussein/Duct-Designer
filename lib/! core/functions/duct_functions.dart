import 'package:math_parser/math_parser.dart';

import '../model/duct_model.dart';
import '../model/item_model.dart';

class DuctFunctions {
  Set<String> getVariablesSet(DuctModel duct, Item item) {
    Set<String> variablesSet = {};
    for (var i = 0; i < duct.variables.length; i++) {
      variablesSet.add(duct.variables.elementAt(i).name);
    }
    return variablesSet;
  }

  Map<String, num> getVariablesMap(DuctModel duct, Item item) {
    Map<String, num> variablesMap = {};
    for (var i = 0; i < duct.variables.length; i++) {
      variablesMap[duct.variables.elementAt(i).name] = item.variables[i];
    }
    return variablesMap;
  }

  List<String> getErrors(DuctModel duct, Item item) {
    if (duct.tests != null) {
      List<String> list = [];
      for (var i = 0; i < duct.tests!.length; i++) {
        if (MathNodeExpression.fromString(duct.tests![i][0],
                    variableNames: getVariablesSet(duct, item))
                .calc(MathVariableValues(getVariablesMap(duct, item)))
                .toDouble() <
            0) {
          list.add(duct.tests![i][1]);
        }
      }
      return list;
    } else {
      return [];
    }
  }

  double getTotalArea(DuctModel duct, Item item, List<String> errors) {
    if (errors.isEmpty) {
      return MathNodeExpression.fromString(duct.expression,
              variableNames: getVariablesSet(duct, item))
          .calc(MathVariableValues(getVariablesMap(duct, item)))
          .toDouble();
    } else {
      return 0;
    }
  }
}
