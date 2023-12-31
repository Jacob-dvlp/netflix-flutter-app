import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget {
  final String? query;
  const Searchbar({super.key, this.query});
  set setQuery(String query) => query;

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final searchQuery = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchQuery,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                    gapPadding: 0),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 20,
                ),
                fillColor: Colors.white,
                filled: true,
                alignLabelWithHint: true,
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                setState(() {
                  widget.setQuery = value;
                });
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.setQuery = searchQuery.text;
              });
            },
            child: Container(
              height: 38,
              width: 40,
              decoration: BoxDecoration(
                color: const Color(0xffF62E1F),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                CupertinoIcons.search,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
