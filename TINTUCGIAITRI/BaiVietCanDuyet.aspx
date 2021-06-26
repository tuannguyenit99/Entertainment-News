<%@ Page Title="" Language="C#" MasterPageFile="~/TrangNhanVien.Master" AutoEventWireup="true" CodeBehind="BaiVietCanDuyet.aspx.cs" Inherits="TINTUCGIAITRI.BaiVietCanDuyet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        body{
                
                  text-align:center;
                  margin:auto;
        }
        .them{
            margin:auto;
            width:1000px;
        }
         .tieude{
            color:#187a1d;
            font-size:30px;
            
            
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />

    <p class="tieude">Bài Viết Cần Duyệt</p>
    <br />
    <br />
    <hr />
    <br />
    <asp:GridView ID="GridView1" runat="server" CssClass="them" AutoGenerateColumns="False" DataKeyNames="IDBangTin" DataSourceID="SqlDataSource1" >
        <Columns>
            <asp:BoundField DataField="IDBangTin" HeaderText="ID Bảng Tin" InsertVisible="False" ReadOnly="True" SortExpression="IDBangTin" />
            <asp:BoundField DataField="TieuDe" HeaderText="Tiều Đề" SortExpression="TieuDe" />
            <asp:TemplateField HeaderText="Ảnh" SortExpression="Anh">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Anh") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                      <asp:Image ID="Anh" runat="server" ImageUrl='<%#"~/Picture/"+Eval("anh") %>' Width="200px" Height="200px" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="NgayDang" HeaderText="Ngày Đăng" SortExpression="NgayDang" />
            <asp:BoundField DataField="NoiDungChiTiet" HeaderText="Nội Dung" SortExpression="NoiDungChiTiet" />
            <asp:BoundField DataField="LanXem" HeaderText="Lượt Xem" SortExpression="LanXem" />
            <asp:BoundField DataField="IDNV" HeaderText="ID Tác Giả" SortExpression="IDNV" />
            <asp:BoundField DataField="IDTheLoai" HeaderText="ID Thể Loại" SortExpression="IDTheLoai" />
         
          

         

            <asp:TemplateField ShowHeader="False" HeaderText="Duyệt">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false"  OnCommand="Delete"  CommandName="Duyet" Text="Duyệt" OnClientClick="return confirm('Bạn muốn duyệt bài viết này!')"  CommandArgument='<%# Bind("IDBangTin") %>'>

                    </asp:LinkButton>
                </ItemTemplate>
                <ItemStyle BackColor="White" Font-Size="Large" />
            </asp:TemplateField>

              <asp:HyperLinkField DataNavigateUrlFields="IDBangTin"   DataNavigateUrlFormatString="SendFeedBacks.aspx?IDBangTin={0}" Text=" Gửi Phản Hồi" HeaderText="Gửi Phản Hồi" />


        </Columns>

    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="SELECT * FROM [ChiTiet] where trangthai is null"></asp:SqlDataSource>
    <br />

    <hr />
</asp:Content>
