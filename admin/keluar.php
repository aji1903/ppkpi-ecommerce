<?php
session_start();
session_destroy(); //berfungsi untuk menghapus sesi
header("location:login.php");