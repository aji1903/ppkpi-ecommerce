<?php
include 'koneksi/koneksi.php';

function getData($koneksi, $table, $id)
{
    $query = mysqli_query($koneksi, "SELECT * FROM '$table' WHERE id='$id'");
    $data = mysqli_fetch_array($query);

    return $data;
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <h1>TES</h1>
</body>

</html>