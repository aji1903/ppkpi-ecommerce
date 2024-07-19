<?php
if (!isset($_SESSION['id_member'])) {
    header('location:?pg=member&message=Register-Dulu');
} else {
    $id_member = $_SESSION['id_member'];
    $id_produk=$_POST['id_produk'];
    $queryCart= mysqli_query($koneksi,"SELECT id_produk, qty FROM detail WHERE id_produk ='$id_produk'");
    while($rowCart=mysqli_fetch_assoc($queryCart)){

    }
//     $penjualan = mysqli_query($koneksi, "INSERT INTO penjualan (id_member,status) VALUES ('$id_member',0)");

//     if($penjualan){
//         $id_penjualan = mysqli_insert_id($koneksi);
//     }
// }
?>