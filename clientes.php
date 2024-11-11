<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>MARISCO</title>
    <link rel="stylesheet" type="text/css" href="CSS.css">
</head>
<body>
    <center>
        <?php
            $con = mysqli_connect("localhost", "root", "", "mariscos");
            $resultado = mysqli_query($con, "SELECT * FROM clientes");

            if ($resultado === FALSE) {
                echo "Fallo en la consulta";
                die(mysqli_error($con));
            }

            echo "<center><font face='Arial'>";
            echo "<h1>Clientes</h1>";
            echo "<table border='1'>
                    <tr>
                        <th>id_cliente</th>
                        <th>nombre</th>
                        <th>mesa</th>
                        <th>telefono</th>
                        <th>id_pedido</th>
                    </tr>";

            while ($row = mysqli_fetch_array($resultado)) {
                echo "<tr>";
                echo "<td align='center'>" . $row['id_cliente'] . "</td>";
                echo "<td align='center'>" . $row['nombre'] . "</td>";
                echo "<td align='center'>" . $row['mesa'] . "</td>";
                echo "<td align='center'>" . $row['telefono'] . "</td>";
                echo "<td align='center'>" . $row['id_pedido'] . "</td>";
                echo "</tr>";
            }

            echo "</table>";

            $registros = mysqli_num_rows($resultado);
            echo "<br>Registros: " . $registros;
            
            mysqli_close($con);
        ?>
    </center>
</body>
</html>
