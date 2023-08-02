import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placement_cell/utils/Cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromRGBO(1, 1, 24, 1),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 350,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(221, 221, 254, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      right: 40,
                      left: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            child: const Icon(
                              Icons.menu,
                              color: const Color.fromRGBO(1, 1, 24, 1),
                              size: 40,
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 90,
                      left: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Hi, ",
                                style: GoogleFonts.montserrat(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromRGBO(1, 1, 24, 10),
                                ),
                              ),
                              Text(
                                "Shivam",
                                style: GoogleFonts.montserrat(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromRGBO(1, 1, 24, 10),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Second year CSE(DS) student",
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              color: const Color.fromRGBO(1, 1, 24, 10),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "What would you like to see?",
                            style: GoogleFonts.montserrat(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      top: 240,
                      left: 40,
                      child: Row(
                        children: [
                          SearchIcon(
                              icon: Icon(
                                Icons.timer_outlined,
                                size: 40,
                                color: const Color.fromRGBO(1, 1, 24, 1),
                              ),
                              searchoption: "Status"),
                          SizedBox(
                            width: 30,
                          ),
                          SearchIcon(
                              icon: Icon(
                                Icons.design_services_outlined,
                                size: 40,
                                color: const Color.fromRGBO(1, 1, 24, 1),
                              ),
                              searchoption: "My Companies"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 400,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // upload documents
                    CardDescription(
                      title: """Upload Docs""",
                      icon: const Icon(
                        Icons.document_scanner,
                        size: 50,
                        color: Color.fromRGBO(1, 1, 24, 10),
                      ),
                    ),
                    // apply for companies
                    CardDescription(
                        title: "Search",
                        icon: const Icon(
                          Icons.search,
                          size: 50,
                          color: Color.fromRGBO(1, 1, 24, 10),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // applied or not
                    CardDescription(
                        title: "Status",
                        icon: const Icon(
                          Icons.check,
                          size: 50,
                          color: Color.fromRGBO(1, 1, 24, 10),
                        )),

                    // profile
                    CardDescription(
                        title: "Profile",
                        icon: const Icon(
                          Icons.person,
                          size: 50,
                          color: const Color.fromRGBO(1, 1, 24, 1),
                        )),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "POWERED BY DJS COMPUTE",
                style: GoogleFonts.montserrat(color: Colors.lightBlueAccent),
              ),
            ),
          )
        ],
      ),
      drawer: const Drawer(
        backgroundColor: Color.fromRGBO(221, 221, 254, 1),
      ),
    );
  }
}

class SearchIcon extends StatefulWidget {
  final Icon icon;
  final String searchoption;
  const SearchIcon({super.key, required this.icon, required this.searchoption});

  @override
  State<SearchIcon> createState() => _SearchIconState();
}

class _SearchIconState extends State<SearchIcon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(child: widget.icon),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.searchoption,
          style:
              GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}