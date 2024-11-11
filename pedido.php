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
            $resultado = mysqli_query($con, "SELECT * FROM pedido");

            if ($resultado === FALSE) {
                echo "Fallo en la consulta";
                die(mysqli_error($con));
            }

            echo "<center><font face='Arial'>";
            echo "<h1>Pedido</h1>";
            echo "<table border='1'>
                    <tr>
                        <th>id_pedido</th>
                        <th>descripcion</th>
                        <th>id_cliente</th>
                        <th>subtotal</th>
                        <th>iva</th>
                        <th>total</th>
                        <th>id_platillo</th>
                    </tr>";

            while ($row = mysqli_fetch_array($resultado)) {
                echo "<tr>";
                echo "<td align='center'>" . $row['id_pedido'] . "</td>";
                echo "<td align='center'>" . $row['descripcion'] . "</td>";
                echo "<td align='center'>" . $row['id_cliente'] . "</td>";
                echo "<td align='center'>" . $row['subtotal'] . "</td>";
                echo "<td align='center'>" . $row['iva'] . "</td>";
                echo "<td align='center'>" . $row['total'] . "</td>";
                echo "<td align='center'>" . $row['id_platillo'] . "</td>";
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
