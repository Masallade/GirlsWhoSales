// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:qjobs/Provider/country_provider.dart';
// import 'package:qjobs/model/countryModel.dart';
// import 'package:qjobs/utils/constants2.dart';
// import 'package:qjobs/widgets/coountry_listtile_widget.dart';
//
// class CountryPage extends StatefulWidget {
//   final bool isMultiSelection;
//   final List<Country> countries;
//
//   const CountryPage({
//     Key key,
//     this.isMultiSelection = false,
//     this.countries = const [],
//   }) : super(key: key);
//
//   @override
//   _CountryPageState createState() => _CountryPageState();
// }
//
// class _CountryPageState extends State<CountryPage> {
//   String text = '';
//   List<Country> selectedCountries = [];
//   bool isNative = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     selectedCountries = widget.countries;
//   }
//
//   bool containsSearchText(Country country) {
//     final name = isNative ? country.nativeName : country.name;
//     final textLower = text.toLowerCase();
//     final countryLower = name.toLowerCase();
//
//     return countryLower.contains(textLower);
//   }
//
//   List<Country> getPrioritizedCountries(List<Country> countries) {
//     final notSelectedCountries = List.of(countries)
//       ..removeWhere((country) => selectedCountries.contains(country));
//
//     return [
//       ...List.of(selectedCountries)..sort(Utils.ascendingSort),
//       ...notSelectedCountries,
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<CountryProvider>(context);
//     final allCountries = getPrioritizedCountries(provider.countries);
//     final countries = allCountries.where(containsSearchText).toList();
//
//     return Scaffold(
//       appBar: buildAppBar(),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView(
//               children: countries.map((country) {
//                 final isSelected = selectedCountries.contains(country);
//
//                 return CountryListTileWidget(
//                   country: country,
//                   isNative: isNative,
//                   isSelected: isSelected,
//                   onSelectedCountry: selectCountry,
//                 );
//               }).toList(),
//             ),
//           ),
//           buildSelectButton(context),
//         ],
//       ),
//     );
//   }
//
//   Widget buildAppBar() {
//     final label = widget.isMultiSelection ? 'Countries' : 'Country';
//
//     return AppBar(
//       leading: GestureDetector(
//           onTap: (){
//             Navigator.of(context).pop();
//           },
//           child: Icon(Icons.arrow_back , color: Colors.black,)),
//       centerTitle: true,
//       backgroundColor: Colors.white,
//       elevation: 0.0,
//       title: Text('Select JobTitles' , style: TextStyle(
//         fontFamily: 'Poppins',
//         fontStyle: FontStyle.normal,
//         fontWeight: FontWeight.w500,
//         color: Colors.black,
//         fontSize: 18.0,
//         //fontWeight: FontWeight.w700,
//       )),
//       //title: Text('Select JobTitles $label'),
//       // actions: [
//       //   IconButton(
//       //     icon: Icon(isNative ? Icons.close : Icons.language),
//       //     onPressed: () => setState(() => this.isNative = !isNative),
//       //   ),
//       //   const SizedBox(width: 8),
//       // ],
//       // bottom: PreferredSize(
//       //   preferredSize: Size.fromHeight(60),
//       //   child: SearchWidget(
//       //     text: text,
//       //     onChanged: (text) => setState(() => this.text = text),
//       //     hintText: 'Search $label',
//       //   ),
//       // ),
//     );
//   }
//
//   Widget buildSelectButton(BuildContext context) {
//     final label = widget.isMultiSelection
//         ? 'Select ${selectedCountries.length} Countries'
//         : 'Continue';
//
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//       color: Theme.of(context).primaryColor,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           shape: StadiumBorder(),
//           minimumSize: Size.fromHeight(40),
//           primary: Colors.white,
//         ),
//         child: Text(
//           label,
//           style: TextStyle(color: Colors.black, fontSize: 16),
//         ),
//         onPressed: submit,
//       ),
//     );
//   }
//
//   void selectCountry(Country country) {
//     if (widget.isMultiSelection) {
//       final isSelected = selectedCountries.contains(country);
//       setState(() => isSelected
//           ? selectedCountries.remove(country)
//           : selectedCountries.add(country));
//     } else {
//       Navigator.pop(context, country);
//     }
//   }
//
//   void submit() => Navigator.pop(context, selectedCountries);
// }