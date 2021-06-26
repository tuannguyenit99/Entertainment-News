<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TINTUCGIAITRI.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server">

            </asp:TextBox>
            <<asp:Button ID="Button1" runat="server" Text="Button" />
            <asp:DataList ID="DataList1" runat="server" DataKeyField="IDBangTin" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    IDBangTin:
                    <asp:Label ID="IDBangTinLabel" runat="server" Text='<%# Eval("IDBangTin") %>' />
                    <br />
                    TieuDe:
                    <asp:Label ID="TieuDeLabel" runat="server" Text='<%# Eval("TieuDe") %>' />
                    <br />
                    Anh:
                    <asp:Label ID="AnhLabel" runat="server" Text='<%# Eval("Anh") %>' />
                    <br />
                    NgayDang:
                    <asp:Label ID="NgayDangLabel" runat="server" Text='<%# Eval("NgayDang") %>' />
                    <br />
                    NoiDungChiTiet:
                    <asp:Label ID="NoiDungChiTietLabel" runat="server" Text='<%# Eval("NoiDungChiTiet") %>' />
                    <br />
                    LanXem:
                    <asp:Label ID="LanXemLabel" runat="server" Text='<%# Eval("LanXem") %>' />
                    <br />
                    IDNV:
                    <asp:Label ID="IDNVLabel" runat="server" Text='<%# Eval("IDNV") %>' />
                    <br />
                    IDTheLoai:
                    <asp:Label ID="IDTheLoaiLabel" runat="server" Text='<%# Eval("IDTheLoai") %>' />
                    <br />
                    TrangThai:
                    <asp:Label ID="TrangThaiLabel" runat="server" Text='<%# Eval("TrangThai") %>' />
                    <br />
<br />
                </ItemTemplate>

            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="SELECT * FROM [ChiTiet] WHERE ([TieuDe] LIKE '%' + @TieuDe + '%')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="TieuDe" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
