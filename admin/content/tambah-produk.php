<?php
if (isset($_POST['simpan'])) {
    // $_FILES=digunkan untuk menambahkan foto /file
    $nama_barang = $_POST['nama_barang'];
    $harga = $_POST['harga'];
    $foto = $_FILES['foto']['name'];
    $size = $_FILES['foto']['size'];
    //pathinfo= untuk mengambil atau GET extensi
    $ekstensi = array('png', 'jpg', 'jpeg');
    $ext = pathinfo($foto, PATHINFO_EXTENSION);

    if (!in_array($ext, $ekstensi)) {
        echo "Mohon Maaf ektensi tidak terdaftar";
    } else {
        move_uploaded_file($_FILES['foto']['tmp_name'], 'upload/' . $foto);

        $insert = mysqli_query($koneksi, "INSERT INTO barang(nama_barang, harga, foto) VALUES ('$nama_barang','$harga','$foto')");
        if (!$insert) {
            header("location:?pg=tambah-produk&pesan=tambah-gagal");
        } else {
            header("location:?pg=produk&pesan=tambah-berhasil");
        }
    }
}


//jika parameter edit ada, maka id = get edit 
if (isset($_GET['edit'])) {
    $id = $_GET['edit'];

    $edit = mysqli_query($koneksi, "SELECT * FROM barang WHERE id = '$id'");
    $rowEdit = mysqli_fetch_assoc($edit);
}
if (isset($_POST['edit'])) {
    $nama_barang = $_POST['nama_barang'];
    $harga = $_POST['harga'];
    $foto = $_FILES['foto']['name'];
    $size = $_FILES['foto']['size'];
    //pathinfo= untuk mengambil atau GET extensi
    $ekstensi = array('png', 'jpg', 'jpeg');
    $ext = pathinfo($foto, PATHINFO_EXTENSION);

    if (!in_array($ext, $ekstensi)) {
        echo "Mohon Maaf ektensi tidak terdaftar";
    } else {
        unlink("upload/" . $rowEdit['foto']);
        move_uploaded_file($_FILES['foto']['tmp_name'], 'upload/' . $foto);
        $updated = mysqli_query($koneksi, "UPDATE barang SET nama_barang='$nama_barang', harga='$harga',foto='$foto' WHERE id='$id'");

        header("location:?pg=produk&updated=berhasil");
    }
}

?>
<!-- encodingtype= digunakan dalam elemn form untuk menambahkan file gambar atau foto-->
<!-- required=berfungsi untuk memberikan alrt pada tiap form kosong yang belum disi -->
<form action="" method="post" enctype="multipart/form-data">
    <div class="mb-3">
        <label for="">Nama Produk</label>
        <input value="<?php echo isset($_GET['edit']) ? $rowEdit['nama_barang'] : '' ?>" type="text"
            class="form-control" placeholder="Masukkan Nama Produk" name="nama_barang">
    </div>
    <div class="mb-3">
        <label for="">Harga</label>
        <input value="<?php echo isset($_GET['edit']) ? $rowEdit['harga'] : '' ?>" type="number" class="form-control"
            placeholder="Masukkan Nominal Harga" name="harga">
    </div>
    <div class="mb-3">
        <label for="">Foto</label>
        <input value="" type="file" name="foto" required>
    </div>
    <div class="mb-3">
        <input type="submit" class="btn btn-primary" value="Simpan"
            name="<?php echo isset($_GET['edit']) ? 'edit' : 'simpan' ?>">
    </div>
</form>