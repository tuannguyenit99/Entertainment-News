<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangKyKhachHang.aspx.cs" Inherits="TINTUCGIAITRI.DangKyKhachHang" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
       
    </title>
     <style>
         body{
               background-image:url("Picture/bia1.jpg")
         }
        .dn{
            text-align:center;
             width:600px;
             height:500px;
             background-color:none;
             margin-left:400px;
             margin-top:100px;
             margin-bottom:200px;
        }
        h1{
            color:#0094ff;
        }
            </style>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <form id="form1" runat="server">
     <div class="dn">
            <br />
            <h1>Đăng Ký</h1>
            <br />
             Tài Khoản&nbsp;&nbsp;  <asp:TextBox ID="Txttaikhoan" runat="server"></asp:TextBox>
            <br />
            <br />
             Mât Khẩu &nbsp;&nbsp;<asp:TextBox ID="Txtpass" runat="server" TextMode="Password"></asp:TextBox>
            <br />
          <br />
          N Lại Mk &nbsp;&nbsp;<asp:TextBox ID="txtrepass" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input id="Checkbox1" type="checkbox" onchange="document.getElementById('Txtpass').type=this.checked ?'Text' :'Password';document.getElementById('txtrepass').type=this.checked ?'Text' :'Password'"  /> Hiển thị mật khẩu
            <br />
            <br />
             <asp:Button ID="BtDangnhap" runat="server" Text="Đăng Ký" BackColor="#3366FF" ForeColor="White" OnClick="BtDangnhap_Click"  />  <a href="DangNhap.aspx" style="text-decoration:none;margin-left:20px"> Quay Về Đăng Nhập</a>
            <br />
    
           
            <br />
            <br />
            <asp:Label ID="Tb" runat="server" Text="" ForeColor="Red"></asp:Label>
         <br />
          <asp:Label ID="TB2" runat="server" Text="" ForeColor="Blue"></asp:Label>
    
    
           
        </div>
    </form>
</body>
</html>
