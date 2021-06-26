<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="DangBaiNguoiDung.aspx.cs" Inherits="TINTUCGIAITRI.DangBaiNguoiDung" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET"  TagPrefix="CKEditor" %>
<%@ Register Assembly="CKFinder" Namespace="CKFinder"  TagPrefix="CKFinder" %>
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
        .hihi{
             margin:auto;
        }
         .Them {
              margin:auto;
              width:1000px;
         }
         .Themm{
             font-size:25px;
            
             text-decoration:none;
           
            border-radius:30%;

         }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Gửi Bài</h2>
     <hr />
            <asp:FormView ID="FormView1" runat="server" DefaultMode="Insert" CssClass="Them" DataKeyNames="IDBangTin" DataSourceID="SqlDataSource1" Height="661px" Width="901px" OnItemInserting="FormView1_ItemInserting">
                <EditItemTemplate>
                    IDBangTin:
                    <asp:Label ID="IDBangTinLabel1" runat="server" Text='<%# Eval("IDBangTin") %>' />
                    <br />
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
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <b>Tiêu đề&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
                    <asp:TextBox ID="TieuDeTextBox" runat="server" Text='<%# Bind("TieuDe") %>' />
                    <br />
                    <br />
                   <b> Ảnh:</b>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <br />
                  
                    <asp:TextBox ID="NgayDangTextBox" runat="server" Text='<%# Bind("NgayDang") %>' Enabled="false"  Visible="false"/>
                    <br />
                    <br />
                   <b>Nội Dung</b> <br />&nbsp;
                    <CKEditor:CKEditorControl  ID="CKEditorControl1" runat="server" Text='<%# Bind("NoiDungChiTiet") %>' >

                        

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    </CKEditor:CKEditorControl>
                    
                   
                    
                    <asp:TextBox ID="LanXemTextBox" runat="server" Text='<%# Bind("LanXem") %>' Enabled="false"  Visible="false" />
                    

                
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="Ten" DataValueField="IDNV" SelectedValue='<%# Bind("idnv") %>' Width="154px" Visible="false">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="SELECT * FROM [NhanVien] WHERE ([IDNV] = @IDNV)">
                        <SelectParameters>
                            <asp:SessionParameter Name="IDNV" SessionField="idnv" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <b> Loại:</b>&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="TheLoai" DataValueField="IDTheLoai" SelectedValue='<%# Bind("IDTheLoai") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="SELECT * FROM [TheLoai]"></asp:SqlDataSource>
                    <br />

                    <br />
                   &nbsp;<asp:TextBox ID="TrangThaiTextBox" runat="server" Text='<%# Bind("TrangThai") %>' Visible="false" />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Thêm" CssClass="Themm"  />
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
                   
                    <asp:Label ID="IDNVLabel" runat="server" Text='<%# Bind("IDNV") %>' Visible="false"/>
                    <br />
                    IDTheLoai:
                    <asp:Label ID="IDTheLoaiLabel" runat="server" Text='<%# Bind("IDTheLoai") %>' />
                    <br />
                    TrangThai:
                    <asp:Label ID="TrangThaiLabel" runat="server" Text='<%# Bind("TrangThai") %>'  Visible="false"/>
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>

            </asp:FormView>
            <hr />
<br />
    <br />
    <h2>Bài Chờ Duyệt</h2>
        <br />
     <asp:GridView ID="GridView1" runat="server" CssClass="Them" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IDBangTin" DataSourceID="SqlDataSource1" >
                <Columns>
                  
<asp:BoundField DataField="IDBangTin" HeaderText="ID Bảng Tin" InsertVisible="False" ReadOnly="True" SortExpression="IDBangTin" />
                    <asp:BoundField DataField="TieuDe" HeaderText="Tiêu Đề" SortExpression="TieuDe" />
                   <asp:TemplateField HeaderText="Ảnh" SortExpression="Anh">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Anh") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                   <asp:Image ID="Anh" runat="server" ImageUrl='<%#"~/Picture/"+Eval("anh") %>' Width="200px" Height="200px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NgayDang" HeaderText="Ngày" SortExpression="NgayDang" />
                    <asp:BoundField DataField="NoiDungChiTiet" HeaderText="Nội Dung" SortExpression="NoiDungChiTiet" />
                    <asp:BoundField DataField="LanXem" HeaderText="Lần Xem" SortExpression="LanXem" />
                    <asp:BoundField DataField="IDNV" HeaderText="ID NV" SortExpression="IDNV" />
                    <asp:BoundField DataField="IDTheLoai" HeaderText="ID Thể Loại" SortExpression="IDTheLoai" />
                    
                    <asp:BoundField DataField="TrangThai" HeaderText="Trạng Thái" SortExpression="TrangThai" />
                    <asp:TemplateField ShowHeader="False" HeaderText="Xóa">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Xóa" OnClientClick="return confirm('Bạn sẽ xóa tin này')"  CommandArgument='<%# Bind("IDBangTin") %>' OnCommand="Delete"> </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
               <asp:HyperLinkField DataNavigateUrlFields="IDBangTin" DataNavigateUrlFormatString="EditPostFeedBacks.aspx?IDBangTin={0}" Text="Sửa" HeaderText="Sửa" />

                </Columns>


            </asp:GridView>
   
	         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" DeleteCommand="DELETE FROM [ChiTiet] WHERE [IDBangTin] = @original_IDBangTin AND (([TieuDe] = @original_TieuDe) OR ([TieuDe] IS NULL AND @original_TieuDe IS NULL)) AND (([Anh] = @original_Anh) OR ([Anh] IS NULL AND @original_Anh IS NULL)) AND (([NgayDang] = @original_NgayDang) OR ([NgayDang] IS NULL AND @original_NgayDang IS NULL)) AND (([NoiDungChiTiet] = @original_NoiDungChiTiet) OR ([NoiDungChiTiet] IS NULL AND @original_NoiDungChiTiet IS NULL)) AND (([LanXem] = @original_LanXem) OR ([LanXem] IS NULL AND @original_LanXem IS NULL)) AND [IDNV] = @original_IDNV AND [IDTheLoai] = @original_IDTheLoai AND (([TrangThai] = @original_TrangThai) OR ([TrangThai] IS NULL AND @original_TrangThai IS NULL))" InsertCommand="INSERT INTO [ChiTiet] ([TieuDe], [Anh], [NgayDang], [NoiDungChiTiet], [LanXem], [IDNV], [IDTheLoai], [TrangThai]) VALUES (@TieuDe, @Anh, @NgayDang, @NoiDungChiTiet, @LanXem, @IDNV, @IDTheLoai, @TrangThai)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT IDBangTin, TieuDe, Anh, NgayDang, NoiDungChiTiet, LanXem, IDNV, IDTheLoai, TrangThai FROM ChiTiet WHERE (TrangThai IS NULL) AND (IDNV = @idnv)" UpdateCommand="UPDATE [ChiTiet] SET [TieuDe] = @TieuDe, [Anh] = @Anh, [NgayDang] = @NgayDang, [NoiDungChiTiet] = @NoiDungChiTiet, [LanXem] = @LanXem, [IDNV] = @IDNV, [IDTheLoai] = @IDTheLoai, [TrangThai] = @TrangThai WHERE [IDBangTin] = @original_IDBangTin AND (([TieuDe] = @original_TieuDe) OR ([TieuDe] IS NULL AND @original_TieuDe IS NULL)) AND (([Anh] = @original_Anh) OR ([Anh] IS NULL AND @original_Anh IS NULL)) AND (([NgayDang] = @original_NgayDang) OR ([NgayDang] IS NULL AND @original_NgayDang IS NULL)) AND (([NoiDungChiTiet] = @original_NoiDungChiTiet) OR ([NoiDungChiTiet] IS NULL AND @original_NoiDungChiTiet IS NULL)) AND (([LanXem] = @original_LanXem) OR ([LanXem] IS NULL AND @original_LanXem IS NULL)) AND [IDNV] = @original_IDNV AND [IDTheLoai] = @original_IDTheLoai AND (([TrangThai] = @original_TrangThai) OR ([TrangThai] IS NULL AND @original_TrangThai IS NULL))">
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
                     <asp:SessionParameter Name="idnv" SessionField="idnv" />
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



</asp:Content>
