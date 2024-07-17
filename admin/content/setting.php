<?php
if (isset($_POST['simpan'])) {
    $email_website = $_POST['email_website'];
    $no_tlp_website = $_POST['no_tlp_website'];
    $alamat_website = $_POST['alamat_website'];
    $instagram_link = $_POST['ig'];
    $twitter_link = $_POST['twitter'];
    $facebook_link = $_POST['fb'];
    $linkedin_link = $_POST['linkedin'];

    $querySetting = mysqli_query($koneksi, "SELECT * FROM setting ORDER BY id DESC");
    if (mysqli_num_rows($querySetting) > 0) {
        //update

    } else {
        //insert
        $insert = mysqli_query($koneksi, "INSERT INTO setting(email_website, no_tlp_website, alamat_website, ig, twitter, fb, linkedin) VALUES ('$email_website', '$no_tlp_website', '$alamat_website', '$instagram_link', '$twitter_link', '$facebook_link', '$linkedin_link')");
    }

    # code...
}

?>
<form action="" method="post" enctype="multipart/form-data">
    <div class="mb-3">
        <label for="">Email Website</label>
        <input type="email" name="email_website" class="form-control" placeholder="Email Website">
    </div>
    <div class="mb-3">
        <label for="">Telpon Website</label>
        <input type="text" name="no_tlp_website" class="form-control" placeholder="Telpon Website">
    </div>
    <div class="mb-3">
        <label for="">Alamat</label>
        <textarea id="" name="alamat_website" class="form-control"></textarea>
    </div>
    <div class="mb-3">
        <label for="">Facebook Link</label>
        <input type="url" name="fb" class="form-control" placeholder="Facebook Link">
    </div>
    <div class="mb-3">
        <label for="">Instagram Link</label>
        <input type="text" name="ig" class="form-control" placeholder="Instagram Link">
    </div>
    <div class="mb-3">
        <label for="">Twitter Link</label>
        <input type="url" name="twitter" class="form-control" placeholder="Twitter Link">
    </div>
    <div class="mb-3">
        <label for="">Linkedin</label>
        <input type="text" name="linkedin" class="form-control" placeholder="Linkedin Link">
    </div>
    <div class="mb-3">
        <label for="">Logo</label>
        <input type="file" name="logo">
    </div>
    <div class="mb-3">
        <input type="submit" class="btn btn-primary" name="simpan" value="Simpan">
    </div>


</form>