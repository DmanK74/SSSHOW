import 'package:felix_ui/felix_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:admibka/api/shows.dart';

class PosterCard extends StatelessWidget {
  const PosterCard({
    @required this.name,
    @required this.imageUri,
    @required this.onTap,
    this.score,
  });

  final String name;
  final String imageUri;
  final String score;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: FlxTargetWell(
        hoverColor: Color.fromRGBO(40, 40, 40, 60),
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border(
              bottom: BorderSide(
                width: 3,
                color: Color.fromRGBO(130, 130, 130, 100),
              ),
              top: BorderSide(
                width: 3,
                color: Color.fromRGBO(130, 130, 130, 100),
              ),
              right: BorderSide(
                width: 3,
                color: Color.fromRGBO(130, 130, 130, 100),
              ),
              left: BorderSide(
                width: 3,
                color: Color.fromRGBO(130, 130, 130, 100),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                FlxCard.normal(
                  height: 250,
                  width: 150,
                  child: Image.asset(
                    imageUri,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: FlxTheme.dark().textStyles.text,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          score,
                          style: FlxTheme.dark().textStyles.text.copyWith(),
                        ),
                        Text(
                          '★',
                          style: FlxTheme.dark()
                              .textStyles
                              .text
                              .copyWith(color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
