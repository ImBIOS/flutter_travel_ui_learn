import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_learn/models/destination_model.dart';
import 'package:flutter_travel_ui_learn/models/hotel_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HotelCarousel extends StatelessWidget {
  const HotelCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Exclusive Hotels',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5)),
              GestureDetector(
                onTap: () => print('See All'),
                child: Text(
                  'See All',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
              itemBuilder: (BuildContext context, int index) => Container(
                  margin: const EdgeInsets.all(10.0),
                  width: 240.0,
                  child:
                      Stack(alignment: Alignment.topCenter, children: <Widget>[
                    Positioned(
                      bottom: 15.0,
                      child: Container(
                        height: 120.0,
                        width: 240.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                hotels[index].name,
                                style: const TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2),
                              ),
                              const SizedBox(height: 2.0),
                              Text(
                                hotels[index].address,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 2.0),
                              Text('\$${hotels[index].price} / night',
                                  style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0)
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          height: 180.0,
                          width: 220.0,
                          image: AssetImage(hotels[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ]))),
        )
      ],
    );
  }
}
