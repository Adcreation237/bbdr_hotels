import 'package:bbdr_hotel/hotel_details_screen.dart';
import 'package:bbdr_hotel/models/hotel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PopularHotels extends StatefulWidget {
  const PopularHotels({
    Key? key,
  }) : super(key: key);

  @override
  State<PopularHotels> createState() => _PopularHotelsState();
}

CollectionReference _usersStream =
    FirebaseFirestore.instance.collection('chambres');

class _PopularHotelsState extends State<PopularHotels> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: _usersStream.where('vote', isGreaterThanOrEqualTo: 20).get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Container(
            child: Column(
              children: [
                Icon(
                  Icons.warning,
                  size: 40,
                  color: Colors.red,
                ),
                Text(
                  "Something went wrong",
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
          return SizedBox(
            child: Divider(),
          );
        }
        return Container(
          height: 220,
          width: double.infinity,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              var doc = snapshot.data!.docs[index];
              return GestureDetector(
                onTap: () {
                  /*Navigator.push(
                    context,
                    MaterialPageRoute( 
                      builder: (_) => DetailsScreen(
                        hotel: doc,
                      ),
                    ),
                  );*/
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  padding: EdgeInsets.only(bottom: 5),
                  height: 200,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 10.0,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Hero(
                        tag: doc['nom_chambre'],
                        child: Container(
                          height: 140.0,
                          width: 170.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(doc['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          doc['nom_chambre'],
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          doc['proprietaire'],
                          style: TextStyle(fontSize: 13.0, color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '\$${doc['prix']} / night',
                              style: TextStyle(color: Colors.blue),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  '${hotels[index].rating}',
                                  style: TextStyle(color: Colors.blue),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.blue,
                                  size: 16.0,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
