import 'package:craft_panel/onboarding/presentation/onboarding_next_button.dart';
import 'package:flutter/material.dart';
import 'package:exaroton_api/exaroton_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProvideApi extends StatefulWidget {
  final void Function() onNext;
  const ProvideApi({super.key, required this.onNext});

  @override
  State<ProvideApi> createState() => _ProvideApiState();
}

class _ProvideApiState extends State<ProvideApi> {
  final TextEditingController _controller = TextEditingController();
  bool canProgress = false;
  bool isLoading = false;
  Account? account;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          canProgress ? OnboardingNextButton(onNext: widget.onNext) : null,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Provide your API key',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'You can get your API key from the Exaroton dashboard',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              spreadRadius: 1,
                              blurRadius: 0, // Sharp shadow with no blur
                              offset: const Offset(7, 7), // Diagonal offset
                            ),
                          ],
                        ),
                        child: TextField(
                          enabled: !canProgress,
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: 'Exaroton API key',
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0)),
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1,
                          blurRadius: 0, // Sharp shadow with no blur
                          offset: const Offset(7, 7), // Diagonal offset
                        ),
                      ],
                    ),
                    child: SizedBox(
                      width: 56, // Making it square
                      height: 56,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          disabledBackgroundColor: Colors.grey,
                          backgroundColor: Colors.green,
                          side: BorderSide(color: Colors.black, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero, // Sharp corners
                          ),
                          padding: EdgeInsets.zero, // Remove default padding
                          elevation: 0, // Remove default elevation
                        ),
                        onPressed: !canProgress ? checkApiKey : null,
                        child: const Icon(
                            Icons.search), // Replace with your desired icon
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (isLoading) const CircularProgressIndicator.adaptive(),
            account != null
                ? AccountData(
                    account: account!,
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void checkApiKey() async {
    setState(() {
      isLoading = true;
    });
    final client = ExarotonClient(_controller.text);
    try {
      account = await client.accountService.getAccount();
      final storage = await SharedPreferences.getInstance();
      storage.setString("api", _controller.text);
      setState(() {
        canProgress = true;
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}

class AccountData extends StatelessWidget {
  final Account account;
  const AccountData({
    super.key,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Account name: ${account.name}"),
        Text("Account e-mail: ${account.email}"),
        Text("Account credits: ${account.credits}"),
      ],
    );
  }
}
