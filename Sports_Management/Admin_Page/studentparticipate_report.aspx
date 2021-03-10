<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentparticipate_report.aspx.cs" Inherits="Admin_Page_studentparticipate_report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .printbutton {
            height: 68px;
            width: 124px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:Label ID="Label1" runat="server" Font-Size="X-Large" style="font-weight: 700" Text="Student Praticipate Report"></asp:Label>
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="329px" Width="1352px">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Student_Id" HeaderText="Student_Id" SortExpression="Student_Id" />
                <asp:BoundField DataField="Event_Id" HeaderText="Event_Id" SortExpression="Event_Id" />
                <asp:BoundField DataField="Participate_On" HeaderText="Participate_On" SortExpression="Participate_On" />
                <asp:BoundField DataField="Mark_Attendance" HeaderText="Mark_Attendance" SortExpression="Mark_Attendance" />
                <asp:BoundField DataField="Mark_Attendance_On" HeaderText="Mark_Attendance_On" SortExpression="Mark_Attendance_On" />
                <asp:BoundField DataField="Round_In" HeaderText="Round_In" SortExpression="Round_In" />
                <asp:BoundField DataField="Round_In_On" HeaderText="Round_In_On" SortExpression="Round_In_On" />
                <asp:BoundField DataField="Winner_No" HeaderText="Winner_No" SortExpression="Winner_No" />
                <asp:BoundField DataField="Winner_Declare_On" HeaderText="Winner_Declare_On" SortExpression="Winner_Declare_On" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <br />
        <img align="top" alt="Print" class="printbutton" enableviewstate="True" onclick="javascript:window.print();" src="../Design/images/print.png" /><br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sports_ManagementConnectionString2 %>" SelectCommand="SELECT * FROM [tbl_Student_Participate_Event]"></asp:SqlDataSource>
    </form>
</body>
</html>
