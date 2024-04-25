import 'package:flutter/material.dart';
import 'package:flutter_project/Student/homePage/detailPage.dart';
import 'sports.dart';
import '../constants.dart';

class SportCenterListView extends StatelessWidget {
  const SportCenterListView({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultPadding),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: sportCenterList.length,
        itemBuilder: (context, index) {
          final sportCenter = sportCenterList[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(sportCenter: sportCenter),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding / 2),
              child: Container(
                height: size.height / 3.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: Offset(2, 2),
                      blurRadius: 5,
                      spreadRadius: 3,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          sportCenter.imageurl,
                          fit: BoxFit.cover,
                          width: size.width,
                          height: size.height / 3.5,
                        ),
                      ),
                    ),
                    SizedBox(height: defaultPadding / 2),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Text(
                        "${sportCenter.centerName}",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
