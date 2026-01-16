import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _passController = TextEditingController();
  bool _isObscure = true;
  bool _isConfirmObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 280,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1A73E8), Color(0xFF6FB1FC)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(100),
                    ),
                  ),
                ),
                Positioned(
                  right: -30,
                  top: -30,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        "Create your account to start shopping",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildCustomTextField(
                      label: "Nama Lengkap",
                      icon: Icons.person_add_alt_1_rounded,
                      validator: (value) => value!.isEmpty ? "Nama tidak boleh kosong" : null,
                    ),
                    const SizedBox(height: 20),
                    _buildCustomTextField(
                      label: "Email",
                      icon: Icons.alternate_email_rounded,
                      validator: (value) => !value!.contains("@") ? "Email Salah" : null,
                    ),
                    const SizedBox(height: 20),
                    _buildPasswordField(
                      controller: _passController,
                      label: "Password",
                      isObscure: _isObscure,
                      onToggle: () => setState(() => _isObscure = !_isObscure),
                    ),
                    const SizedBox(height: 20),
                    _buildPasswordField(
                      label: "Konfirmasi Password",
                      isObscure: _isConfirmObscure,
                      onToggle: () => setState(() => _isConfirmObscure = !_isConfirmObscure),
                      validator: (value) {
                        if (value != _passController.text) return "Password tidak cocok";
                        return null;
                      },
                    ),
                    const SizedBox(height: 40),

                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF1A73E8).withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1A73E8),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _showSuccessDialog();
                          }
                        },
                        child: const Text(
                          "CREATE ACCOUNT",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? ", style: TextStyle(color: Colors.grey)),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Color(0xFF1A73E8),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomTextField({required String label, required IconData icon, String? Function(String?)? validator}) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF1A73E8)),
        filled: true,
        fillColor: Colors.blue.withOpacity(0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
      ),
    );
  }

  Widget _buildPasswordField({
    TextEditingController? controller,
    required String label,
    required bool isObscure,
    required VoidCallback onToggle,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      validator: validator ?? (value) => value!.length < 6 ? "Pass minimal 6 karakter" : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: const Icon(Icons.lock_person_rounded, color: Color(0xFF1A73E8)),
        suffixIcon: IconButton(
          icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
          onPressed: onToggle,
        ),
        filled: true,
        fillColor: Colors.blue.withOpacity(0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 20),
            const Text("Success!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Pendaftaran Berhasil"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); 
              },
              child: const Text("Go to Login"),
            )
          ],
        ),
      ),
    );
  }
}