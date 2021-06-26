<%@ Page Title="Du lịch" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="DuLich.aspx.cs" Inherits="TINTUCGIAITRI.DuLich" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
         .thongtin{
          display:flex;
      }
      .thongtin1{
          width:68%;
      }
      .thongtin2{
          width:32%;
      }





/* Thumbnail */
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




 
/* Thumbnail */
.thumbnail1 img {
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
.thumbnail1 img:hover {
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
     <h2><b style="font-weight:bold;font-size:30px;text-shadow: 5px 4px 6px silver;color:#9918f2;margin-left:-730px;">Tin Tức Du Lịch </b>   </h2>
    <div style="margin-left:850px">
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="hihi">
            <asp:ListItem Value="1">Du Lịch</asp:ListItem>
            <asp:ListItem Value="2">3 Tin  Hot Nhất</asp:ListItem>
            <asp:ListItem Value="3">3 Tin Mới Nhất</asp:ListItem>

        </asp:DropDownList>
    </div>
    
    <div class="thongtin">
            <div class="thongtin1">
                <br />

            

                <asp:DataList ID="DataList1" runat="server" RepeatColumns="2" BorderColor="Yellow" DataKeyField="IDBangTin" DataSourceID="SqlDataSource1">
     <HeaderStyle BackColor="Green" Font-Bold="True" Font-Italic="False" Font-Names=".Vn3DH" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" ForeColor="Fuchsia" HorizontalAlign="Left" VerticalAlign="Middle" />


                    <ItemTemplate>
                        <a href="TinTucGiaiTri.aspx?IDBangTin=<%# Eval("IDBangTin") %>&IDTheLoai=<%# Eval("IDTheLoai") %>" style="text-decoration:none">

                        <div class="thumbnail">
                        <asp:Image ID="Anh" runat="server" ImageUrl='<%#"~/Picture/"+Eval("anh") %>' Width="300px" Height="200px" />
                                </div>

                     
                        <b  style="color:#808080;font-size:13px;">
                         <asp:Label ID="Label2" runat="server" Text='<%# Eval("ngaydang")  %>' CssClass="ngay" />
                          </b>
                            <b style="color:#c015db;font-size:15px;">
                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("tieude") %>'  Width="333px" Height="50px"/>
                        </b>
                            </a>
                        <br />
                        <br />
                    </ItemTemplate>


                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="Select IDBangTin,TieuDe,Anh,NgayDang,TheLoai.IDTheLoai from ChiTiet inner join TheLoai on ChiTiet.IDTheLoai=TheLoai.IDTheLoai where ChiTiet.IDTheLoai=7 AND (ChiTiet.TrangThai is not null) order by ngaydang desc"></asp:SqlDataSource>
                

                 
                <asp:DataList ID="DataList3" runat="server" RepeatColumns="2" BorderColor="Yellow" DataKeyField="IDBangTin" DataSourceID="SqlDataSource3" Visible="false">
     <HeaderStyle BackColor="Green" Font-Bold="True" Font-Italic="False" Font-Names=".Vn3DH" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" ForeColor="Fuchsia" HorizontalAlign="Left" VerticalAlign="Middle" />


                    <ItemTemplate>
                        <a href="TinTucGiaiTri.aspx?IDBangTin=<%# Eval("IDBangTin") %>&IDTheLoai=<%# Eval("IDTheLoai") %>" style="text-decoration:none">

                        <div class="thumbnail">
                        <asp:Image ID="Anh" runat="server" ImageUrl='<%#"~/Picture/"+Eval("anh") %>' Width="300px" Height="200px" />
                                </div>

                     
                        <b  style="color:#808080;font-size:13px;">
                         <asp:Label ID="Label2" runat="server" Text='<%# Eval("ngaydang")  %>' CssClass="ngay" />
                          </b>
                            <b style="color:#c015db;font-size:15px;">
                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("tieude") %>'  Width="333px" Height="50px"/>
                        </b>
                            </a>
                        <br />
                        <br />
                    </ItemTemplate>


                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="Select  top 3 IDBangTin,TieuDe,Anh,NgayDang,TheLoai.IDTheLoai,lanxem from ChiTiet inner join TheLoai on ChiTiet.IDTheLoai=TheLoai.IDTheLoai where ChiTiet.IDTheLoai=7 AND (ChiTiet.TrangThai is not null) order by lanxem desc "></asp:SqlDataSource>
                
                

                 <asp:DataList ID="DataList4" runat="server" RepeatColumns="2" BorderColor="Yellow" DataKeyField="IDBangTin" DataSourceID="SqlDataSource4" Visible="false">
     <HeaderStyle BackColor="Green" Font-Bold="True" Font-Italic="False" Font-Names=".Vn3DH" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" ForeColor="Fuchsia" HorizontalAlign="Left" VerticalAlign="Middle" />


                    <ItemTemplate>
                        <a href="TinTucGiaiTri.aspx?IDBangTin=<%# Eval("IDBangTin") %>&IDTheLoai=<%# Eval("IDTheLoai") %>" style="text-decoration:none">

                        <div class="thumbnail">
                        <asp:Image ID="Anh" runat="server" ImageUrl='<%#"~/Picture/"+Eval("anh") %>' Width="300px" Height="200px" />
                                </div>

                     
                        <b  style="color:#808080;font-size:13px;">
                         <asp:Label ID="Label2" runat="server" Text='<%# Eval("ngaydang")  %>' CssClass="ngay" />
                          </b>
                            <b style="color:#c015db;font-size:15px;">
                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("tieude") %>'  Width="333px" Height="50px"/>
                        </b>
                            </a>
                        <br />
                        <br />
                    </ItemTemplate>


                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="SELECT TOP (3) ChiTiet.IDBangTin, ChiTiet.TieuDe, ChiTiet.Anh, ChiTiet.NgayDang, TheLoai.IDTheLoai, ChiTiet.LanXem FROM ChiTiet INNER JOIN TheLoai ON ChiTiet.IDTheLoai = TheLoai.IDTheLoai WHERE (ChiTiet.IDTheLoai = 7) AND (ChiTiet.TrangThai is not null) ORDER BY ChiTiet.NgayDang DESC"></asp:SqlDataSource>
                





            </div>
        
             <div class="thongtin2">
                
                <br />
                <asp:DataList ID="DataList2" runat="server" RepeatColumns="1" BorderColor="Yellow" DataKeyField="IDBangTin" DataSourceID="SqlDataSource2">
     <HeaderStyle BackColor="Green" Font-Bold="True" Font-Italic="False" Font-Names=".Vn3DH" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" ForeColor="Fuchsia" HorizontalAlign="Left" VerticalAlign="Middle" />


                    <ItemTemplate>
                        <a href="TinTucGiaiTri.aspx?IDBangTin=<%# Eval("IDBangTin") %>&IDTheLoai=<%# Eval("IDTheLoai") %>" style="text-decoration:none">
                             <div style="display:flex">
                        <div class="thumbnail1">
                      <asp:Image ID="Anh" runat="server" ImageUrl='<%#"~/Picture/"+Eval("anh") %>' Width="133px" Height="100px" />
                              </div>
                          <div style="margin-left:10px">
                              <b style="color:#eb6a08;font-size:12px;">
                              <asp:Label ID="noidungLabel" runat="server" Text='<%# Eval("tieude") %>' Width="200px" Height="50px" />
                                  </b>
                          </div>
                          </div>
                           
                        <b  style="color:#808080;font-size:13px;margin-left:-125px;">
                       Ngày Đăng
                      &nbsp;<asp:Label ID="ngayLabel" runat="server" Text='<%# Eval("ngaydang")  %>' CssClass="ngay" />
                          </b>
                     </a>
                    
                      <br />
                      <hr />
<br />
                    </ItemTemplate>


                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="SELECT TOP (10) ChiTiet.IDBangTin, ChiTiet.TieuDe, ChiTiet.Anh, ChiTiet.NgayDang, TheLoai.IDTheLoai FROM ChiTiet INNER JOIN TheLoai ON ChiTiet.IDTheLoai = TheLoai.IDTheLoai AND (ChiTiet.TrangThai is not null) ORDER BY ChiTiet.NgayDang DESC"></asp:SqlDataSource>
                


              
             </div>
            </div>




</asp:Content>
