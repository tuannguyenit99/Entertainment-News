<%@ Page Title="Chi Tiết" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="TinTucGiaiTri.aspx.cs" Inherits="TINTUCGIAITRI.TinTucGiaiTri" %>
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

      .QuangCao{
             width:600px;
             text-align:left;
            
         }
      .vv{
          color:blue;   
      }
      p.vv{
    text-transform: uppercase;
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
    <script type="text/javascript">(function (d, t, e, m) {

            // Async Rating-Widget initialization.
            window.RW_Async_Init = function () {

                RW.init({
                    huid: "473470",
                    uid: "45d2c68ec17f48a431c5dafe2524d3b5",
                    options: { "style": "oxygen" }
                });
                RW.render();
            };
            // Append Rating-Widget JavaScript library.
            var rw, s = d.getElementsByTagName(e)[0], id = "rw-js",
                l = d.location, ck = "Y" + t.getFullYear() +
                    "M" + t.getMonth() + "D" + t.getDate(), p = l.protocol,
                f = ((l.search.indexOf("DBG=") > -1) ? "" : ".min"),
                a = ("https:" == p ? "secure." + m + "js/" : "js." + m);
            if (d.getElementById(id)) return;
            rw = d.createElement(e);
            rw.id = id; rw.async = true; rw.type = "text/javascript";
            rw.src = p + "//" + a + "external" + f + ".js?ck=" + ck;
            s.parentNode.insertBefore(rw, s);
        }(document, new Date(), "script", "rating-widget.com/"));</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h2><b style="font-weight:bold;font-size:30px;text-shadow: 5px 4px 6px silver;color:#9918f2;margin-left:-730px;">Chi Tiết Tin Tức </b>   </h2>

    
    <div class="thongtin">
            <div class="thongtin1">
                
              <div class="QuangCao">
                       <h3><a href="LienHeQuangCao.aspx" style="text-decoration:none; color:#ff6a00;margin-left:40px;">Liên hệ quảng cáo</a></h3>
        <asp:DataList ID="DataList3" runat="server" RepeatColumns ="1" DataKeyField="IDQuangCao" DataSourceID="SqlDataSource3">
            <ItemTemplate>
                </div>
            <div style="width:100%; height:30px; background-color:none; margin-top:-10px;margin-left:38px;">
                          <marquee direction="left" ><strong style="color:#22e143">  <asp:Label ID="NoiDungLabel" runat="server" Text='<%# Eval("NoiDung") %>' />    </strong></marquee>  
                <br />
                
                         

            </div>
            </div>
                 
                            
                             <video src='<%#"~/Video/"+Eval("Video") %>'  autoplay runat="server" width="600" height="300" />
                            
                           
            </ItemTemplate>

        </asp:DataList>

                       <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="SELECT TOP 1 * FROM QuangCao  where ngaychayquangcao <= getDate() and getDate() <= ngayhetquangcao ORDER BY NEWID()"></asp:SqlDataSource>

                    </div>
                <br />
                 
                <hr />


                <asp:DataList ID="DataList1" runat="server" RepeatColumns="1" BorderColor="Yellow" DataKeyField="IDBangTin" DataSourceID="SqlDataSource1">
     <HeaderStyle BackColor="Green" Font-Bold="True" Font-Italic="False" Font-Names=".Vn3DH" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" ForeColor="Fuchsia" HorizontalAlign="Left" VerticalAlign="Middle" />


                    <ItemTemplate>
                       
                        <h2 style="color:#808080;text-align:left"><b>
                           
                        &nbsp;<asp:Label ID="tieudeLabel" runat="server" Text='<%# Eval("tieude") %>' />
                            </b></h2>
                        <p style="text-align:left">
                        &nbsp;<asp:Label ID="noidungLabel" runat="server" Text='<%# Eval("noidungchitiet") %>' Width="600px" />
                      </p>
                        
                      
                      
                       
                        <asp:Image ID="Anh" runat="server" ImageUrl='<%#"~/Picture/"+Eval("anh") %>' Width="650px" Height="400px" />
                        <br />
                      
                          <p style="color:#fa1dbf;font-size:18px;text-align:left">
                        Lượt xem:
                        <asp:Label ID="cc" runat="server" Text='<%# Eval("lanxem") %>' />
                              </p>
                       <p style="color:#ff6a00;font-size:14px;text-align:left">
                        Ngày đăng:
                        <asp:Label ID="ngaycapnhatLabel" runat="server" Text='<%# Eval("ngaydang") %>' />
                            </p>
                        
  
                       
                       <h2 style="color:#ba2612;text-align:left"> Đánh Giá 
                         <br />
                           <br />
                     <div class="rw-ui-container"></div>
                        </h2>
                        <br />
                        <hr />
                    </ItemTemplate>

                   




                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="Select IDBangTin,TieuDe,Anh,NgayDang,TheLoai.IDTheLoai,Lanxem,NoiDungChiTiet from ChiTiet inner join TheLoai on ChiTiet.IDTheLoai=TheLoai.IDTheLoai where IDBangTin=@IDBangTin">
                    <SelectParameters>
                       <asp:QueryStringParameter Name="IDBangTin" Type="Int32" QueryStringField="IDBangTin"   />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                 <h1 style="text-align:left;color:#808080">  Bài viết liên quan </h1>

                 <asp:DataList ID="DataList5" runat="server" RepeatColumns="1" BorderColor="Yellow" DataKeyField="IDBangTin" DataSourceID="SqlDataSource5" >
     <HeaderStyle BackColor="Green" Font-Bold="True" Font-Italic="False" Font-Names=".Vn3DH" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" ForeColor="Fuchsia" HorizontalAlign="Left" VerticalAlign="Middle" />


                    <ItemTemplate>
                        <a href="TinTucGiaiTri.aspx?IDBangTin=<%# Eval("IDBangTin") %>&IDTheLoai=<%# Eval("IDTheLoai") %>" style="text-decoration:none">

                      
                    <ul>
                        <li> <b style="color:#e59a23;font-size:15px; text-align:left;">
                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("tieude") %>'  Width="666px" Height="20px"/>
                        </b></li>
                    </ul>
                           
                            </a>
                       
                  
                    </ItemTemplate>


                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="Select  top 3 IDBangTin,TieuDe,Anh,NgayDang,TheLoai.IDTheLoai,lanxem from ChiTiet inner join TheLoai on ChiTiet.IDTheLoai=TheLoai.IDTheLoai where ChiTiet.IDTheLoai=@IDTheLoai AND (ChiTiet.TrangThai is not null) order by lanxem desc ">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="IDTheLoai" QueryStringField="IDTheLoai"  Type="Int32"/>
                    </SelectParameters>

                </asp:SqlDataSource>
                
                
                <br />
                <hr />
                <br />
                 <br />



                 <%-- Bình Luận--%>
               
                        <p style="font-size:20px;color:#122bee">Bình Luận</p>
          <p style="text-align:left">
                <asp:TextBox ID="txtbl" runat="server" Height="40px" Width="177px"></asp:TextBox> &nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button1" runat="server" Text="Bình Luận" OnClick="Button1_Click"  />

          </p>
                <hr />
                <br />
    <asp:DataList ID="DataList4" runat="server" RepeatColumns="1" CssClass="bl" DataSourceID="SqlDataSource4" AutoPostBack="true" BorderColor="#0099CC">
        <ItemTemplate>
            <br />
            <p class="vv">
            <asp:Label ID="TaiKhoanLabel" runat="server" Text='<%# Eval("TaiKhoan") %>' />
                </p>
            
            
            <p style="color:#0c0d0d">
             
                <i>
            <asp:Label ID="NoiDungBLLabel" runat="server" Text='<%# Eval("NoiDungBL") %>' />
                    </i>
                </p>
            
<br />
        </ItemTemplate>

    </asp:DataList>


     <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="SELECT BinhLuan.TaiKhoan, BinhLuan.NoiDungBL FROM BinhLuan INNER JOIN BinhLuanChung ON BinhLuan.IDBL = BinhLuanChung.IDBL INNER JOIN ChiTiet ON ChiTiet.IDBangTin = BinhLuanChung.IDBangTin WHERE (BinhLuanChung.IDBangTin = @IDBangTin)">
         <SelectParameters>
             <asp:QueryStringParameter Name="IDBangTin" QueryStringField="IDBangTin" />
         </SelectParameters>
     </asp:SqlDataSource>

    
                <hr />



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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TTTN_TINTUCGIAITRIConnectionString %>" SelectCommand="Select top 10 IDBangTin,TieuDe,Anh,NgayDang,TheLoai.IDTheLoai from ChiTiet inner join TheLoai on ChiTiet.IDTheLoai=TheLoai.IDTheLoai where  (ChiTiet.TrangThai is not null) order by NgayDang desc "></asp:SqlDataSource>
                


              
             </div>
            </div>


</asp:Content>


