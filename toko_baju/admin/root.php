<?php 
Class bigdata
{
	
	function __construct()
	{
		mysqli_connect("localhost","root","","tokobaju");
	
	}
	function login($username,$password){
		$query=mysqli_query(mysqli_connect("localhost","root","","tokobaju"),"select * from admin where username='$username' and password='$password'");
		$check=mysqli_num_rows($query);
		if ($check > 0) {
			$data=mysqli_fetch_array($query);
			session_start();
			$_SESSION['id']=$data['id'];
			$_SESSION['nama']=$data['nama'];
			$_SESSION['username']=$data['username'];
			header("location:home.php");
		}
		else{
			?>
			<script type="text/javascript">
				alert("Login gagal, username atau password salah");
				window.location.href="login.php";
			</script>
			<?php
		}
	}
	function tampil_customer(){
		$query=mysqli_query(mysqli_connect("localhost","root","","tokobaju"),"select * from customer");
		while ($data=mysqli_fetch_array($query)) {
			?>
			<tr>
				<td><?php echo $data['nama'] ?></td>
				<td><?php echo $data['alamat'] ?></td>
				<td><?php echo $data['username'] ?></td>
				<td><?php echo $data['password'] ?></td>
				<td><a class="b" href="hand.php?act=hapus_cust&id=<?php echo $data['id'] ?>">Hapus</a></td>
			</tr>
			<?php
		}
	}
	function tampil_kategori(){
		$query=mysqli_query(mysqli_connect("localhost","root","","tokobaju"),"select * from kategori");
		while ($data=mysqli_fetch_array($query)) {
			?>
			<tr>
				<td><?php echo $data['nama_kategori'] ?></td>
				<td><a class="b" href="hand.php?act=hapus_cat&id=<?php echo $data['id'] ?>">Hapus</a></td>
			</tr>
			<?php
		}
	}
	function hapus_cust($id){
		$query=mysqli_query("delete from customer where id='$id'");
		if ($query) {
			?>
			<script type="text/javascript">
				alert("data berhasil dihapus");
				window.location.href="customer.php";
			</script>
			<?php
		}else{

			?>
			<script type="text/javascript">
				alert("data gagal dihapus");
				window.location.href="customer.php";
			</script>
			<?php
		}
	}
	function tambah_cat($nama_cat){
		$query=mysqli_query("insert into kategori set nama_kategori='$nama_cat'");
		if ($query) {
			?>
			<script type="text/javascript">
				alert("data berhasil ditambahkan");
				window.location.href="kategori.php";
			</script>
			<?php
		}else{

			?>
			<script type="text/javascript">
				alert("data gagal ditambahkan");
				window.location.href="kategori.php";
			</script>
			<?php
		}

	}
	function tampil_kategori1(){
		$query=mysqli_query("select * from kategori");
		while ($data=mysqli_fetch_array($query)) {
			?><option value="<?php echo $data['id'] ?>"><?php echo $data['nama_kategori'] ?></option>
			<?php
		}
	}
	function tambah_barang($nama_barang,$qty,$harga,$ket,$namagambar,$tmpgambar,$type_foto,$kategori){
		if ($type_foto!="image/jpeg"&&$type_foto!="image/jpg"&&$type_foto!="image/png"&&$type_foto!="image/gif") {
					?>
		            <script type="text/javascript">
		            alert( "Gunakan file yang benar");
		            window.location.href="barang.php";
		            </script>
		            <?php
		}else{
			$destination="gambar/$namagambar";
			move_uploaded_file($tmpgambar, $destination);
            $query=mysqli_query(mysqli_connect("localhost","root","","tokobaju"),"insert into barang set nama_barang='$nama_barang',qty='$qty',harga='$harga',keterangan='$ket',gambar='$destination',kategori=$kategori");
            if ($query) {
					?>
		            <script type="text/javascript">
		            alert( "Barang Berhasil Ditambahkan");
		            window.location.href="barang.php";
		            </script>
		            <?php
            }else{
            		echo mysqli_error(mysqli_connect("localhost","root","","tokobaju"));
            }               

		}
	}
	function simpan_edit_barang($id,$nama_barang,$qty,$harga,$ket,$namagambar,$tmpgambar,$type_foto,$kategori){
		if ($type_foto!="image/jpeg"&&$type_foto!="image/jpg"&&$type_foto!="image/png"&&$type_foto!="image/gif") {
					?>
		            <script type="text/javascript">
		            alert( "Gunakan file yang benar");
		            window.location.href="barang.php";
		            </script>
		            <?php
		}else{
			$destination="gambar/$namagambar";
			move_uploaded_file($tmpgambar, $destination);
            $query=mysqli_query(mysqli_connect("localhost","root","","tokobaju"),"update barang set nama_barang='$nama_barang',qty='$qty',harga='$harga',keterangan='$ket',gambar='$destination',kategori=$kategori where id='$id'");
            if ($query) {
					?>
		            <script type="text/javascript">
		            alert( "Barang Berhasil Disimpan");
		            window.location.href="barang.php";
		            </script>
		            <?php
            }else{
            	
            		echo mysqli_error(mysqli_connect("localhost","root","","tokobaju"));
            }               

		}
	}
	function tampil_barang(){
		$query=mysqli_query(mysqli_connect("localhost","root","","tokobaju"),"select * from barang order by id DESC");
		$no=1;
		while ($data=mysqli_fetch_array($query)) {
			?>
			<tr>
				<td><?= $no ?></td>
				<td><img src="<?php echo $data['gambar'] ?>"></td>
				<td><?php echo $data['nama_barang'] ?></td>
				<td><?php echo $data['qty'] ?></td>
				<td><?php echo $data['harga'] ?></td>
				<td><?php echo $data['keterangan'] ?></td>
				<td><a class="a" href="edit_barang.php?id=<?php echo $data['id'] ?>">edit</a> <a class="b" href="hand.php?act=hapus_barang&id=<?php echo $data['id'] ?>">Hapus</a></td>
			</tr>
			<?php
			$no++;
		}
	}
	function hapus_barang($id){
		$query=mysqli_query("delete from barang where id='$id'");
            if ($query) {
					?>
		            <script type="text/javascript">
		            alert( "Barang Berhasil Dihapus");
		            window.location.href="barang.php";
		            </script>
		            <?php
            }else{
            		echo mysqli_error();
            }
	}
	function hapus_cat($id){
		$query=mysqli_query(mysqli_connect("localhost","root","","tokobaju"),"delete from kategori where id='$id'");
            if ($query) {
					?>
		            <script type="text/javascript">
		            alert( "Kategori Berhasil Dihapus");
		            window.location.href="kategori.php";
		            </script>
		            <?php
            }else{
            		echo mysqli_error();
            }  
	}
}
$data=new bigdata();
 ?>