import 'package:flutter/material.dart';
import 'package:salamtak/core/widgets/location_section.dart';
import 'package:salamtak/features/medication_feature/presentation/add_donation/widgets/add_donation_body.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/constants.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

class UserInfoListTile extends StatefulWidget {
  const UserInfoListTile({
    super.key,
    required this.text,
    required this.value,
    required this.onTap,
    required this.onChanged,
    required this.onSave,
    required this.onCancel,
    this.isEdit = false,
    this.keyboardType = TextInputType.text,
    this.onLocationChanged,
    this.selectedLocation,
  });

  final String text;
  final String value;
  final VoidCallback onTap;
  final bool isEdit;
  final void Function(String) onChanged;
  final void Function() onSave;
  final void Function() onCancel;
  final TextInputType keyboardType;
  final void Function(LocationSudan)? onLocationChanged;
  final LocationSudan? selectedLocation;

  @override
  _UserInfoListTileState createState() => _UserInfoListTileState();
}

class _UserInfoListTileState extends State<UserInfoListTile> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.value);

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.isEdit;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveChanges() {
    widget.onTap();
    widget.onSave();
    _toggleEditing();
  }

  void _cancelChanges() {
    widget.onCancel();
    _controller.text = widget.value;
    _toggleEditing();
  }

  @override
  Widget build(BuildContext context) {
    if (_isEditing) {
      if (widget.onLocationChanged == null) {
        return ListTile(
          subtitle: TextField(
            controller: _controller,
            onChanged: widget.onChanged,
            keyboardType: widget.keyboardType,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: widget.value,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: _saveChanges,
                icon: Icon(
                  Icons.check,
                  color: lightGreen,
                ),
              ),
              IconButton(
                onPressed: _cancelChanges,
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        );
      } else if (widget.onLocationChanged != null) {
        return ListTile(
          subtitle: LocationSection(
            selectedLocation: widget.selectedLocation,
            selectedAddress: widget.selectedLocation?.address,
            onLocationChanged: widget.onLocationChanged!,
            onAddressChanged: widget.onChanged,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: _saveChanges,
                icon: Icon(
                  Icons.check,
                  color: lightGreen,
                ),
              ),
              IconButton(
                onPressed: _cancelChanges,
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        );
      } else {
        return ListTile(
          subtitle: TextField(
            controller: _controller,
            keyboardType: widget.keyboardType,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: widget.value,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: _saveChanges,
                icon: Icon(
                  Icons.check,
                  color: lightGreen,
                ),
              ),
              IconButton(
                onPressed: _cancelChanges,
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        );
      }
    } else {
      return ListTile(
        onTap: widget.onTap,
        title: Text(
          widget.text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
              ),
        ),
        subtitle: Text(
          widget.value,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: TextButton(
          onPressed: _toggleEditing,
          child: Text(
            context.l10n.edit,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: lightGreen,
                ),
          ),
        ),
      );
    }
  }
}
