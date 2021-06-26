<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="FeedBacks.aspx.cs" Inherits="TINTUCGIAITRI.FeedBacks" %>
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
         .kaka{
             text-decoration:none;
         }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <hr />
    <h2> Những Phản Hồi Về Bài Viết Của Bạn</h2>

    <asp:GridView ID="GridView1" runat="server" CssClass="them" AutoGenerateColumns="False" DataKeyNames="IDPH" DataSourceID="SqlDataSource1">
        <Columns>
          
            <asp:BoundField DataField="IDBangTin" HeaderText="ID Bảng Tin" SortExpression="IDBangTin" />
           
            <asp:BoundField DataField="ThongTin" HeaderText="Phản Hồi" SortExpression="ThongTin" />
          
              <asp:TemplateField ShowHeader="False" HeaderText="Nhất Trí Chỉnh Sửa">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false"  OnCommand="Delete"  CommandName="Duyet" Text="Nhất Trí  Chỉnh Sửa"  CommandArgument='<%# Bind("IDBangTin") %>' CssClass="kaka">

                    </asp:LinkButton>
                </ItemTemplate>
                <ItemStyle BackColor="White" Font-Size="Large" />
            </asp:TemplateField>



        </Columns>

    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="SELECT * FROM [FeedBacks] WHERE (([IDNV] = @IDNV) AND ([TrangThai] IS NULL)) ">
        <SelectParameters>
            <asp:SessionParameter Name="IDNV" SessionField="idnv" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <hr />
</asp:Content>
