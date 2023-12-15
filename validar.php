<?php
session_start();

$usuario = $_POST['usuario'];
$contraseña = $_POST['contraseña'];

$conexion = mysqli_connect("localhost", "root", "alvarez.15", "Veterinaria");

if (!$conexion) {
    die("Error de conexión: " . mysqli_connect_error());
}

$consulta = "SELECT * FROM Usuarios WHERE usuario=? AND contraseña=?";
$statement = mysqli_prepare($conexion, $consulta);
mysqli_stmt_bind_param($statement, "ss", $usuario, $contraseña);
mysqli_stmt_execute($statement);

$resultado = mysqli_stmt_get_result($statement);

if ($fila = mysqli_fetch_assoc($resultado)) {
    $_SESSION['usuario'] = $usuario;
    
    if ($fila['Tipo_usuario'] == 1) { // Dueño
        header("Location: admin.php");
        exit();
    } elseif ($fila['Tipo_usuario'] == 2) { // Veterinario
        header("Location: cliente.php");
        exit();
    }
} else {
    echo '<h1 class="bad">ERROR EN LA AUTENTIFICACION</h1>';
    include("index.html");
}

mysqli_stmt_close($statement);
mysqli_close($conexion);
?>