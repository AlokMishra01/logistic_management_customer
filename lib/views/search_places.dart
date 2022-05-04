// import 'dart:developer';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_place/google_place.dart';
//
// import '../../constants/colors.dart' as colors;
// import '../../constants/values.dart' as values;
//
// class SearchPlaces extends StatefulWidget {
//   final Function(LatLng) onItemTap;
//
//   const SearchPlaces({Key? key, required this.onItemTap}) : super(key: key);
//
//   @override
//   State<SearchPlaces> createState() => _SearchPlacesState();
// }
//
// class _SearchPlacesState extends State<SearchPlaces> {
//   final _googlePlace = GooglePlace('AIzaSyBrCzJmZ8Y2lxQPVsEiYEO7LszrTgJ5nAU');
//   final List<SearchCandidate> _searchResult = [];
//
//   _search(String query) async {
//     final response = await _googlePlace.search.getFindPlace(
//       query,
//       InputType.TextQuery,
//     );
//
//     log(response?.candidates?.length.toString() ?? 'N/a');
//
//     _searchResult
//       ..clear()
//       ..addAll((response?.candidates ?? []).toList());
//
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Material(
//             color: colors.BUTTON_BLUE,
//             child: SafeArea(
//               child: Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       if (Navigator.canPop(context)) Navigator.pop(context);
//                     },
//                     icon: const Icon(
//                       CupertinoIcons.chevron_left,
//                       color: colors.TEXT_WHITE,
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16.0,
//                       vertical: 28,
//                     ),
//                   ),
//                   Expanded(
//                     child: TextField(
//                       onChanged: _search,
//                       style: const TextStyle(
//                         color: colors.TEXT_WHITE,
//                         fontWeight: FontWeight.w500,
//                         height: 1.25,
//                       ),
//                       decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(
//                             values.RADIUS,
//                           ),
//                           borderSide: const BorderSide(
//                             color: colors.TEXT_WHITE,
//                             width: 1.0,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(
//                             values.RADIUS,
//                           ),
//                           borderSide: const BorderSide(
//                             color: colors.TEXT_WHITE,
//                             width: 1.0,
//                           ),
//                         ),
//                         prefixIcon: const Icon(
//                           Icons.search_rounded,
//                           size: 24.0,
//                           color: colors.TEXT_WHITE,
//                         ),
//                         hintText: 'Search location here ...',
//                         hintStyle: const TextStyle(
//                           color: colors.TEXT_SECONDARY_LIGHT,
//                           fontWeight: FontWeight.w500,
//                           height: 1.25,
//                         ),
//                         isDense: true,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 16.0),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.separated(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
//               itemBuilder: (cxt, i) => ListTile(
//                 onTap: () {
//                   widget.onItemTap(
//                     LatLng(
//                       _searchResult[i].geometry?.location?.lat ?? 27.68830,
//                       _searchResult[i].geometry?.location?.lng ?? 85.33556,
//                     ),
//                   );
//                   Navigator.pop(context);
//                 },
//                 horizontalTitleGap: 0.0,
//                 dense: true,
//                 leading: const Icon(
//                   CupertinoIcons.map_pin_ellipse,
//                   color: colors.BUTTON_BLUE,
//                 ),
//                 title: Text(
//                   _searchResult[i].name ?? 'N/a',
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14.0,
//                   ),
//                 ),
//                 subtitle: Text(
//                   _searchResult[i].formattedAddress ?? '',
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 12.0,
//                   ),
//                 ),
//               ),
//               separatorBuilder: (cxt, i) => const Divider(),
//               itemCount: 5,
//               // itemCount: _searchResult.length,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
