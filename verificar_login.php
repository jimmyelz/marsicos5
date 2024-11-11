<?php
if (isset($_POST['login'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Credenciales de inicio de sesión
    $correct_username = "MARISCOS_5L1";
    $correct_password = "PB3";

    // Validación de credenciales
    if ($username === $correct_username && $password === $correct_password) {
        // Redirigir a la página de menú en HTML si las credenciales son correctas
        header("Location: MARISCOS1.HTML");
        exit();
    } else {
        // Mostrar mensaje de error si las credenciales no son válidas
        echo "<p style='color: red; text-align: center;'>Usuario o contraseña incorrectos</p>";
        echo "<p style='text-align: center;'><a href='login.html'>Volver al inicio de sesión</a></p>";
    }
}
?>
