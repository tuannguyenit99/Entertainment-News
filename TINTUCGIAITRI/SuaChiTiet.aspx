<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuaChiTiet.aspx.cs" Inherits="TINTUCGIAITRI.SuaChiTiet" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET"  TagPrefix="CKEditor" %>
<%@ Register Assembly="CKFinder" Namespace="CKFinder"  TagPrefix="CKFinder" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sửa Tin</title>
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
        .hihi{
            margin:auto;
        }
         .Them {
             margin:auto;
         }
     </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
          <div style="display:flex">
                <div style="width:10%">
                    <a href="GiaoDienNhanVien.aspx" style="text-align:left;font-size:18px; color:blue; text-decoration:none"> Quay lại</a>

                </div>
                 <div style="width:60%">

                </div>
                 <div style="width:30%">
                               <a href="DangNhap.aspx" style="text-decoration:none">Đăng Xuất</a>&nbsp;&nbsp;<img  src="Picture/taikhoann.PNG"  width="20" height="20" style="border-radius:50%"/> <asp:Label ID="QL" runat="server" Text="" CssClass="tkk"></asp:Label>

                </div>
            </div>
            <p class="tieude">Sửa Tin</p>
            
            <asp:FormView ID="FormView1" runat="server" DefaultMode="Edit" DataKeyNames="IDBangTin" DataSourceID="SqlDataSource1" CssClass="Them">
                <EditItemTemplate>
                    IDBangTin:
                    <asp:Label ID="IDBangTinLabel1" runat="server" Text='<%# Eval("IDBangTin") %>' />
                    <br />
                    <br />
                    Tiêu Đề:
                    <asp:TextBox ID="TieuDeTextBox" runat="server" Text='<%# Bind("TieuDe") %>' />
                    <br />
                    <br />
                    Ảnh:<asp:Image ID="Anh" runat="server" Height="300px" ImageUrl='<%#"~/Picture/"+Eval("anh") %>' Width="300px"   />
                 &nbsp;<br />
                    <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Lưu Ảnh</asp:LinkButton>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("anh") %>'></asp:Label>
                    <br />
                    <br />
                    Ngày Đăng:
                    <asp:TextBox ID="NgayDangTextBox" runat="server" Text='<%# Bind("NgayDang") %>' />
                    <br />
                    <br />
                    Nội Dung:
                    <CKEditor:CKEditorControl  ID="CKEditorControl1" runat="server" Text='<%# Bind("NoiDungChiTiet") %>' Height="278px" Width="618px" ></CKEditor:CKEditorControl>
                    
                    <br />
                    <br />
                    Lượt Xem:
                    <asp:TextBox ID="LanXemTextBox" runat="server" Text='<%# Bind("LanXem") %>'  Enabled="false"/>
                    <br />
                    <br />
                     IDNV:
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Ten" DataValueField="IDNV" SelectedValue='<%# Bind("IDNV") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="SELECT * FROM [NhanVien]"></asp:SqlDataSource>
                    <br />
                    <br />
                    Thể Loại:&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="TheLoai" DataValueField="IDTheLoai" SelectedValue='<%# Bind("IDTheLoai") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="SELECT * FROM [TheLoai]"></asp:SqlDataSource>
                    <br />

                    <br />
                    Trạng Thái:&nbsp;<asp:TextBox ID="TrangThaiTextBox" runat="server" Text='<%# Bind("TrangThai") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <InsertItemTemplate>
                    TieuDe:
                    <asp:TextBox ID="TieuDeTextBox" runat="server" Text='<%# Bind("TieuDe") %>' />
                    <br />
                    Anh:
                    <asp:TextBox ID="AnhTextBox" runat="server" Text='<%# Bind("Anh") %>' />
                    <br />
                    NgayDang:
                    <asp:TextBox ID="NgayDangTextBox" runat="server" Text='<%# Bind("NgayDang") %>' />
                    <br />
                    NoiDungChiTiet:
                    <asp:TextBox ID="NoiDungChiTietTextBox" runat="server" Text='<%# Bind("NoiDungChiTiet") %>' />
                    <br />
                    LanXem:
                    <asp:TextBox ID="LanXemTextBox" runat="server" Text='<%# Bind("LanXem") %>' />
                    <br />
                    IDNV:
                    <asp:TextBox ID="IDNVTextBox" runat="server" Text='<%# Bind("IDNV") %>' />
                    <br />
                    IDTheLoai:
                    <asp:TextBox ID="IDTheLoaiTextBox" runat="server" Text='<%# Bind("IDTheLoai") %>' />
                    <br />
                    TrangThai:
                    <asp:TextBox ID="TrangThaiTextBox" runat="server" Text='<%# Bind("TrangThai") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    IDBangTin:
                    <asp:Label ID="IDBangTinLabel" runat="server" Text='<%# Eval("IDBangTin") %>' />
                    <br />
                    TieuDe:
                    <asp:Label ID="TieuDeLabel" runat="server" Text='<%# Bind("TieuDe") %>' />
                    <br />
                    Anh:
                    <asp:Label ID="AnhLabel" runat="server" Text='<%# Bind("Anh") %>' />
                    <br />
                    NgayDang:
                    <asp:Label ID="NgayDangLabel" runat="server" Text='<%# Bind("NgayDang") %>' />
                    <br />
                    NoiDungChiTiet:
                    <asp:Label ID="NoiDungChiTietLabel" runat="server" Text='<%# Bind("NoiDungChiTiet") %>' />
                    <br />
                    LanXem:
                    <asp:Label ID="LanXemLabel" runat="server" Text='<%# Bind("LanXem") %>' />
                    <br />
                    IDNV:
                    <asp:Label ID="IDNVLabel" runat="server" Text='<%# Bind("IDNV") %>' />
                    <br />
                    IDTheLoai:
                    <asp:Label ID="IDTheLoaiLabel" runat="server" Text='<%# Bind("IDTheLoai") %>' />
                    <br />

                    TrangThai:
                    <asp:Label ID="TrangThaiLabel" runat="server" Text='<%# Bind("TrangThai") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />

                </ItemTemplate>

            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" DeleteCommand="DELETE FROM [ChiTiet] WHERE [IDBangTin] = @original_IDBangTin AND (([TieuDe] = @original_TieuDe) OR ([TieuDe] IS NULL AND @original_TieuDe IS NULL)) AND (([Anh] = @original_Anh) OR ([Anh] IS NULL AND @original_Anh IS NULL)) AND (([NgayDang] = @original_NgayDang) OR ([NgayDang] IS NULL AND @original_NgayDang IS NULL)) AND (([NoiDungChiTiet] = @original_NoiDungChiTiet) OR ([NoiDungChiTiet] IS NULL AND @original_NoiDungChiTiet IS NULL)) AND (([LanXem] = @original_LanXem) OR ([LanXem] IS NULL AND @original_LanXem IS NULL)) AND [IDNV] = @original_IDNV AND [IDTheLoai] = @original_IDTheLoai AND (([TrangThai] = @original_TrangThai) OR ([TrangThai] IS NULL AND @original_TrangThai IS NULL))" InsertCommand="INSERT INTO [ChiTiet] ([TieuDe], [Anh], [NgayDang], [NoiDungChiTiet], [LanXem], [IDNV], [IDTheLoai], [TrangThai]) VALUES (@TieuDe, @Anh, @NgayDang, @NoiDungChiTiet, @LanXem, @IDNV, @IDTheLoai, @TrangThai)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ChiTiet] where IDBangTin=@IDBangTin" UpdateCommand="UPDATE [ChiTiet] SET [TieuDe] = @TieuDe, [Anh] = @Anh, [NgayDang] = @NgayDang, [NoiDungChiTiet] = @NoiDungChiTiet, [LanXem] = @LanXem, [IDNV] = @IDNV, [IDTheLoai] = @IDTheLoai, [TrangThai] = @TrangThai WHERE [IDBangTin] = @original_IDBangTin AND (([TieuDe] = @original_TieuDe) OR ([TieuDe] IS NULL AND @original_TieuDe IS NULL)) AND (([Anh] = @original_Anh) OR ([Anh] IS NULL AND @original_Anh IS NULL)) AND (([NgayDang] = @original_NgayDang) OR ([NgayDang] IS NULL AND @original_NgayDang IS NULL)) AND (([NoiDungChiTiet] = @original_NoiDungChiTiet) OR ([NoiDungChiTiet] IS NULL AND @original_NoiDungChiTiet IS NULL)) AND (([LanXem] = @original_LanXem) OR ([LanXem] IS NULL AND @original_LanXem IS NULL)) AND [IDNV] = @original_IDNV AND [IDTheLoai] = @original_IDTheLoai AND (([TrangThai] = @original_TrangThai) OR ([TrangThai] IS NULL AND @original_TrangThai IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_IDBangTin" Type="Int32" />
                    <asp:Parameter Name="original_TieuDe" Type="String" />
                    <asp:Parameter Name="original_Anh" Type="String" />
                    <asp:Parameter DbType="Date" Name="original_NgayDang" />
                    <asp:Parameter Name="original_NoiDungChiTiet" Type="String" />
                    <asp:Parameter Name="original_LanXem" Type="Int32" />
                    <asp:Parameter Name="original_IDNV" Type="Int32" />
                    <asp:Parameter Name="original_IDTheLoai" Type="Int32" />
                    <asp:Parameter Name="original_TrangThai" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TieuDe" Type="String" />
                    <asp:Parameter Name="Anh" Type="String" />
                    <asp:Parameter DbType="Date" Name="NgayDang" />
                    <asp:Parameter Name="NoiDungChiTiet" Type="String" />
                    <asp:Parameter Name="LanXem" Type="Int32" />
                    <asp:Parameter Name="IDNV" Type="Int32" />
                    <asp:Parameter Name="IDTheLoai" Type="Int32" />
                    <asp:Parameter Name="TrangThai" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="IDBangTin" QueryStringField="IDBangTin" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TieuDe" Type="String" />
                    <asp:Parameter Name="Anh" Type="String" />
                    <asp:Parameter DbType="Date" Name="NgayDang" />
                    <asp:Parameter Name="NoiDungChiTiet" Type="String" />
                    <asp:Parameter Name="LanXem" Type="Int32" />
                    <asp:Parameter Name="IDNV" Type="Int32" />
                    <asp:Parameter Name="IDTheLoai" Type="Int32" />
                    <asp:Parameter Name="TrangThai" Type="Int32" />
                    <asp:Parameter Name="original_IDBangTin" Type="Int32" />
                    <asp:Parameter Name="original_TieuDe" Type="String" />
                    <asp:Parameter Name="original_Anh" Type="String" />
                    <asp:Parameter DbType="Date" Name="original_NgayDang" />
                    <asp:Parameter Name="original_NoiDungChiTiet" Type="String" />
                    <asp:Parameter Name="original_LanXem" Type="Int32" />
                    <asp:Parameter Name="original_IDNV" Type="Int32" />
                    <asp:Parameter Name="original_IDTheLoai" Type="Int32" />
                    <asp:Parameter Name="original_TrangThai" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <hr />
        </div>
    </form>
</body>
</html>
