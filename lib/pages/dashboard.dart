import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  String selectedOption = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child:
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Search',
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),

                  ),

                    Text("Explore Projects", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold ), textAlign: TextAlign.left),

                    SizedBox(height: 10),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 10,
                        children: [
                            ChoiceChip(
                              label: Text("All"),
                              selected: selectedOption == "All",
                              onSelected: (bool selected) {
                                setState(() {
                                  // selectedOption = selected ? "All" : ""; // selecting and deselecting
                                  selectedOption = "All";
                                });
                              },
                              selectedColor: Colors.green,
                            ),
                            ChoiceChip(
                            label: Text("Games"),
                            selected: selectedOption == "Games",
                            onSelected: (bool selected) {
                              setState(() {
                                selectedOption = "Games";
                              });
                            },
                            selectedColor: Colors.green,
                          ),
                            ChoiceChip(
                            label: Text("Comics"),
                            selected: selectedOption == "Comics",
                            onSelected: (bool selected) {
                              setState(() {
                                selectedOption = "Comics";
                              });
                            },
                            selectedColor: Colors.green,
                          ),
                            ChoiceChip(
                            label: Text("Animation"),
                            selected: selectedOption == "Animation",
                            onSelected: (bool selected) {
                              setState(() {
                                selectedOption = "Animation";
                              });
                            },
                            selectedColor: Colors.green,
                          ),
                          ],
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child:
                                Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                          "https://img.itch.zone/aW1nLzMyMDQyNDQ0LnBuZw==/315x250%23c/HCiism.png",
                                          fit: BoxFit.cover),
                                    ),
                                    Text("IdleCraft", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                    Text("\$2500 raised"),
                                  ],
                                ),
                          ),
                        ),

                          SizedBox(height: 10),

                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child:
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                        "https://img.itch.zone/aW1nLzMyMDQyNDQ0LnBuZw==/315x250%23c/HCiism.png",
                                        fit: BoxFit.cover),
                                  ),
                                  Text("IdleCraft", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  Text("\$2500 raised"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )

              ],
            ),

          )
        ],
      ),

    );
  }
}
