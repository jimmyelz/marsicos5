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
            $resultado = mysqli_query($con, "SELECT * FROM inventario");

            if ($resultado === FALSE) {
                echo "Fallo en la consulta";
                die(mysqli_error($con));
            }

            echo "<center><font face='Arial'>";
            echo "<h1>Inventario</h1>";
            echo "<table border='1'>
                    <tr>
                        <th>id_producto</th>
                        <th>id_proveedor</th>
                        <th>descripcion</th>
                          <th>costo</th>
                            <th>stock</th>
                       
                    </tr>";

            while ($row = mysqli_fetch_array($resultado)) {
                echo "<tr>";
                echo "<td align='center'>" . $row['id_producto'] . "</td>";
                echo "<td align='center'>" . $row['id_proveedor'] . "</td>";
                echo "<td align='center'>" . $row['descripcion'] . "</td>";
                echo "<td align='center'>" . $row['costo'] . "</td>";
                echo "<td align='center'>" . $row['stock'] . "</td>";
               
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
