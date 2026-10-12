import '../../! core/model/duct_model.dart';
import '../../! core/model/units/dimensions_model.dart';

List<DuctModel> ductsList = <DuctModel>[
  DuctModel(
    id: 0,
    name: 'Straight Duct - Rectangular',
    category: 'Rectangular Duct',
    expression: 'length*(width+depth)*2',
    variables: {
      VariableModel(name: 'width', category: DimensionsCategories.length),
      VariableModel(name: 'depth', category: DimensionsCategories.length),
      VariableModel(name: 'length', category: DimensionsCategories.length),
    },
  ),
  DuctModel(
    id: 10,
    name: 'Elbow-H - Rectangular',
    category: 'Rectangular Duct',
    expression:
        'pi()*angle/180*(radius*depth+(radius+width)*depth+(radius+width)^2-radius^2)+4*A*(depth+width)',
    variables: {
      VariableModel(name: 'width', category: DimensionsCategories.length),
      VariableModel(name: 'depth', category: DimensionsCategories.length),
      VariableModel(name: 'radius', category: DimensionsCategories.length),
      VariableModel(name: 'angle', category: DimensionsCategories.angle),
      VariableModel(name: 'A', category: DimensionsCategories.length),
    },
    tests: [
      ['180-angle', 'angle should be less than 180 deg'],
    ],
  ),

  DuctModel(
    id: 11,
    name: 'Elbow-V - Rectangular',
    category: 'Rectangular Duct',
    expression:
        'pi()*angle/180*(radius*width+(radius+depth)*width+(radius+depth)^2-radius^2)+4*A*(depth+width)',
    variables: {
      VariableModel(name: 'width', category: DimensionsCategories.length),
      VariableModel(name: 'depth', category: DimensionsCategories.length),
      VariableModel(name: 'radius', category: DimensionsCategories.length),
      VariableModel(name: 'angle', category: DimensionsCategories.angle),
      VariableModel(name: 'A', category: DimensionsCategories.length),
    },
    tests: [
      ['180-angle', 'angle should be less than 180 deg'],
    ],
  ),
  DuctModel(
    id: 20,
    name: 'Tee - Rectangular',
    category: 'Rectangular Duct',
    expression: '(width+depth)*2*length+(W+D)*2*L-W*D',
    variables: {
      VariableModel(name: 'width', category: DimensionsCategories.length),
      VariableModel(name: 'depth', category: DimensionsCategories.length),
      VariableModel(name: 'length', category: DimensionsCategories.length),
      VariableModel(name: 'W', category: DimensionsCategories.length),
      VariableModel(name: 'D', category: DimensionsCategories.length),
      VariableModel(name: 'L', category: DimensionsCategories.length),
    },
    tests: [
      ['depth-D', 'depth should be more or equal D'],
      ['length-W', 'length should be more or equal W']
    ],
  ),
  DuctModel(
    id: 21,
    name: 'Tee - Rectangular Round',
    category: 'Rectangular Duct',
    expression: '(width+depth)*2*length+L*pi()*diameter-pi()*diameter^2/4',
    variables: {
      VariableModel(name: 'width', category: DimensionsCategories.length),
      VariableModel(name: 'depth', category: DimensionsCategories.length),
      VariableModel(name: 'length', category: DimensionsCategories.length),
      VariableModel(name: 'diameter', category: DimensionsCategories.length),
      VariableModel(name: 'L', category: DimensionsCategories.length),
    },
    tests: [
      ['depth-diameter', 'depth should be more or equal diameter'],
      ['length-diameter', 'length should be more or equal diameter']
    ],
  ),

  DuctModel(
    id: 30,
    name: 'Reducer - Rectangular',
    category: 'Rectangular Duct',
    expression:
        '(width+W)*(length^2+(depth/2-D/2)^2)^0.5+(depth+D)*(length^2+(width/2-W/2)^2)^0.5+2*A*(depth+width+D+W)',
    variables: {
      VariableModel(name: 'width', category: DimensionsCategories.length),
      VariableModel(name: 'depth', category: DimensionsCategories.length),
      VariableModel(name: 'W', category: DimensionsCategories.length),
      VariableModel(name: 'D', category: DimensionsCategories.length),
      VariableModel(name: 'length', category: DimensionsCategories.length),
      VariableModel(name: 'A', category: DimensionsCategories.length),
    },
  ),
  DuctModel(
    id: 40,
    name: 'Converter - Rectangular-Round',
    category: 'Rectangular Duct',
    expression:
        '(pi()*diameter/4+width)*(length^2+(diameter/2-(depth+(depth^2+width^2)^0.5)/4)^2)^0.5+(pi()*diameter/4+depth)*(length^2+(diameter/2-(width+(depth^2+width^2)^0.5)/4)^2)^0.5 + A*(pi()*diameter+2*depth+2*width)',
    variables: {
      VariableModel(name: 'width', category: DimensionsCategories.length),
      VariableModel(name: 'depth', category: DimensionsCategories.length),
      VariableModel(name: 'diameter', category: DimensionsCategories.length),
      VariableModel(name: 'length', category: DimensionsCategories.length),
      VariableModel(name: 'A', category: DimensionsCategories.length),
    },
  ),
  DuctModel(
      id: 50,
      name: 'End Cap - Rectangular',
      category: 'Rectangular Duct',
      expression: '(width+depth)*2*A+width*depth',
      variables: {
        VariableModel(name: 'width', category: DimensionsCategories.length),
        VariableModel(name: 'depth', category: DimensionsCategories.length),
        VariableModel(name: 'A', category: DimensionsCategories.length),
      }),
  DuctModel(
    id: 60,
    name: 'Offset - Rectangular',
    category: 'Rectangular Duct',
    expression:
        '(width+depth)*2*(length^2+OffsetH^2+OffsetV^2)^0.5+4*A*(depth+width)',
    variables: {
      VariableModel(name: 'width', category: DimensionsCategories.length),
      VariableModel(name: 'depth', category: DimensionsCategories.length),
      VariableModel(name: 'length', category: DimensionsCategories.length),
      VariableModel(name: 'OffsetH', category: DimensionsCategories.length),
      VariableModel(name: 'OffsetV', category: DimensionsCategories.length),
      VariableModel(name: 'A', category: DimensionsCategories.length),
    },
  ),

  //Round Duct
  DuctModel(
      id: 100,
      name: 'Straight Duct - Round',
      category: 'Round Duct',
      expression: 'length*pi()*diameter',
      variables: {
        VariableModel(name: 'diameter', category: DimensionsCategories.length),
        VariableModel(name: 'length', category: DimensionsCategories.length),
      }),
  DuctModel(
    id: 110,
    name: 'Elbow - Round',
    category: 'Round Duct',
    expression: 'pi()*diameter*(radius+diameter/2+2*A)*pi()*angle/180',
    variables: {
      VariableModel(name: 'diameter', category: DimensionsCategories.length),
      VariableModel(name: 'radius', category: DimensionsCategories.length),
      VariableModel(name: 'angle', category: DimensionsCategories.angle),
      VariableModel(name: 'A', category: DimensionsCategories.length),
    },
    tests: [
      ['180-angle', 'angle should be less than 180 deg'],
    ],
  ),
  DuctModel(
    id: 120,
    name: 'Tee - Round',
    category: 'Round Duct',
    expression: 'pi()*diameter*length+pi()*D*L+(pi()/2-2)*D^2',
    variables: {
      VariableModel(name: 'diameter', category: DimensionsCategories.length),
      VariableModel(name: 'length', category: DimensionsCategories.length),
      VariableModel(name: 'D', category: DimensionsCategories.length),
      VariableModel(name: 'L', category: DimensionsCategories.length),
    },
    tests: [
      ['diameter-D', 'diameter should be more or equal D'],
      ['length-D', 'length should be more or equal D']
    ],
  ),
  DuctModel(
    id: 121,
    name: 'Tee - Round Rectangular',
    category: 'Round Duct',
    expression:
        'length*pi()*diameter+(width+depth)*2*L+(pi()/2-2)*(width+L)^2/4',
    variables: {
      VariableModel(name: 'diameter', category: DimensionsCategories.length),
      VariableModel(name: 'length', category: DimensionsCategories.length),
      VariableModel(name: 'depth', category: DimensionsCategories.length),
      VariableModel(name: 'width', category: DimensionsCategories.length),
      VariableModel(name: 'L', category: DimensionsCategories.length),
    },
    tests: [
      ['diameter-depth', 'diameter should be more or equal depth'],
      ['length-width', 'length should be more or equal width']
    ],
  ),
  DuctModel(
      id: 130,
      name: 'Reducer - Round',
      category: 'Round Duct',
      expression:
          'pi()*(diameter+D)*((length)^2+(diameter/2-D/2)^2)^0.5/2 + pi()*(diameter+D)*A',
      variables: {
        VariableModel(name: 'diameter', category: DimensionsCategories.length),
        VariableModel(name: 'D', category: DimensionsCategories.length),
        VariableModel(name: 'length', category: DimensionsCategories.length),
        VariableModel(name: 'A', category: DimensionsCategories.length),
      }),
  DuctModel(
    id: 140,
    name: 'Converter - Round-Rectangular',
    category: 'Round Duct',
    expression:
        '(pi()*diameter/4+width)*(length^2+(diameter/2-(depth+(depth^2+width^2)^0.5)/4)^2)^0.5+(pi()*diameter/4+depth)*(length^2+(diameter/2-(width+(depth^2+width^2)^0.5)/4)^2)^0.5 + A*(pi()*diameter+2*depth+2*width)',
    variables: {
      VariableModel(name: 'diameter', category: DimensionsCategories.length),
      VariableModel(name: 'width', category: DimensionsCategories.length),
      VariableModel(name: 'depth', category: DimensionsCategories.length),
      VariableModel(name: 'length', category: DimensionsCategories.length),
      VariableModel(name: 'A', category: DimensionsCategories.length),
    },
  ),

  DuctModel(
      id: 150,
      name: 'End Cap - Round',
      category: 'Round Duct',
      expression: 'A*pi()*diameter+pi()*diameter*diameter/4',
      variables: {
        VariableModel(name: 'diameter', category: DimensionsCategories.length),
        VariableModel(name: 'A', category: DimensionsCategories.length),
      }),
  DuctModel(
      id: 160,
      name: 'Offset - Round',
      category: 'Round Duct',
      expression: 'pi()*diameter*(length^2+Offset^2)^0.5+pi()*(diameter)*A*2',
      variables: {
        VariableModel(name: 'diameter', category: DimensionsCategories.length),
        VariableModel(name: 'length', category: DimensionsCategories.length),
        VariableModel(name: 'Offset', category: DimensionsCategories.length),
        VariableModel(name: 'A', category: DimensionsCategories.length),
      }),
];

final Set<String> ductsCategories = ductsList.map((e) => e.category).toSet();
