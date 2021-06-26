<%@ Page Title="QL Nhân Viên" Language="C#" MasterPageFile="~/TrangPhuDe.Master" AutoEventWireup="true" CodeBehind="QLNhanVien.aspx.cs" Inherits="TINTUCGIAITRI.QLNhanVienn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
                
                  text-align:center;
                  margin:auto;
        }
        .them{
            margin:auto;
        }
         .tieude{
            color:#187a1d;
            font-size:30px;
            
            
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <a href="GiaoDienQuanLy.aspx" style="text-align:left;font-size:18px; color:blue; text-decoration:none"> Quay lại</a>
     <h2>Chi Tiết Nhân Viên</h2>

            <asp:GridView ID="GridView1" runat="server" CssClass="them" AutoGenerateColumns="False" DataKeyNames="IDNV" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="IDNV" HeaderText="IDNV" InsertVisible="False" ReadOnly="True" SortExpression="IDNV" />
                    <asp:BoundField DataField="Ten" HeaderText="Họ Tên" SortExpression="Ten" />
                    <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ" SortExpression="DiaChi" />
                    <asp:BoundField DataField="DienThoai" HeaderText="Điện Thoại" SortExpression="DienThoai" />
                    <asp:BoundField DataField="GioiTinh" HeaderText="Giới Tính" SortExpression="GioiTinh" />
                    <asp:BoundField DataField="NgaySinh" HeaderText="Ngày Sinh" SortExpression="NgaySinh" />
                    <asp:TemplateField HeaderText="Chức Năng" ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Hủy"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Sửa"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Xóa"  CommandArgument='<%# Bind("IDNV") %>' OnCommand="Delete" OnClientClick="return confirm('Bạn sẽ xóa nhân viên này!')"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" DeleteCommand="DELETE FROM [NhanVien] WHERE [IDNV] = @original_IDNV AND (([Ten] = @original_Ten) OR ([Ten] IS NULL AND @original_Ten IS NULL)) AND (([DiaChi] = @original_DiaChi) OR ([DiaChi] IS NULL AND @original_DiaChi IS NULL)) AND (([DienThoai] = @original_DienThoai) OR ([DienThoai] IS NULL AND @original_DienThoai IS NULL)) AND (([GioiTinh] = @original_GioiTinh) OR ([GioiTinh] IS NULL AND @original_GioiTinh IS NULL)) AND (([NgaySinh] = @original_NgaySinh) OR ([NgaySinh] IS NULL AND @original_NgaySinh IS NULL))" InsertCommand="INSERT INTO [NhanVien] ([Ten], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (@Ten, @DiaChi, @DienThoai, @GioiTinh, @NgaySinh)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [NhanVien]" UpdateCommand="UPDATE [NhanVien] SET [Ten] = @Ten, [DiaChi] = @DiaChi, [DienThoai] = @DienThoai, [GioiTinh] = @GioiTinh, [NgaySinh] = @NgaySinh WHERE [IDNV] = @original_IDNV AND (([Ten] = @original_Ten) OR ([Ten] IS NULL AND @original_Ten IS NULL)) AND (([DiaChi] = @original_DiaChi) OR ([DiaChi] IS NULL AND @original_DiaChi IS NULL)) AND (([DienThoai] = @original_DienThoai) OR ([DienThoai] IS NULL AND @original_DienThoai IS NULL)) AND (([GioiTinh] = @original_GioiTinh) OR ([GioiTinh] IS NULL AND @original_GioiTinh IS NULL)) AND (([NgaySinh] = @original_NgaySinh) OR ([NgaySinh] IS NULL AND @original_NgaySinh IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_IDNV" Type="Int32" />
                    <asp:Parameter Name="original_Ten" Type="String" />
                    <asp:Parameter Name="original_DiaChi" Type="String" />
                    <asp:Parameter Name="original_DienThoai" Type="String" />
                    <asp:Parameter Name="original_GioiTinh" Type="String" />
                    <asp:Parameter DbType="Date" Name="original_NgaySinh" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Ten" Type="String" />
                    <asp:Parameter Name="DiaChi" Type="String" />
                    <asp:Parameter Name="DienThoai" Type="String" />
                    <asp:Parameter Name="GioiTinh" Type="String" />
                    <asp:Parameter DbType="Date" Name="NgaySinh" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Ten" Type="String" />
                    <asp:Parameter Name="DiaChi" Type="String" />
                    <asp:Parameter Name="DienThoai" Type="String" />
                    <asp:Parameter Name="GioiTinh" Type="String" />
                    <asp:Parameter DbType="Date" Name="NgaySinh" />
                    <asp:Parameter Name="original_IDNV" Type="Int32" />
                    <asp:Parameter Name="original_Ten" Type="String" />
                    <asp:Parameter Name="original_DiaChi" Type="String" />
                    <asp:Parameter Name="original_DienThoai" Type="String" />
                    <asp:Parameter Name="original_GioiTinh" Type="String" />
                    <asp:Parameter DbType="Date" Name="original_NgaySinh" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <h2>Thêm Nhân Viên</h2>
            <asp:FormView ID="FormView1" runat="server" CssClass="them" DefaultMode="Insert" DataKeyNames="IDNV" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                    IDNV:
                    <asp:Label ID="IDNVLabel1" runat="server" Text='<%# Eval("IDNV") %>' />
                    <br />
                    Ten:
                    <asp:TextBox ID="TenTextBox" runat="server" Text='<%# Bind("Ten") %>' />
                    <br />
                    DiaChi:
                    <asp:TextBox ID="DiaChiTextBox" runat="server" Text='<%# Bind("DiaChi") %>' />
                    <br />
                    DienThoai:
                    <asp:TextBox ID="DienThoaiTextBox" runat="server" Text='<%# Bind("DienThoai") %>' />
                    <br />
                    GioiTinh:
                    <asp:TextBox ID="GioiTinhTextBox" runat="server" Text='<%# Bind("GioiTinh") %>' />
                    <br />
                    NgaySinh:
                    <asp:TextBox ID="NgaySinhTextBox" runat="server" Text='<%# Bind("NgaySinh") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    Tên:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TenTextBox" runat="server" Text='<%# Bind("Ten") %>' />
                    <br />
                    <br />
                    Địa chỉ:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="DiaChiTextBox" runat="server" Text='<%# Bind("DiaChi") %>' />
                    <br />
                    <br />
                    Điện Thoại:
                    <asp:TextBox ID="DienThoaiTextBox" runat="server" Text='<%# Bind("DienThoai") %>' />
                    <br />
                    <br />
                    Giới Tính:&nbsp;&nbsp;
                    <asp:TextBox ID="GioiTinhTextBox" runat="server" Text='<%# Bind("GioiTinh") %>' />
                    <br />
                    <br />
                    Ngày Sinh:
                    <asp:TextBox ID="NgaySinhTextBox" runat="server" Text='<%# Bind("NgaySinh") %>' />
                    <br />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    IDNV:
                    <asp:Label ID="IDNVLabel" runat="server" Text='<%# Eval("IDNV") %>' />
                    <br />
                    Ten:
                    <asp:Label ID="TenLabel" runat="server" Text='<%# Bind("Ten") %>' />
                    <br />
                    DiaChi:
                    <asp:Label ID="DiaChiLabel" runat="server" Text='<%# Bind("DiaChi") %>' />
                    <br />
                    DienThoai:
                    <asp:Label ID="DienThoaiLabel" runat="server" Text='<%# Bind("DienThoai") %>' />
                    <br />
                    GioiTinh:
                    <asp:Label ID="GioiTinhLabel" runat="server" Text='<%# Bind("GioiTinh") %>' />
                    <br />
                    NgaySinh:
                    <asp:Label ID="NgaySinhLabel" runat="server" Text='<%# Bind("NgaySinh") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>

            </asp:FormView>






</asp:Content>
