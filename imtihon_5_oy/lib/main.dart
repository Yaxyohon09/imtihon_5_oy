import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    home: Imtihon(),
    debugShowCheckedModeBanner: false,
  ));
}

class Imtihon extends StatefulWidget {
  const Imtihon({super.key});

  @override
  State<Imtihon> createState() => _ImtihonState();
}

class _ImtihonState extends State<Imtihon> {
  List sushi = [
    A(
      rasm:
          "https://i.pinimg.com/564x/ed/fc/08/edfc08ca5b88e27067af976d65bfde41.jpg",
      nom: "Get special discount",
      foiz: "up to 30%",
      claim: "Claim voucher",
    ),
    A(
      rasm:
          "https://i.pinimg.com/736x/b1/21/41/b121419a4f6e16be30b58364b1b5681c.jpg",
      nom: "Get special discount",
      foiz: "up to 85%",
      claim: "Claim voucher",
    ),
  ];
  List zakaz = [
    B(
      rasm1:
          "https://i.pinimg.com/564x/dd/f5/90/ddf59056f0bd4c806e824b05ea684a30.jpg",
      foiz1: "Original Sushi",
      nom1: "\$ 26.00",
      claim1: "4.8",
    ),
    B(
      rasm1:
          "https://i.pinimg.com/736x/b2/74/c9/b274c9c231b88e0181050aab3026dc6c.jpg",
      foiz1: "Californa Roll",
      nom1: "\$ 18.00",
      claim1: "4.6",
    ),
    B(
      rasm1:
          "https://i.pinimg.com/564x/b6/d8/25/b6d8256761bcb11b4db98b19321c1e67.jpg",
      foiz1: "Salmon Roll",
      nom1: "\$ 20.00",
      claim1: "4.7",
    ),
    B(
      rasm1:
          "https://i.pinimg.com/736x/e6/7f/be/e67fbeb483e55a22d552c2713d8210c0.jpg",
      foiz1: "Dragon Roll",
      nom1: "\$ 23.00",
      claim1: "4.4",
    ),
    B(
      rasm1:
          "https://i.pinimg.com/736x/1b/2e/32/1b2e32c66fba887d99f80404c378f376.jpg",
      foiz1: "Achchiq Sushi",
      nom1: "\$ 16.00",
      claim1: "4.5",
    ),
    B(
      rasm1:
          "https://i.pinimg.com/564x/f2/96/4c/f2964cc56f92ba2a5cf7c0f6685c8db4.jpg",
      foiz1: "Tuna Sashimi",
      nom1: "\$ 30.00",
      claim1: "4.2",
    ),
    B(
      rasm1:
          "https://i.pinimg.com/564x/e1/8c/6b/e18c6b6ef4e0c885e6f06b5ceb3cf577.jpg",
      foiz1: "Spicy Tuna Roll",
      nom1: "\$ 23.50",
      claim1: "4.1",
    ),
    B(
      rasm1:
          "https://i.pinimg.com/564x/79/f1/03/79f103719fb7debf45b18ac33184ee13.jpg",
      foiz1: "Dragon Sushi",
      nom1: "\$ 32.20",
      claim1: "4.0",
    ),
  ];
  final TextEditingController _controller = TextEditingController();
  String _searchText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.fact_check_sharp, size: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Location",
                    style: TextStyle(color: Colors.grey, fontSize: 14)),
                Row(
                  children: const [
                    Icon(Icons.location_on, color: Colors.red),
                    SizedBox(width: 5),
                    Text("Uzbekistan",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
            const Icon(Icons.notifications_active_outlined, size: 35),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(
                height: 220,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: sushi.map((item) => sushii(item)).toList(),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _controller,
                onChanged: (value) {
                  setState(
                    () {
                      _searchText = value; // Kiritilgan matnni yangilaymiz.
                    },
                  );
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search your food ...",
                ),
              ),
            ),
            Row(
              children: const [
                Text("Popular Food", style: TextStyle(fontSize: 30)),
                Spacer(),
                Text("View all",
                    style: TextStyle(fontSize: 25, color: Colors.grey)),
              ],
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: GridView.builder(
                  itemCount: zakaz.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                  ),
                  itemBuilder: (context, index) {
                    final item = zakaz[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(item: item),
                          ),
                        );
                      },
                      child: Expanded(
                        child: Container(
                          // height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text(item.claim1!),
                                ],
                              ),
                              Center(
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(item.rasm1!),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      item.foiz1!,
                                      style: const TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 20),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          item.nom1!,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.black,
                                          child: Icon(Icons.shopping_cart,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final B item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BackButton(),
                SizedBox(
                  width: 35,
                ),
                Text(
                  "Detail",
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
                SizedBox(
                  width: 35,
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ],
            ),
            Center(
              child: Image.network(
                item.rasm1!,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  item.foiz1!,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 150,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  "4.8",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                      height: 40,
                      width: 50,
                      child: Image.network(
                          "https://i.pinimg.com/736x/81/39/c9/8139c9fed6cddfb945cbb0b69be586ab.jpg")),
                ),
                Text(
                  "Salmon",
                ),
                SizedBox(
                  width: 25,
                ),
                Center(
                  child: Container(
                      height: 40,
                      width: 50,
                      child: Image.network(
                          "https://i.pinimg.com/564x/31/4e/d5/314ed5b51638fc450924e126ce48fc1f.jpg")),
                ),
                Text(
                  "Sushi Rice",
                ),
                SizedBox(
                  width: 25,
                ),
                Center(
                  child: Container(
                      height: 40,
                      width: 50,
                      child: Image.network(
                          "https://i.pinimg.com/564x/33/c1/50/33c150f7fca6cad8f8f4239d7378fd50.jpg")),
                ),
                Text(
                  "pepsi",
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  item.nom1 ?? "",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  width: 225,
                ),
                Text(
                  "- 1 +",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "About Sushi",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            Text(
              "Sushi (すし, 寿司, 鮨, 鮓, pronounced [sɯɕiꜜ] or [sɯꜜɕi] ⓘ) is a Japanese dish of prepared vinegared rice (鮨飯, sushi-meshi), usually with some sugar and salt, plus a variety of ingredients (ねた, neta), such as vegetables, meat, or most commonly, seafood, which may be raw or cooked. There are many styles of sushi, and its presentation varies widely, but the one key ingredient is 'sushi rice', also referred to as shari (しゃり), or sumeshi (酢飯).",
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        item.nom1 ?? "",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        "Total price",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 80,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => page3(),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25,
                        ),
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Text(
                          "Plance Order",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class B {
  String? rasm1;
  String? foiz1;
  String? nom1;
  String? claim1;
  B({this.rasm1, this.foiz1, this.nom1, this.claim1});
}

class A {
  String? rasm;
  String? foiz;
  String? nom;
  String? claim;
  A({this.rasm, this.foiz, this.nom, this.claim});
}

Widget sushii(A item) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image:
          DecorationImage(image: NetworkImage(item.rasm!), fit: BoxFit.cover),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.nom!,
              style: const TextStyle(color: Colors.white, fontSize: 25)),
          Text(item.foiz!,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey[50],
            ),
            child: Text(item.claim!),
          ),
        ],
      ),
    ),
  );
}

class page3 extends StatefulWidget {
  const page3({super.key});

  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              BackButton(),
              SizedBox(
                width: 80,
              ),
              Text(
                "Your cart food",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 80,
                      child: Image.network(
                        "https://i.pinimg.com/564x/dd/f5/90/ddf59056f0bd4c806e824b05ea684a30.jpg",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Original Sushi",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "\$ 26.00",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                width: 1,
                                color: Colors.black,
                              )),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "    1 +",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 80,
                      child: Image.network(
                        "https://i.pinimg.com/564x/f2/96/4c/f2964cc56f92ba2a5cf7c0f6685c8db4.jpg",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "California Roll",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "\$ 18.00",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                width: 1,
                                color: Colors.black,
                              )),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "    1 +",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 80,
                      child: Image.network(
                        "https://i.pinimg.com/564x/79/f1/03/79f103719fb7debf45b18ac33184ee13.jpg",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Salmon Roll   ",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "\$ 22.50",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                width: 1,
                                color: Colors.black,
                              )),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "    1 +",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.panorama_horizontal_select_outlined,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Promo code",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 150,
                ),
                Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      "Apply",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Item total:",
                ),
                SizedBox(
                  width: 250,
                ),
                Text(
                  "\$70.50",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Delivery:",
                ),
                SizedBox(
                  width: 275,
                ),
                Text(
                  "Free",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 280,
                ),
                Text(
                  "70.50",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Payment",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
