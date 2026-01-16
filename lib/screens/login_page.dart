import 'package:flutter/material.dart';
import 'register_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

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
                  height: 380, 
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1A73E8), Color(0xFF6FB1FC)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                    ),
                  ),
                ),
          
                Positioned(
                  top: -50,
                  left: -50,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  right: -30,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 110),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
                        ),
                        child: const Icon(
                          Icons.shopping_cart_checkout_rounded, 
                          size: 60, 
                          color: Colors.white
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        "ECOMMERCE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                        ),
                      ),
                      const Text(
                        "P R A C T I C E",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Login Account",
                      style: TextStyle(
                        fontSize: 28, 
                        fontWeight: FontWeight.bold, 
                        color: Color(0xFF333333)
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Hello, please login to your account.",
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                    ),
                    const SizedBox(height: 40),

                    _buildInputField(
                      label: "Email",
                      hint: "Masukan Email",
                      icon: Icons.email_rounded,
                      validator: (value) {
                        if (value == null || !value.contains("@")) return "Masukan email valid";
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),

                    TextFormField(
                      obscureText: !_isPasswordVisible,
                      validator: (value) {
                        if (value == null || value.length < 6) return "Minimal 6 karakter";
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Minimal 6 Karakter",
                        prefixIcon: const Icon(Icons.lock_rounded, color: Color(0xFF1A73E8)),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off, 
                            color: Colors.grey
                          ),
                          onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                        ),
                        filled: true,
                        fillColor: Colors.blue.withOpacity(0.05),
                        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Color(0xFF1A73E8), width: 1),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?", 
                          style: TextStyle(color: Color(0xFF1A73E8), fontWeight: FontWeight.w600)
                        ),
                      ),
                    ),

                    const SizedBox(height: 35),
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF1A73E8).withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1A73E8),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacement(
                              context, 
                              MaterialPageRoute(builder: (context) => HomePage())
                            );
                          }
                        },
                        child: const Text(
                          "L O G I N", 
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),

                    const SizedBox(height: 50),
                    Center(
                      child: Column(
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 5),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => RegisterPage())
                            ),
                            child: const Text(
                              "Sign Up Now",
                              style: TextStyle(
                                color: Color(0xFF1A73E8), 
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildInputField({
    required String label, 
    required String hint, 
    required IconData icon, 
    String? Function(String?)? validator
  }) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: const Color(0xFF1A73E8)),
        filled: true,
        fillColor: Colors.blue.withOpacity(0.05),
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0xFF1A73E8), width: 1),
        ),
      ),
    );
  }
}
