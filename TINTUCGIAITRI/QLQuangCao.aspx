<%@ Page Title="Quảng Cáo" Language="C#" MasterPageFile="~/TrangPhuDe.Master" AutoEventWireup="true" CodeBehind="QLQuangCao.aspx.cs" Inherits="TINTUCGIAITRI.QLQuangCaoo" %>
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
    <a href="GiaoDienQuanLy.aspx" style="text-align:left;font-size:18px; color:blue; text-decoration:none"> Quay lại</a>

     <br />
            <h2>Chi Tiết Chạy Quảng Cáo</h2>
            <asp:GridView ID="GridView1" runat="server" CssClass="them" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IDQuangCao" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="IDQuangCao" HeaderText="ID Quảng Cáo" InsertVisible="False" ReadOnly="True" SortExpression="IDQuangCao" />
                    <asp:BoundField DataField="NoiDung" HeaderText="Tiêu đề" SortExpression="NoiDung" />
                    <asp:BoundField DataField="Video" HeaderText="Video" SortExpression="Video" />
                    <asp:BoundField DataField="Ngaychayquangcao" HeaderText="Ngày chạy" SortExpression="Ngaychayquangcao" />
                    <asp:BoundField DataField="Ngayhetquangcao" HeaderText="Ngày kết thúc" SortExpression="Ngayhetquangcao" />
                    <asp:TemplateField HeaderText="Chức Năng" ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Hủy"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Sửa"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Xóa" OnClientClick="return confirm('Bạn sẽ xóa quảng cáo này')"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" DeleteCommand="DELETE FROM [QuangCao] WHERE [IDQuangCao] = @original_IDQuangCao AND [NoiDung] = @original_NoiDung AND (([Video] = @original_Video) OR ([Video] IS NULL AND @original_Video IS NULL)) AND [Ngaychayquangcao] = @original_Ngaychayquangcao AND [Ngayhetquangcao] = @original_Ngayhetquangcao" InsertCommand="INSERT INTO [QuangCao] ([NoiDung], [Video], [Ngaychayquangcao], [Ngayhetquangcao]) VALUES (@NoiDung, @Video, @Ngaychayquangcao, @Ngayhetquangcao)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [QuangCao]" UpdateCommand="UPDATE [QuangCao] SET [NoiDung] = @NoiDung, [Video] = @Video, [Ngaychayquangcao] = @Ngaychayquangcao, [Ngayhetquangcao] = @Ngayhetquangcao WHERE [IDQuangCao] = @original_IDQuangCao AND [NoiDung] = @original_NoiDung AND (([Video] = @original_Video) OR ([Video] IS NULL AND @original_Video IS NULL)) AND [Ngaychayquangcao] = @original_Ngaychayquangcao AND [Ngayhetquangcao] = @original_Ngayhetquangcao">
                 <DeleteParameters>
                     <asp:Parameter Name="original_IDQuangCao" Type="Int32" />
                     <asp:Parameter Name="original_NoiDung" Type="String" />
                     <asp:Parameter Name="original_Video" Type="String" />
                     <asp:Parameter DbType="Date" Name="original_Ngaychayquangcao" />
                     <asp:Parameter DbType="Date" Name="original_Ngayhetquangcao" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="NoiDung" Type="String" />
                     <asp:Parameter Name="Video" Type="String" />
                     <asp:Parameter DbType="Date" Name="Ngaychayquangcao" />
                     <asp:Parameter DbType="Date" Name="Ngayhetquangcao" />
                 </InsertParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="NoiDung" Type="String" />
                     <asp:Parameter Name="Video" Type="String" />
                     <asp:Parameter DbType="Date" Name="Ngaychayquangcao" />
                     <asp:Parameter DbType="Date" Name="Ngayhetquangcao" />
                     <asp:Parameter Name="original_IDQuangCao" Type="Int32" />
                     <asp:Parameter Name="original_NoiDung" Type="String" />
                     <asp:Parameter Name="original_Video" Type="String" />
                     <asp:Parameter DbType="Date" Name="original_Ngaychayquangcao" />
                     <asp:Parameter DbType="Date" Name="original_Ngayhetquangcao" />
                 </UpdateParameters>
             </asp:SqlDataSource>
            <br />
            <h2>
                Thêm quảng cáo
            </h2>
            <asp:FormView ID="FormView1" runat="server" CssClass="them" DefaultMode="Insert" DataKeyNames="IDQuangCao" DataSourceID="SqlDataSource1" OnItemInserting="FormView1_ItemInserting">
                <EditItemTemplate>
                    IDQuangCao:
                    <asp:Label ID="IDQuangCaoLabel1" runat="server" Text='<%# Eval("IDQuangCao") %>' />
                    <br />
                    NoiDung:
                    <asp:TextBox ID="NoiDungTextBox" runat="server" Text='<%# Bind("NoiDung") %>' />
                    <br />
                    Video:
                    <asp:TextBox ID="VideoTextBox" runat="server" Text='<%# Bind("Video") %>' />
                    <br />
                    Ngaychayquangcao:
                    <asp:TextBox ID="NgaychayquangcaoTextBox" runat="server" Text='<%# Bind("Ngaychayquangcao") %>' />
                    <br />
                    Ngayhetquangcao:
                    <asp:TextBox ID="NgayhetquangcaoTextBox" runat="server" Text='<%# Bind("Ngayhetquangcao") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    Nội dung:
                    <asp:TextBox ID="NoiDungTextBox" runat="server" Text='<%# Bind("NoiDung") %>' />
                    <br />
                    <br />
                    Video:
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <br />
                    <br />
                    <br />
                    Ngày chạy:
                    <asp:TextBox ID="NgaychayquangcaoTextBox" runat="server" Text='<%# Bind("Ngaychayquangcao") %>' />
                    <br />
                    <br />
                    Ngày hết:&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="NgayhetquangcaoTextBox" runat="server" Text='<%# Bind("Ngayhetquangcao") %>' />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    IDQuangCao:
                    <asp:Label ID="IDQuangCaoLabel" runat="server" Text='<%# Eval("IDQuangCao") %>' />
                    <br />
                    NoiDung:
                    <asp:Label ID="NoiDungLabel" runat="server" Text='<%# Bind("NoiDung") %>' />
                    <br />
                    Video:
                    <asp:Label ID="VideoLabel" runat="server" Text='<%# Bind("Video") %>' />
                    <br />
                    Ngaychayquangcao:
                    <asp:Label ID="NgaychayquangcaoLabel" runat="server" Text='<%# Bind("Ngaychayquangcao") %>' />
                    <br />
                    Ngayhetquangcao:
                    <asp:Label ID="NgayhetquangcaoLabel" runat="server" Text='<%# Bind("Ngayhetquangcao") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>

            </asp:FormView>

</asp:Content>
