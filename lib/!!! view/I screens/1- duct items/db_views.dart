import 'package:duct_area_app/!!!%20view/II%20widgets/grid%20view/grid_view_duct_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../! core/model/page_model.dart';
import '../2- data tables/data_table_items.dart';
import '../2- data tables/data_table_projects.dart';
import '../2- data tables/data_table_systems.dart';

List<PageModel> dataTableViewPages = [
  PageModel(
      name: 'Projects',
      iconData: FaIcon(FontAwesomeIcons.buildingColumns),
      page: const DataTableProjectsPage()),
  PageModel(
      name: 'Units',
      iconData: FaIcon(FontAwesomeIcons.networkWired),
      page: DataTableSystemsPage()),
  PageModel(
      name: 'Items',
      iconData: FaIcon(FontAwesomeIcons.unity),
      page: DataTableItemsPage()),
];

List<PageModel> ductTypesPages = [
  PageModel(
      name: 'Rectangle Duct',
      iconData: FaIcon(FontAwesomeIcons.square),
      page: GridViewDuctList(category: 'Rectangular Duct')),
  PageModel(
      name: 'Round Duct',
      iconData: FaIcon(FontAwesomeIcons.circle),
      page: GridViewDuctList(category: 'Round Duct')),
];
