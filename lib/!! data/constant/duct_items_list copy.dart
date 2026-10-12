import '../../! core/model/duct_model.dart';
import '../../! core/model/units/dimensions_model.dart';

List<DuctModel> ductsList = <DuctModel>[
  DuctModel(
    id: 0,
    name: 'Straight Duct - Rectangular',
    category: 'Rectangular Duct',
    expression: 'Length*(Width+Depth)*2',
    variables: {
      VariableModel(name: 'length', category: DimensionsCategories.length),
      VariableModel(name: 'Depth', category: DimensionsCategories.length),
      VariableModel(name: 'Width', category: DimensionsCategories.length),
    },
  ),
  DuctModel(
    id: 10,
    name: 'Elbow-H - Rectangular',
    category: 'Rectangular Duct',
    expression:
        'pi()*Angle/180*(Radius*Depth+(Radius+Width)*Depth+(Radius+Width)^2-Radius^2)',
    variables: {
      VariableModel(name: 'Depth', category: DimensionsCategories.length),
      VariableModel(name: 'Width', category: DimensionsCategories.length),
      VariableModel(name: 'Radius', category: DimensionsCategories.length),
      VariableModel(name: 'Angle', category: DimensionsCategories.angle),
    },
    tests: [
      ['180-Angle', 'angle should be less than 180 deg'],
    ],
  ),

  DuctModel(
    id: 11,
    name: 'Elbow-V - Rectangular',
    category: 'Rectangular Duct',
    expression:
        'pi()*Angle/180*(Radius*Width+(Radius+Depth)*Width+(Radius+Depth)^2-Radius^2)',
    variables: {
      VariableModel(name: 'Depth', category: DimensionsCategories.length),
      VariableModel(name: 'Width', category: DimensionsCategories.length),
      VariableModel(name: 'Radius', category: DimensionsCategories.length),
      VariableModel(name: 'Angle', category: DimensionsCategories.angle),
    },
    tests: [
      ['180-Angle', 'angle should be less than 180 deg'],
    ],
  ),
  DuctModel(
    id: 20,
    name: 'Tee - Rectangular',
    category: 'Rectangular Duct',
    expression: '(WIDTH+DEPTH)*2*LENGTH+(width+depth)*2*length-width*depth',
    variables: {
      VariableModel(name: 'DEPTH', category: DimensionsCategories.length),
      VariableModel(name: 'WIDTH', category: DimensionsCategories.length),
      VariableModel(name: 'LENGTH', category: DimensionsCategories.length),
      VariableModel(name: 'depth', category: DimensionsCategories.length),
      VariableModel(name: 'width', category: DimensionsCategories.length),
      VariableModel(name: 'length', category: DimensionsCategories.length),
    },
    tests: [
      ['DEPTH-depth', 'DEPTH should be equal or more than depth'],
      ['LENGTH-width', 'LENGTH should be equal or more than width']
    ],
  ),
  DuctModel(
      id: 21,
      name: 'Tee - Rectangular Round',
      category: 'Rectangular Duct',
      expression:
          '(Width+Depth)*2*LENGTH+length*pi()*Diameter-pi()*Diameter^2/4',
      variables: {
        VariableModel(name: 'Depth', category: DimensionsCategories.length),
        VariableModel(name: 'Width', category: DimensionsCategories.length),
        VariableModel(name: 'LENGTH', category: DimensionsCategories.length),
        VariableModel(name: 'Diameter', category: DimensionsCategories.length),
        VariableModel(name: 'length', category: DimensionsCategories.length),
      }),

  DuctModel(
    id: 30,
    name: 'Reducer - Rectangular',
    category: 'Rectangular Duct',
    expression:
        '(WIDTH+width)*(Length^2+(DEPTH/2-depth/2)^2)^0.5+(DEPTH+depth)*(Length^2+(WIDTH/2-width/2)^2)^0.5',
    variables: {
      VariableModel(name: 'DEPTH', category: DimensionsCategories.length),
      VariableModel(name: 'WIDTH', category: DimensionsCategories.length),
      VariableModel(name: 'depth', category: DimensionsCategories.length),
      VariableModel(name: 'width', category: DimensionsCategories.length),
      VariableModel(name: 'Length', category: DimensionsCategories.length),
    },
  ),
  DuctModel(
    id: 40,
    name: 'Converter - Rectangular-Round',
    category: 'Rectangular Duct',
    expression:
        '(pi()*Diameter/4+Width)*(Length^2+(Diameter/2-(Depth+(Depth^2+Width^2)^0.5)/4)^2)^0.5+(pi()*Diameter/4+Depth)*(Length^2+(Diameter/2-(Width+(Depth^2+Width^2)^0.5)/4)^2)^0.5',
    variables: {
      VariableModel(name: 'Depth', category: DimensionsCategories.length),
      VariableModel(name: 'Width', category: DimensionsCategories.length),
      VariableModel(name: 'Diameter', category: DimensionsCategories.length),
      VariableModel(name: 'Length', category: DimensionsCategories.length),
    },
  ),
  DuctModel(
      id: 50,
      name: 'End Cap - Rectangular',
      category: 'Rectangular Duct',
      expression: '(Width+Depth)*2*a+Width*Depth',
      variables: {
        VariableModel(name: 'Depth', category: DimensionsCategories.length),
        VariableModel(name: 'Width', category: DimensionsCategories.length),
        VariableModel(name: 'a', category: DimensionsCategories.length),
      }),
  DuctModel(
    id: 60,
    name: 'Offset - Rectangular',
    category: 'Rectangular Duct',
    expression: '(Width+Depth)*2*(Length^2+Offset1^2+Offset2^2)^0.5',
    variables: {
      VariableModel(name: 'Depth', category: DimensionsCategories.length),
      VariableModel(name: 'Width', category: DimensionsCategories.length),
      VariableModel(name: 'Offset1', category: DimensionsCategories.length),
      VariableModel(name: 'Offset2', category: DimensionsCategories.length),
      VariableModel(name: 'Length', category: DimensionsCategories.length),
    },
  ),

  //Round Duct
  DuctModel(
      id: 100,
      name: 'Straight Duct - Round',
      category: 'Round Duct',
      expression: 'length*pi()*Diameter',
      variables: {
        VariableModel(name: 'Diameter', category: DimensionsCategories.length),
        VariableModel(name: 'length', category: DimensionsCategories.length),
      }),
  DuctModel(
    id: 110,
    name: 'Elbow - Round',
    category: 'Round Duct',
    expression: 'pi()*Diameter*(Radius+Diameter/2)*pi()*Angle/180',
    variables: {
      VariableModel(name: 'Diameter', category: DimensionsCategories.length),
      VariableModel(name: 'Radius', category: DimensionsCategories.length),
      VariableModel(name: 'Angle', category: DimensionsCategories.angle),
    },
    tests: [
      ['180-Angle', 'angle should be less than 180 deg'],
    ],
  ),
  DuctModel(
      id: 120,
      name: 'Tee - Round',
      category: 'Round Duct',
      expression:
          'pi()*DIAMETER*LENGTH+pi()*diameter*length+(pi()/2-2)*diameter^2',
      variables: {
        VariableModel(name: 'DIAMETER', category: DimensionsCategories.length),
        VariableModel(name: 'LENGTH', category: DimensionsCategories.length),
        VariableModel(name: 'diameter', category: DimensionsCategories.length),
        VariableModel(name: 'length', category: DimensionsCategories.length),
      }),
  DuctModel(
      id: 121,
      name: 'Tee - Round Rectangular',
      category: 'Round Duct',
      expression:
          'LENGTH*pi()*Diameter+(Width+Depth)*2*length+(pi()/2-2)*(Width+length)^2/4',
      variables: {
        VariableModel(name: 'Diameter', category: DimensionsCategories.length),
        VariableModel(name: 'LENGTH', category: DimensionsCategories.length),
        VariableModel(name: 'Depth', category: DimensionsCategories.length),
        VariableModel(name: 'Width', category: DimensionsCategories.length),
        VariableModel(name: 'length', category: DimensionsCategories.length),
      }),
  DuctModel(
      id: 130,
      name: 'Reducer - Round',
      category: 'Round Duct',
      expression:
          'pi()*(DIAMETER+diameter)*((Length)^2+(DIAMETER/2-diameter/2)^2)^0.5/2',
      variables: {
        VariableModel(name: 'DIAMETER', category: DimensionsCategories.length),
        VariableModel(name: 'diameter', category: DimensionsCategories.length),
        VariableModel(name: 'Length', category: DimensionsCategories.length),
      }),
  DuctModel(
    id: 140,
    name: 'Converter - Round-Rectangular',
    category: 'Round Duct',
    expression:
        '(pi()*Diameter/4+Width)*(Length^2+(Diameter/2-(Depth+(Depth^2+Width^2)^0.5)/4)^2)^0.5+(pi()*Diameter/4+Depth)*(Length^2+(Diameter/2-(Width+(Depth^2+Width^2)^0.5)/4)^2)^0.5',
    variables: {
      VariableModel(name: 'Diameter', category: DimensionsCategories.length),
      VariableModel(name: 'Depth', category: DimensionsCategories.length),
      VariableModel(name: 'Width', category: DimensionsCategories.length),
      VariableModel(name: 'Length', category: DimensionsCategories.length),
    },
  ),

  DuctModel(
      id: 150,
      name: 'End Cap - Round',
      category: 'Round Duct',
      expression: 'a*pi()*Diameter+pi()*Diameter*Diameter/4',
      variables: {
        VariableModel(name: 'Diameter', category: DimensionsCategories.length),
        VariableModel(name: 'a', category: DimensionsCategories.length),
      }),
  DuctModel(
      id: 160,
      name: 'Offset - Round',
      category: 'Round Duct',
      expression: 'pi()*Diameter*(Length^2+Offset)^0.5',
      variables: {
        VariableModel(name: 'Diameter', category: DimensionsCategories.length),
        VariableModel(name: 'Length', category: DimensionsCategories.length),
        VariableModel(name: 'Offset', category: DimensionsCategories.length),
      }),
];

final Set<String> ductsCategories = ductsList.map((e) => e.category).toSet();
