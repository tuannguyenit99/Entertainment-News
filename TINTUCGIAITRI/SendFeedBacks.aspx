<%@ Page Title="" Language="C#" MasterPageFile="~/TrangNhanVien.Master" AutoEventWireup="true" CodeBehind="SendFeedBacks.aspx.cs" Inherits="TINTUCGIAITRI.SendFeedBacks" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET"  TagPrefix="CKEditor" %>
<%@ Register Assembly="CKFinder" Namespace="CKFinder"  TagPrefix="CKFinder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
                 
                  text-align:center;
                  margin:auto;
        }
        .Them{
            margin:auto;
            width:1000px;
            
        }
         .tieude{
            color:#187a1d;
            font-size:30px;
            
            
        }
         .hihi{
             background-color:none;
             color:#0c1cd0;
             font-size:25px;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />

    <h3>
        Gửi Phản Hồi Về Bài Viết
    </h3>
    <br />
    <hr />
    <br />
    <asp:FormView ID="FormView1" runat="server" CssClass="Them" DataKeyNames="IDPH" DataSourceID="SqlDataSource1" DefaultMode="Insert">
        <EditItemTemplate>
            IDPH:
            <asp:Label ID="IDPHLabel1" runat="server" Text='<%# Eval("IDPH") %>' />
            <br />
            IDBangTin:
            <asp:TextBox ID="IDBangTinTextBox" runat="server" Text='<%# Bind("IDBangTin") %>' />
            <br />
            IDNV:
            <asp:TextBox ID="IDNVTextBox" runat="server" Text='<%# Bind("IDNV") %>' />
            <br />
            ThongTin:
            <asp:TextBox ID="ThongTinTextBox" runat="server" Text='<%# Bind("ThongTin") %>' />
            <br />
            TrangThai:
            <asp:TextBox ID="TrangThaiTextBox" runat="server" Text='<%# Bind("TrangThai") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            
            <asp:TextBox ID="IDBangTinTextBox" runat="server" Text='<%# Bind("IDBangTin") %>' Visible="false" />
            <br />
           
            <asp:TextBox ID="IDNVTextBox" runat="server" Text='<%# Bind("IDNV") %>' Visible="false" />
            <br />
            Nội Dung
            <br />
            <CKEditor:CKEditorControl  ID="CKEditorControl1" runat="server"  Height="278px" Width="1000px" Text='<%# Bind("ThongTin") %>' >

                  </CKEditor:CKEditorControl>


           
            <br />
            
            <asp:TextBox ID="TrangThaiTextBox" runat="server" Text='<%# Bind("TrangThai") %>'  Visible="false"/>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Gửi" CssClass="hihi" />
          
        </InsertItemTemplate>
        <ItemTemplate>
            IDPH:
            <asp:Label ID="IDPHLabel" runat="server" Text='<%# Eval("IDPH") %>' />
            <br />
            IDBangTin:
            <asp:Label ID="IDBangTinLabel" runat="server" Text='<%# Bind("IDBangTin") %>' />
            <br />
            IDNV:
            <asp:Label ID="IDNVLabel" runat="server" Text='<%# Bind("IDNV") %>' />
            <br />
            ThongTin:
            <asp:Label ID="ThongTinLabel" runat="server" Text='<%# Bind("ThongTin") %>' />
            <br />
            TrangThai:
            <asp:Label ID="TrangThaiLabel" runat="server" Text='<%# Bind("TrangThai") %>' />
            <br />

        </ItemTemplate>

    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="SELECT * FROM [FeedBacks]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [FeedBacks] WHERE [IDPH] = @original_IDPH AND (([IDBangTin] = @original_IDBangTin) OR ([IDBangTin] IS NULL AND @original_IDBangTin IS NULL)) AND (([IDNV] = @original_IDNV) OR ([IDNV] IS NULL AND @original_IDNV IS NULL)) AND (([ThongTin] = @original_ThongTin) OR ([ThongTin] IS NULL AND @original_ThongTin IS NULL)) AND (([TrangThai] = @original_TrangThai) OR ([TrangThai] IS NULL AND @original_TrangThai IS NULL))" InsertCommand="INSERT INTO [FeedBacks] ([IDBangTin], [IDNV], [ThongTin], [TrangThai]) VALUES (@IDBangTin, @IDNV, @ThongTin, @TrangThai)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [FeedBacks] SET [IDBangTin] = @IDBangTin, [IDNV] = @IDNV, [ThongTin] = @ThongTin, [TrangThai] = @TrangThai WHERE [IDPH] = @original_IDPH AND (([IDBangTin] = @original_IDBangTin) OR ([IDBangTin] IS NULL AND @original_IDBangTin IS NULL)) AND (([IDNV] = @original_IDNV) OR ([IDNV] IS NULL AND @original_IDNV IS NULL)) AND (([ThongTin] = @original_ThongTin) OR ([ThongTin] IS NULL AND @original_ThongTin IS NULL)) AND (([TrangThai] = @original_TrangThai) OR ([TrangThai] IS NULL AND @original_TrangThai IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_IDPH" Type="Int32" />
            <asp:Parameter Name="original_IDBangTin" Type="Int32" />
            <asp:Parameter Name="original_IDNV" Type="Int32" />
            <asp:Parameter Name="original_ThongTin" Type="String" />
            <asp:Parameter Name="original_TrangThai" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="IDBangTin" Type="Int32" />
            <asp:Parameter Name="IDNV" Type="Int32" />
            <asp:Parameter Name="ThongTin" Type="String" />
            <asp:Parameter Name="TrangThai" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="IDBangTin" Type="Int32" />
            <asp:Parameter Name="IDNV" Type="Int32" />
            <asp:Parameter Name="ThongTin" Type="String" />
            <asp:Parameter Name="TrangThai" Type="Int32" />
            <asp:Parameter Name="original_IDPH" Type="Int32" />
            <asp:Parameter Name="original_IDBangTin" Type="Int32" />
            <asp:Parameter Name="original_IDNV" Type="Int32" />
            <asp:Parameter Name="original_ThongTin" Type="String" />
            <asp:Parameter Name="original_TrangThai" Type="Int32" />
        </UpdateParameters>
    
    </asp:SqlDataSource>
    <br />
</asp:Content>
