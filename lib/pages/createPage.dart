import 'package:flutter/material.dart';

class createPage extends StatefulWidget {
  const createPage({super.key});

  @override
  State<createPage> createState() => _createPageState();
}

class _createPageState extends State<createPage> {
  final List<String> categories = ['Games', 'Comics', 'Animation'];
  String selectedCategory = 'Games';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Project'),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child:
                   Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("START A CAMPAIGN", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold), ),
                            Icon(Icons.rocket_launch, size: 40, color: Colors.black,),
                          ],
                        ),
                        SizedBox(height: 20),
        
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Project Title',
                            floatingLabelBehavior: FloatingLabelBehavior.always, //makes label come in top of field always
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
        
                        SizedBox(height: 20),
        
                        DropdownButtonFormField<String>(
                          value: selectedCategory,
                          decoration: InputDecoration(
                            labelText: 'Category',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          items: categories
                              .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                              .toList(),
                          onChanged: (value) {
                            setState(() => selectedCategory = value!);
                          },
                        ),
        
                        SizedBox(height: 20,),
        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: '\$Funding Goal',
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
        
                            SizedBox(width: 20),
        
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Duration',
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
        
                        SizedBox(height: 20),
        
                        TextField(
                          minLines: 5,
                          maxLines: 8,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            hintText: 'Provide project description..',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          ),

                        SizedBox(height: 20),

                        InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {},
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width:1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.cloud_upload, size: 40),
                                SizedBox(height: 8),
                                Text('[+Upload Image]')
                              ],
                            )

                            ),

                          ),

                        SizedBox(height: 20),

                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                          child: Text('Publish Project', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
              ),
        
          ],
        ),
      ),
    );
  }
}
