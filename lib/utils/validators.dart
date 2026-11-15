class Validators {
  // Private constructor agar class ini tidak bisa di-instansiasi (hanya menampung static method)
  Validators._();

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email tidak boleh kosong';
    }
    // Regex sederhana untuk mengecek format email
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Format email tidak valid';
    }
    return null; // Return null berarti validasi berhasil (tidak ada error)
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  static String? validatePasswordConfirmation(String? password, String? confirmation) {
    if (confirmation == null || confirmation.isEmpty) {
      return 'Konfirmasi password tidak boleh kosong';
    }
    if (password != confirmation) {
      return 'Password tidak cocok';
    }
    return null;
  }
}