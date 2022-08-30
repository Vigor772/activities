import 'package:flutter/material.dart';
import 'package:todo_app/models/item_model.dart';

import '../../widgets/item_button.dart';

enum GroceryFormMode {
  add,
  edit,
}

class GroceryFormPage extends StatefulWidget {
  final ItemModel? itemModel;
  final GroceryFormMode mode;

  const GroceryFormPage({
    super.key,
    this.itemModel,
    this.mode = GroceryFormMode.add,
  });

  @override
  State<GroceryFormPage> createState() => _GroceryFormPageState();
}

class _GroceryFormPageState extends State<GroceryFormPage> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _date = TextEditingController();

  // Called only on first time
  @override
  void initState() {
    if (widget.mode == GroceryFormMode.edit) {
      if (widget.itemModel != null) {
        _title.text = widget.itemModel!.title;
        _description.text = widget.itemModel!.description;
        _date.text = widget.itemModel!.date;
      }
    }
    super.initState();
  }

  // Called on first time,
  // then on setState();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.mode == GroceryFormMode.add ? 'New Item' : 'Edit Item',
          ),
        ),
        backgroundColor: Colors.black87,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      controller: _title,
                      decoration: const InputDecoration(label: Text('Title')),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      maxLines: 5,
                      controller: _description,
                      decoration: const InputDecoration(
                        label: Text('Description'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      controller: _date,
                      decoration: const InputDecoration(
                        label: Text('Date'),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ItemButton(
                  title: widget.mode == GroceryFormMode.add ? 'Save' : 'Update',
                  onItemPressed: () {
                    /// This is a basic validation to check whether the
                    /// `TextField` has inputs from the user.
                    if (_title.text.isNotEmpty &&
                        _description.text.isNotEmpty &&
                        _date.text.isNotEmpty) {
                      Navigator.pop(
                        context,

                        /// This is where you pass the a `dynamic`
                        /// item.
                        ItemModel(
                          title: _title.text,
                          description: _description.text,
                          date: _date.text,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
