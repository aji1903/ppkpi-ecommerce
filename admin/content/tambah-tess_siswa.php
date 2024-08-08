<?php
if (isset($_POST['simpan'])) {
    $nama_lengkap = $_POST['nama_lengkap'];
    $email = $_POST['email'];
    $alamat = ($_POST['alamat']);

    //masukkan ke dalam tabel user (field yang akan di masukkan)
    //values(inputan masing-masing kolom)

    $insert = mysqli_query($koneksi, "INSERT INTO tess_siswa(nama_lengkap, email, alamat) VALUES ('$nama_lengkap','$email','$alamat')");
    if (!$insert) {
        header("location:?pg=tambah-tess_siswa&pesan=tambah-gagal");
    } else {
        header("location:?pg=tess_siswa&pesan=tambah-berhasil");
    }
}
//jika parameter edit ada, maka id = get edit 
if (isset($_GET['edit'])) {
    $id = $_GET['edit'];

    $edit = mysqli_query($koneksi, "SELECT * FROM tess_siswa WHERE id = '$id'");
    $rowEdit = mysqli_fetch_assoc($edit);
}
if (isset($_POST['edit'])) {
    $nama_lengkap = $_POST['nama_lengkap'];
    $email = $_POST['email'];
    $alamat = ($_POST['alamat']);

    $updated = mysqli_query($koneksi, "UPDATE tess_siswa SET nama_lengkap='$nama_lengkap', email='$email',alamat='$alamat' WHERE id='$id'");

    header("location:?pg=tess_siswa&updated=berhasil");
}
?>
<form action="" method="post">
    <div class="mb-3">
        <label for="">Nama</label>
        <input value="<?php echo isset($_GET['edit']) ? $rowEdit['nama_lengkap'] : '' ?>" type="text"
            class="form-control" placeholder="Masukkan Nama Anda" name="nama_lengkap">
    </div>
    <div class="mb-3">
        <label for="">Email</label>
        <input value="<?php echo isset($_GET['edit']) ? $rowEdit['email'] : '' ?>" type="email" class="form-control"
            placeholder="Masukkan Email Anda" name="email">
    </div>
    <div class="mb-3">
        <label for="">Alamat</label>
        <textarea name="alamat" id="" class="form-control"
            placeholder="Masukkan Alamat Anda"><?php echo isset($_GET['edit']) ? $rowEdit['alamat'] : '' ?></textarea>
    </div>
    <div class="mb-3">
        <input type="submit" class="btn btn-primary" value="Simpan"
            name="<?php echo isset($_GET['edit']) ? 'edit' : 'simpan' ?>">
    </div>
</form>