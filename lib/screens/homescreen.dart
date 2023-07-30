import 'package:flutter/material.dart';
import 'package:ip_country_lookup/ip_country_lookup.dart';
import 'package:ip_country_lookup/models/ip_country_data_model.dart';
import 'package:oruphones/services/getFilters.dart';
import 'package:oruphones/widgets/homepagebase.dart';
import 'package:oruphones/services/suggestions.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMainPageLoaded = false;
  bool isDataLoaded = false;
  bool isLoading = false;
  bool isLocationAvailable = false;
  bool isSearching = false;
  IpCountryData? countryData;
  String? usersPublicIpAddress;
  String? country;
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  bool checkText() {
    if (_searchController.text.isEmpty) {
      _searchController.clear();
      setState(() {
        isSearching = false;
      });
      return false;
    }
    setState(() {
      isSearching = true;
    });
    return true;
  }

  void getCountry() async {
    usersPublicIpAddress = await IpCountryLookup().getUserIpAddress();
    countryData = await IpCountryLookup().getIpLocationData();
    setState(() {
      country = countryData!.country_name.toString();
      isLocationAvailable = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 44, 46, 67),
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: const Text(
              'Oru Phones',
              style: TextStyle(color: Colors.white),
            ),
            leading: const Icon(
              Icons.view_headline,
              color: Colors.white,
            ),
            actions: [
              if (isLocationAvailable)
                Text(
                  country!,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              IconButton(
                  onPressed: getCountry,
                  icon: const Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 26,
                  )),
              IconButton(
                icon: const Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                  size: 26,
                ),
                //To navigate to notification page
                onPressed: () {},
              ),
            ],
            bottom: AppBar(
              backgroundColor: const Color.fromARGB(255, 44, 46, 67),
              title: TextField(
                autofocus: false,
                autocorrect: false,
                textAlign: TextAlign.left,
                controller: _searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      )),
                  hintText: "Search with make and model",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    color: _searchController.text.isNotEmpty
                        ? Colors.black
                        : Colors.transparent,
                    onPressed: () {
                      _searchController.clear();
                      checkText();
                    },
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 12.0, top: 0.0),
                ),
                onChanged: (value) {
                  checkText();
                },
              ),
            ),
          ),
          // Other Sliver Widgets
          Container(
            child: SliverList(
              delegate: SliverChildListDelegate([
                if (!checkText()) MainPage(loc: country ?? ""),
                if (checkText()) Container()
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
