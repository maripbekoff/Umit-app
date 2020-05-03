import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key key, this.cardTitle}) : super(key: key);
  final String cardTitle;

  @override
  Widget build(BuildContext context) {
    Color _mainColor = Color(0xFF0779E4);

    return Container(
      padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 151, 255, 0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: Color(0xFFF0F0F0),
        ),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              cardTitle,
              style: TextStyle(
                color: _mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            trailing: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                color: _mainColor,
                size: 18,
              ),
            ),
          ),
          Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              itemCount: 6,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.065,
                );
              },
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: _mainColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
