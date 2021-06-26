<%@ Page Title="Giao Diện Quản Lý" Language="C#" MasterPageFile="~/TrangPhuDe.Master" AutoEventWireup="true" CodeBehind="GiaoDienQuanLy.aspx.cs" Inherits="TINTUCGIAITRI.QuyenTruyCapQuanLyy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
	   body{
             margin:auto;
             text-align:center;
             line-height: 1.6;
            font-family: "UTMAvo";

        }
        .tieude{
            color:#187a1d;
            font-size:30px;
            
            
        }
        .anh{
            width:150px;
            height:150px;
            border: 2px solid #808080;
            border-radius:40%;
        }


 
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br />
            <div style="display:flex">
        <div style="width:50%">
            <b > <a href="QLNhanVien.aspx" style="text-decoration:none;color:#1731ce;font-size:20px;">
        <img src="Picture/NhanVienn.jpg" class="anh"/>
        <br />
        Quản Lý Nhân Viên</a> </b>
	<br />
    <br />
	<b> <a href="QLTaiKhoan.aspx" style="text-decoration:none;color:#ff0000;font-size:20px;">
        <img src="Picture/baoMat.png" class="anh" />
        <br />
        Quản Lý Tài Khoản</a> </b>
	<br />
    <br/>
        </div>

         <div style="width:50%">
             <b > <a href="QLQuangCao.aspx" style="text-decoration:none;color:#f3e115;font-size:20px;">
        <img src="Picture/QuangCao.jpg"  class="anh"/>
        <br />
        Quản Lý Quảng Cáo</a> </b>
	<br />
    <br />
	<b> <a href="BaoCaoThongKe.aspx" style="text-decoration:none;color:#d543d7;font-size:20px;">
        
        <img src="Picture/ThongKe.jpg" class="anh" />
        <br />

        Thông Kê Báo Cáo</a> </b>
        </div>
    </div>
    <br />
    <br />
	
	
	<br />

<br />

       

</asp:Content>
