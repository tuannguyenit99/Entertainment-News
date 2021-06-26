<%@ Page Title="Tài Khoản" Language="C#" MasterPageFile="~/TrangPhuDe.Master" AutoEventWireup="true" CodeBehind="QLTaiKhoan.aspx.cs" Inherits="TINTUCGIAITRI.QLTaiKhoan1" %>
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
  <br />
            <h2>Chi Tiết Tài Khoản</h2>
            <asp:GridView ID="GridView1" runat="server" CssClass="them" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IDTC" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="IDTC" HeaderText="IDTC" InsertVisible="False" ReadOnly="True" SortExpression="IDTC" />
                    <asp:BoundField DataField="IDNV" HeaderText="IDNV" SortExpression="IDNV" />
                    <asp:BoundField DataField="TaiKhoan" HeaderText="Tài Khoản" SortExpression="TaiKhoan" />
                    <asp:BoundField DataField="Pass" HeaderText="Mật Khẩu" SortExpression="Pass" />
                    <asp:BoundField DataField="QuyenTruyCap" HeaderText="Quyền" SortExpression="QuyenTruyCap" />
                    <asp:TemplateField HeaderText="Chức Năng" ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Hủy"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Sửa"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Xóa" OnClientClick="return confirm('Bạn sẽ tài khoản này')"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" DeleteCommand="DELETE FROM [QuyenTruyCap] WHERE [IDTC] = @original_IDTC AND [IDNV] = @original_IDNV AND (([TaiKhoan] = @original_TaiKhoan) OR ([TaiKhoan] IS NULL AND @original_TaiKhoan IS NULL)) AND (([Pass] = @original_Pass) OR ([Pass] IS NULL AND @original_Pass IS NULL)) AND (([QuyenTruyCap] = @original_QuyenTruyCap) OR ([QuyenTruyCap] IS NULL AND @original_QuyenTruyCap IS NULL))" InsertCommand="INSERT INTO [QuyenTruyCap] ([IDNV], [TaiKhoan], [Pass], [QuyenTruyCap]) VALUES (@IDNV, @TaiKhoan, @Pass, @QuyenTruyCap)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [QuyenTruyCap]" UpdateCommand="UPDATE [QuyenTruyCap] SET [IDNV] = @IDNV, [TaiKhoan] = @TaiKhoan, [Pass] = @Pass, [QuyenTruyCap] = @QuyenTruyCap WHERE [IDTC] = @original_IDTC AND [IDNV] = @original_IDNV AND (([TaiKhoan] = @original_TaiKhoan) OR ([TaiKhoan] IS NULL AND @original_TaiKhoan IS NULL)) AND (([Pass] = @original_Pass) OR ([Pass] IS NULL AND @original_Pass IS NULL)) AND (([QuyenTruyCap] = @original_QuyenTruyCap) OR ([QuyenTruyCap] IS NULL AND @original_QuyenTruyCap IS NULL))">
                 <DeleteParameters>
                     <asp:Parameter Name="original_IDTC" Type="Int32" />
                     <asp:Parameter Name="original_IDNV" Type="Int32" />
                     <asp:Parameter Name="original_TaiKhoan" Type="String" />
                     <asp:Parameter Name="original_Pass" Type="String" />
                     <asp:Parameter Name="original_QuyenTruyCap" Type="String" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="IDNV" Type="Int32" />
                     <asp:Parameter Name="TaiKhoan" Type="String" />
                     <asp:Parameter Name="Pass" Type="String" />
                     <asp:Parameter Name="QuyenTruyCap" Type="String" />
                 </InsertParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="IDNV" Type="Int32" />
                     <asp:Parameter Name="TaiKhoan" Type="String" />
                     <asp:Parameter Name="Pass" Type="String" />
                     <asp:Parameter Name="QuyenTruyCap" Type="String" />
                     <asp:Parameter Name="original_IDTC" Type="Int32" />
                     <asp:Parameter Name="original_IDNV" Type="Int32" />
                     <asp:Parameter Name="original_TaiKhoan" Type="String" />
                     <asp:Parameter Name="original_Pass" Type="String" />
                     <asp:Parameter Name="original_QuyenTruyCap" Type="String" />
                 </UpdateParameters>
             </asp:SqlDataSource>
            <br />
            <h2>
                Thêm Tài Khoản
            </h2>
            <asp:FormView ID="FormView1" runat="server" CssClass="them" DefaultMode="Insert" DataKeyNames="IDTC" DataSourceID="SqlDataSource1">
                 <EditItemTemplate>
                     IDTC:
                     <asp:Label ID="IDTCLabel1" runat="server" Text='<%# Eval("IDTC") %>' />
                     <br />
                     IDNV:
                     <asp:TextBox ID="IDNVTextBox" runat="server" Text='<%# Bind("IDNV") %>' />
                     <br />
                     TaiKhoan:
                     <asp:TextBox ID="TaiKhoanTextBox" runat="server" Text='<%# Bind("TaiKhoan") %>' />
                     <br />
                     Pass:
                     <asp:TextBox ID="PassTextBox" runat="server" Text='<%# Bind("Pass") %>' />
                     <br />
                     QuyenTruyCap:
                     <asp:TextBox ID="QuyenTruyCapTextBox" runat="server" Text='<%# Bind("QuyenTruyCap") %>' />
                     <br />
                     <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                     &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                 </EditItemTemplate>
                 <InsertItemTemplate>
                     IDNV:
                     <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Ten" DataValueField="IDNV" SelectedValue='<%# Bind("IDNV") %>'>
                     </asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="SELECT * FROM [NhanVien]"></asp:SqlDataSource>
                     <br />
                     <br />
                     Tài Khoản
                     <asp:TextBox ID="TaiKhoanTextBox" runat="server" Text='<%# Bind("TaiKhoan") %>' />
                     <br />
                     <br />
                     <br />
                     Mật Khẩu:
                     <asp:TextBox ID="PassTextBox" runat="server" Text='<%# Bind("Pass") %>' />
                     <br />
                     <br />
                     <br />
                     Quyền&nbsp;&nbsp; :
                     <asp:TextBox ID="QuyenTruyCapTextBox" runat="server" Text='<%# Bind("QuyenTruyCap") %>' />
                     <br />
                     <br />
                     <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                     &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                 </InsertItemTemplate>
                 <ItemTemplate>
                     IDTC:
                     <asp:Label ID="IDTCLabel" runat="server" Text='<%# Eval("IDTC") %>' />
                     <br />
                     IDNV:
                     <asp:Label ID="IDNVLabel" runat="server" Text='<%# Bind("IDNV") %>' />
                     <br />
                     TaiKhoan:
                     <asp:Label ID="TaiKhoanLabel" runat="server" Text='<%# Bind("TaiKhoan") %>' />
                     <br />
                     Pass:
                     <asp:Label ID="PassLabel" runat="server" Text='<%# Bind("Pass") %>' />
                     <br />
                     QuyenTruyCap:
                     <asp:Label ID="QuyenTruyCapLabel" runat="server" Text='<%# Bind("QuyenTruyCap") %>' />
                     <br />
                     <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                     &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                     &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                 </ItemTemplate>

             </asp:FormView>
</asp:Content>
