// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AutocompleteStyle extends StatelessWidget {
  const AutocompleteStyle({
    Key? key,
    required this.onSelected,
    required this.onRemove,
    required this.options,
  }) : super(key: key);

  final void Function(String) onSelected;
  final void Function(String) onRemove;
  final Iterable<String> options;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 300,
          height: 200,
          child: Material(
            elevation: 4,
            color: Colors.purple[800]!,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: options.length,
              itemBuilder: (context, index) {
                final String option = options.elementAt(index);

                return GestureDetector(
                  onTap: () {
                    onSelected(option);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1.2,
                          color: Colors.grey[200]!,
                        ),
                      ),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.history,
                        color: Colors.white,
                      ),
                      title: Text(
                        option,
                      ),
                      trailing: GestureDetector(
                        onTap: (){
                          onRemove(option);
                        },
                        child: const Icon(
                          Icons.highlight_remove,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
