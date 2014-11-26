<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Тестовое задание Казун А.С.</title>
    </head>
<body>
    <h1>Веб-приложение</h1>
    <!--Enter a symbol of  tickets-->
    <form id="form1" runat="server">
        <div style="position:absolute;left:10px" >
        <asp:TextBox ID="txtbxTicket" runat="server" Width="57px"></asp:TextBox>
            <asp:Label ID="lblTicket" runat="server" Text=" Ticket"></asp:Label>
        </div>
     <!--Enter start date-->   
    <div style="position:absolute;left:200px">

         <asp:TextBox ID="txtbxStartDate" runat="server"></asp:TextBox>
         <asp:Button ID="btnStartDate" runat="server" Text="Start Date" OnClick="btnStartDate_Click" />
         <asp:Calendar ID="clndrStartDate" runat="server" Visible="False" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" OnSelectionChanged="clndrStartDate_SelectionChanged" Width="200px">
             <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
             <NextPrevStyle VerticalAlign="Bottom" />
             <OtherMonthDayStyle ForeColor="#808080" />
             <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
             <SelectorStyle BackColor="#CCCCCC" />
             <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
             <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
             <WeekendDayStyle BackColor="#FFFFCC" />
         </asp:Calendar>
           <!--Enter end date-->
            </div>
           <div style="position:absolute;left:500px">
        
         <asp:TextBox ID="txtbxEndDate" runat="server"></asp:TextBox>
         <asp:Button ID="btnEndDate" runat="server" Text="End Date" OnClick="btnEndDate_Click" />
         <asp:Calendar ID="clndrEndDate" runat="server" Visible="False" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" OnSelectionChanged="clndrEndDate_SelectionChanged" Width="200px">
             <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
             <NextPrevStyle VerticalAlign="Bottom" />
             <OtherMonthDayStyle ForeColor="#808080" />
             <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
             <SelectorStyle BackColor="#CCCCCC" />
             <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
             <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
             <WeekendDayStyle BackColor="#FFFFCC" />
               </asp:Calendar>
            </div>
        <div style="position:absolute;left:800px">
            <asp:Button  ID="btnGetQuotes" runat="server" Text="Get Quotes" OnClick="btnGetQuotes_Click"  />
        </div>   
               
        
    
            <div style="position:absolute;left:10px;top:200px;">
                <asp:Label ID="lblResult" runat="server" Text="Result"></asp:Label>
            </div>
        </form>
    </body>
</html>
