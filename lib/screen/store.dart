import 'package:flutter/material.dart';

class Store extends StatefulWidget {
  Store({Key? key}) : super(key: key);

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  List<String> catagory = [
    'Top item',
    'Almirah',
    'Alna',
    'Chair',
    'Mirror',
    'Table',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(16),
        constraints: BoxConstraints.expand(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Your Best Choice',
            // ignore: prefer_const_constructors
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: 'Search item here',
                isDense: true,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            height: 35,
            width: double.infinity,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MaterialButton(
                    shape: const StadiumBorder(),
                    color: selectedIndex == index ? Colors.blue : null,
                    onPressed: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                    child: Text(catagory[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 0,
                  );
                },
                itemCount: catagory.length),
          ),
          Expanded(
              child: ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      height: 120,
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      child: Row(
                        children: [
                          Image.asset('assets/images/logo.png'),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Product title',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text('Brand: title'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Brand: title'),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: StadiumBorder()),
                                      onPressed: () {},
                                      child: const Text('Buy now'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }))
        ]),
      ),
    ));
  }
}
