import 'package:class_assignment_second/bloc/simple_interest_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestView extends StatelessWidget {
  const SimpleInterestView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController principalController = TextEditingController();
    final TextEditingController rateController = TextEditingController();
    final TextEditingController timeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Simple Interest Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Principal Amount:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: principalController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter principal amount',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter Rate of Interest:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: rateController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter rate of interest (%)',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter Time Period (in years):',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: timeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter time in years',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final principal = double.tryParse(principalController.text);
                final rate = double.tryParse(rateController.text);
                final time = double.tryParse(timeController.text);

                if (principal != null && rate != null && time != null) {
                  context.read<SimpleInterestBloc>().add(
                      CalculateSimpleInterest(
                          principal: principal, rate: rate, time: time));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please enter valid input values')),
                  );
                }
              },
              child: const Text('Calculate Simple Interest'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<SimpleInterestBloc, SimpleInterestState>(
              builder: (context, state) {
                if (state is SimpleInterestLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SimpleInterestResult) {
                  return Text(
                    'Simple Interest: ${state.interest.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  );
                } else if (state is SimpleInterestError) {
                  return Text(
                    'Error: ${state.error}',
                    style: const TextStyle(color: Colors.red, fontSize: 18),
                  );
                }
                return const Text(
                  'Result will be displayed here',
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
