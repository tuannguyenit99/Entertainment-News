<%@ Page Title="Thống Kê" Language="C#" MasterPageFile="~/TrangPhuDe.Master" AutoEventWireup="true" CodeBehind="BaoCaoThongKe.aspx.cs" Inherits="TINTUCGIAITRI.BaoCaoThongKe1" %>
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
         .thumbnail img {
    width: 100%; 
    height: 100%;  
    transition-duration: 0.8s;
        /* Safari & Google Chrome */
        -webkit-transition-duration: 0.8s; 
        /* Mozilla Firefox */
        -moz-transition-duration: 0.8s; 
        /* Opera */
        -o-transition-duration: 0.8s;
        /* IE 9 */
        /*-ms-transition-duration: 0.8s;*/
}
         
/* Hover chuột vào thumbnail */
.thumbnail img:hover {
    transform: scale(1.2);
        /* Safari & Google Chrome */
        -webkit-transform: scale(1.2);
        /* Mozilla Firefox */
        -moz-transform: scale(1.2); 
        /* Opera */
        -o-transform: scale(1.2);
        /* IE 9 */
        -ms-transform: scale(1.2);
    cursor: pointer; 
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                        <a href="GiaoDienQuanLy.aspx" style="text-align:left;font-size:18px; color:blue; text-decoration:none"> Quay lại</a>
<br />
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
                <Series>
                    <asp:Series Name="Series1" ChartType="Pie" XValueMember="NgayDang" YValueMembers="LanXem" YValuesPerPoint="2"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="SELECT * FROM [ChiTiet]"></asp:SqlDataSource>
            <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource1">
                <Series>
                    <asp:Series Name="Series1" XValueMember="NgayDang" YValueMembers="LanXem"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            <h2>Biểu đồ thống kê giữa ngày đăng với lượt xem</h2>

             <asp:DataList ID="DataList1" runat="server" RepeatColumns="1" BorderColor="Yellow" DataKeyField="IDBangTin" DataSourceID="SqlDataSource2" CssClass="them">
     <HeaderStyle BackColor="Green" Font-Bold="True" Font-Italic="False" Font-Names=".Vn3DH" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" ForeColor="Fuchsia" HorizontalAlign="Left" VerticalAlign="Middle" />


                    <ItemTemplate>
                        <a href="TinTucGiaiTri.aspx?IDBangTin=<%# Eval("IDBangTin") %>&IDTheLoai=<%# Eval("IDTheLoai") %>" style="text-decoration:none">

                        <div class="thumbnail">
                        <asp:Image ID="Anh" runat="server" ImageUrl='<%#"~/Picture/"+Eval("anh") %>' Width="300px" Height="200px" />
                                </div>

                     
                        <b  style="color:#808080;font-size:13px;">
                         <asp:Label ID="Label2" runat="server" Text='<%# Eval("ngaydang")  %>' CssClass="ngay" />
                          </b>
                            <br />
                            <b style="color:#c015db;font-size:15px;">
                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("tieude") %>'  Width="333px" Height="50px"/>
                        </b>
                            </a>
                        <br />
                        <br />
                    </ItemTemplate>


                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="Select IDBangTin,TieuDe,Anh,NgayDang,TheLoai.IDTheLoai from ChiTiet inner join TheLoai on ChiTiet.IDTheLoai=TheLoai.IDTheLoai where lanxem=(select max(lanxem) from chitiet)"></asp:SqlDataSource>
                

            <h2>Bài đăng có nhiều lượt xem nhất</h2>

            <asp:DataList ID="DataList2" runat="server" RepeatColumns="1" BorderColor="Yellow" DataKeyField="IDBangTin" DataSourceID="SqlDataSource3" CssClass="them">
     <HeaderStyle BackColor="Green" Font-Bold="True" Font-Italic="False" Font-Names=".Vn3DH" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" ForeColor="Fuchsia" HorizontalAlign="Left" VerticalAlign="Middle" />


                    <ItemTemplate>
                        <a href="TinTucGiaiTri.aspx?IDBangTin=<%# Eval("IDBangTin") %>&IDTheLoai=<%# Eval("IDTheLoai") %>" style="text-decoration:none">

                        <div class="thumbnail">
                        <asp:Image ID="Anh" runat="server" ImageUrl='<%#"~/Picture/"+Eval("anh") %>' Width="300px" Height="200px" />
                                </div>

                     
                        <b  style="color:#808080;font-size:13px;">
                         <asp:Label ID="Label2" runat="server" Text='<%# Eval("ngaydang")  %>' CssClass="ngay" />
                          </b>
                            <br />
                            <b style="color:#c015db;font-size:15px;">
                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("tieude") %>'  Width="333px" Height="50px"/>
                        </b>
                            </a>
                        <br />
                        <br />
                    </ItemTemplate>


                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="Select IDBangTin,TieuDe,Anh,NgayDang,TheLoai.IDTheLoai from ChiTiet inner join TheLoai on ChiTiet.IDTheLoai=TheLoai.IDTheLoai where lanxem=(select min(lanxem) from chitiet)"></asp:SqlDataSource>
                


            <h2>Bài đăng có ít lượt xem nhất</h2>
            <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource1">
                <Series>
                    <asp:Series Name="Series1" ChartType="Radar" XValueMember="IDNV" YValueMembers="IDBangTin" YValuesPerPoint="2"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

           <h2>Độc giả có bài đăng nhiều nhất:<b style="color:#c015db"><asp:Label ID="Label3" runat="server" Text=""></asp:Label></b> </h2>
            <h2>Độc giả có bài đăng ít nhất: <b style="color:#c015db"><asp:Label ID="Label4" runat="server" Text=""></asp:Label></b>   </h2>
</asp:Content>
