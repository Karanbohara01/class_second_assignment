import 'package:class_assignment_second/bloc/area_of_circle_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaOfCircleView extends StatelessWidget {
  const AreaOfCircleView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController radiusController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Area of Circle")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter radius of the circle:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: radiusController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter radius in meters',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final radius = double.tryParse(radiusController.text);
                if (radius != null && radius > 0) {
                  context.read<AreaOfCircleBloc>().add(CalculateArea(radius));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please enter a valid radius')),
                  );
                }
              },
              child: const Text('Calculate Area'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<AreaOfCircleBloc, AreaOfCircleState>(
              builder: (context, state) {
                if (state is AreaOfCircleLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AreaOfCircleResult) {
                  return Text(
                    'Area: ${state.area.toStringAsFixed(2)} square meters',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  );
                } else if (state is AreaOfCircleError) {
                  return Text(
                    'Error: ${state.error}',
                    style: const TextStyle(color: Colors.red, fontSize: 18),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
